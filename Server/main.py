import discord
from discord.ext import commands
import datetime
import gspread
from oauth2client.service_account import ServiceAccountCredentials
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Bot configuration
intents = discord.Intents.default()
intents.message_content = True
intents.members = True
bot = commands.Bot(command_prefix='!', intents=intents)

# Discord channel IDs
CLAIM_CHANNEL_ID = int(os.getenv('CLAIM_CHANNEL_ID'))  # #ct-claim channel
LIST_CHANNEL_ID = int(os.getenv('LIST_CHANNEL_ID'))  # #ct-list channel
LOG_CHANNEL_ID = int(os.getenv('LOG_CHANNEL_ID'))  # #claim-logs channel
MC_NAME_CHANNEL_ID = int(os.getenv('MC_NAME_CHANNEL_ID'))  # #mc-user channel

# Discord role IDs - Add these to your .env file
JUJUTSU_SORCERER_ROLE_ID = int(os.getenv('JUJUTSU_SORCERER_ROLE_ID', 0))
CURSE_USER_ROLE_ID = int(os.getenv('CURSE_USER_ROLE_ID', 0))
CURSED_SPIRIT_ROLE_ID = int(os.getenv('CURSED_SPIRIT_ROLE_ID', 0))
NON_SORCERER_ROLE_ID = int(os.getenv('NON_SORCERER_ROLE_ID', 0))

# Role mapping
FACTION_ROLE_IDS = {
    "JujutsuSorcerer": JUJUTSU_SORCERER_ROLE_ID,
    "CurseUser": CURSE_USER_ROLE_ID,
    "CursedSpirit": CURSED_SPIRIT_ROLE_ID,
    "NonSorcerer": NON_SORCERER_ROLE_ID
}

# Google Sheets setup
scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('credentials.json', scope)
sheets_client = gspread.authorize(creds)

# Try to open the Google Sheet, create it if it doesn't exist
try:
    spreadsheet = sheets_client.open('JJK_Claims')
    sheet = spreadsheet.sheet1

    # Check if we need to add the slots configuration sheet
    try:
        slots_sheet = spreadsheet.worksheet('CharacterSlots')
    except gspread.exceptions.WorksheetNotFound:
        slots_sheet = spreadsheet.add_worksheet(title='CharacterSlots', rows=100, cols=2)
        slots_sheet.append_row(['Character', 'Slots'])
except gspread.exceptions.SpreadsheetNotFound:
    print("Creating new JJK_Claims spreadsheet...")
    spreadsheet = sheets_client.create('JJK_Claims')
    sheet = spreadsheet.sheet1
    sheet.append_row(['Character', 'User ID', 'Username', 'Minecraft Name', 'Timestamp'])

    # Create the slots configuration sheet
    slots_sheet = spreadsheet.add_worksheet(title='CharacterSlots', rows=100, cols=2)
    slots_sheet.append_row(['Character', 'Slots'])

# Character data with factions
CHARACTER_FACTION = {
    "Gojo": "JujutsuSorcerer",
    "Nanami": "JujutsuSorcerer",
    "Higuruma": "JujutsuSorcerer",
    "Sukuna": "CursedSpirit",
    "NonSorcerer": "NonSorcerer",
    "Itadori": "JujutsuSorcerer",
    "Ino": "JujutsuSorcerer",
    "Dhruv": "CursedSpirit",
    "Uraume": "CursedSpirit",
    "Yoshino": "CursedSpirit",
    "Megumi": "JujutsuSorcerer",
    "Meimei": "JujutsuSorcerer",
    "Kurourushi": "CursedSpirit",
    "Geto": "CurseUser",
    "Miguel": "JujutsuSorcerer",
    "Nobara": "JujutsuSorcerer",
    "Kusakabe": "JujutsuSorcerer",
    "Uro": "CurseUser",
    "Hanami": "CursedSpirit",
    "Mahoraga": "CursedSpirit",
    "Inumaki": "JujutsuSorcerer",
    "Yaga": "JujutsuSorcerer",
    "Ishigori": "CurseUser",
    "Dagon": "CursedSpirit",
    "Maki": "JujutsuSorcerer",
    "Tsukumo": "JujutsuSorcerer",
    "Kashimo": "CurseUser",
    "Jogo": "CursedSpirit",
    "Okkotsu": "JujutsuSorcerer",
    "Ogi": "CurseUser",
    "Takaba": "JujutsuSorcerer",
    "Mahito": "CursedSpirit",
    "Hakari": "JujutsuSorcerer",
    "Chojuro": "CurseUser",
    "Angel": "JujutsuSorcerer",
    "Choso": "CurseUser",
    "Nishimiya": "JujutsuSorcerer",
    "Jinichi": "CurseUser",
    "Yorozu": "CursedSpirit",
    "SmallDeity": "CursedSpirit",
    "Todo": "JujutsuSorcerer",
    "Naoya": "CursedSpirit",
    "Rozetsu": "CurseUser",
}

# Character slots with default values (will be overridden by data from Google Sheet)
CHARACTER_SLOTS = {character: 1 for character in CHARACTER_FACTION}
# Set NonSorcerer to infinite slots (represented by -1)
CHARACTER_SLOTS["NonSorcerer"] = -1

# Claims dictionary to store who claimed what
claims = {}

# Dictionary to store Minecraft usernames
minecraft_usernames = {}


@bot.event
async def on_ready():
    print(f'Bot is online as {bot.user.name}')
    await load_character_slots()
    await load_existing_claims()
    await load_minecraft_usernames()
    await update_ct_list()
    print(f'Loaded {len(claims)} character claims and {len(minecraft_usernames)} Minecraft usernames')


async def load_character_slots():
    # Load character slots from the separate sheet
    try:
        slots_data = slots_sheet.get_all_records()
        for record in slots_data:
            character = record.get('Character')
            slots = record.get('Slots')
            if character and slots is not None:
                CHARACTER_SLOTS[character] = int(slots)
    except Exception as e:
        print(f"Error loading character slots: {e}")


async def load_existing_claims():
    # Load claims from Google Sheet
    records = sheet.get_all_records()
    for record in records:
        character = record.get('Character')
        user_id = record.get('User ID')
        timestamp = record.get('Timestamp')
        minecraft_name = record.get('Minecraft Name')

        if character and user_id:
            if character not in claims:
                claims[character] = []

            # Allow unlimited claims if slots is -1
            max_slots = CHARACTER_SLOTS.get(character, 1)
            if max_slots == -1 or len(claims[character]) < max_slots:
                claims[character].append({
                    'user_id': str(user_id),
                    'timestamp': timestamp,
                    'minecraft_name': minecraft_name
                })

                # Also update minecraft_usernames dictionary
                minecraft_usernames[str(user_id)] = minecraft_name


async def load_minecraft_usernames():
    # This is already done in load_existing_claims
    # Additional loading from a separate worksheet could be added here if needed
    pass


async def update_character_slots():
    # Update slots in Google Sheet
    slots_sheet.clear()
    slots_sheet.append_row(['Character', 'Slots'])

    for character, slots in CHARACTER_SLOTS.items():
        slots_sheet.append_row([character, slots])


@bot.event
async def on_message(message):
    # Skip messages from the bot itself
    if message.author == bot.user:
        return

    # Process commands
    await bot.process_commands(message)

    # Handle Minecraft username registration
    if message.channel.id == MC_NAME_CHANNEL_ID:
        await handle_minecraft_username(message)
        return

    # Handle character claims
    if message.channel.id == CLAIM_CHANNEL_ID:
        await handle_character_claim(message)
        return


async def handle_minecraft_username(message):
    # Process Minecraft username registration
    content = message.content.strip()

    # Check if the message is just a username (no spaces or special characters)
    if not content or ' ' in content or len(content) > 16:
        await message.delete()
        response = await message.channel.send(
            f"{message.author.mention}, please enter a valid Minecraft username (no spaces, max 16 characters).")
        await response.delete(delay=10)
        return

    user_id = str(message.author.id)
    old_name = minecraft_usernames.get(user_id)
    minecraft_usernames[user_id] = content

    # Update any existing claims with the new Minecraft name
    for character, char_claims in claims.items():
        for i, claim in enumerate(claims[character]):
            if claim['user_id'] == user_id:
                claims[character][i]['minecraft_name'] = content

                # Update in Google Sheet
                records = sheet.get_all_records()
                for j, record in enumerate(records):
                    if (record.get('Character') == character and
                            str(record.get('User ID')) == user_id):
                        # Update the cell (+2 for header row and 1-indexing)
                        sheet.update_cell(j + 2, 4, content)
                        break

    # Set nickname to Minecraft username
    try:
        await message.author.edit(nick=content)
        if old_name:
            await message.channel.send(
                f"{message.author.mention}, your Minecraft username has been updated from '{old_name}' to '{content}'.")
        else:
            await message.channel.send(
                f"{message.author.mention}, your Minecraft username has been set to '{content}'.")
    except discord.Forbidden:
        await message.channel.send(f"{message.author.mention}, I don't have permission to change your nickname.")
    except Exception as e:
        await message.channel.send(f"{message.author.mention}, an error occurred: {str(e)}")

    # Delete the message to keep the channel clean
    await message.delete()

    # Update character list to reflect any name changes
    await update_ct_list()


async def handle_character_claim(message):
    # Process character claim
    content = message.content.strip()

    # Check if the message is a single word (character name)
    if ' ' in content:
        await message.delete()
        response = await message.channel.send(f"{message.author.mention}, please only use a single character name.")
        await response.delete(delay=10)
        return

    character = content.capitalize()

    # Check if character exists
    if character not in CHARACTER_FACTION:
        await message.delete()
        response = await message.channel.send(f"{message.author.mention}, '{character}' is not a valid character name.")
        await response.delete(delay=10)
        return

    # Check if character is already claimed (unless it has unlimited slots)
    max_slots = CHARACTER_SLOTS.get(character, 1)
    if character in claims and max_slots != -1 and len(claims[character]) >= max_slots:
        await message.delete()
        response = await message.channel.send(f"{message.author.mention}, {character} has already been claimed.")
        await response.delete(delay=10)
        return

    # Check if user already has a claim
    user_has_claim = False
    user_id = str(message.author.id)
    for char, char_claims in claims.items():
        for claim in char_claims:
            if claim['user_id'] == user_id:
                user_has_claim = True
                await message.delete()
                response = await message.channel.send(f"{message.author.mention}, you have already claimed {char}.")
                await response.delete(delay=10)
                return

    # Check if the user has registered a Minecraft username
    minecraft_name = minecraft_usernames.get(user_id, message.author.display_name)

    # Process valid claim
    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # Record the claim
    if character not in claims:
        claims[character] = []

    claims[character].append({
        'user_id': user_id,
        'timestamp': timestamp,
        'minecraft_name': minecraft_name
    })

    # Add to Google Sheet
    sheet.append_row([character, user_id, message.author.name, minecraft_name, timestamp])

    # Assign the appropriate role based on faction
    try:
        faction = CHARACTER_FACTION[character]
        role_id = FACTION_ROLE_IDS.get(faction)

        if role_id:
            guild = message.guild
            role = guild.get_role(role_id)
            if role:
                await message.author.add_roles(role)
                role_message = f" You've been assigned the {role.name} role!"
            else:
                role_message = ""
        else:
            role_message = ""
    except Exception as e:
        print(f"Error assigning role: {e}")
        role_message = ""

    # Log the claim
    log_channel = bot.get_channel(LOG_CHANNEL_ID)

    await log_channel.send(
        f"**New Claim**\n"
        f"Character: {character}\n"
        f"Claimed by: {message.author.mention} ({minecraft_name})\n"
        f"Time: {timestamp}\n"
        f"Faction: {CHARACTER_FACTION[character]}"
    )

    # Confirm the claim to the user
    await message.channel.send(
        f"✅ {message.author.mention} has successfully claimed **{character}** ({CHARACTER_FACTION[character]})!{role_message}"
    )

    # Update the character list channel
    await update_ct_list()


async def update_ct_list():
    # Update the character list channel
    list_channel = bot.get_channel(LIST_CHANNEL_ID)

    # Clear existing messages
    async for msg in list_channel.history(limit=100):
        if msg.author == bot.user:
            await msg.delete()

    # Create new character list
    message_content = "# JJK Character Claims\n\n"

    for faction in ["JujutsuSorcerer", "CurseUser", "CursedSpirit", "NonSorcerer"]:
        message_content += f"## {faction}\n\n"

        # Get characters in this faction
        faction_characters = {char: CHARACTER_FACTION[char] for char in CHARACTER_FACTION if
                              CHARACTER_FACTION[char] == faction}

        # Sort characters alphabetically
        sorted_characters = sorted(faction_characters.keys())

        for character in sorted_characters:
            slots = CHARACTER_SLOTS.get(character, 1)
            claimed = len(claims.get(character, []))

            # Display slot information
            if slots == -1:
                slot_display = f"**{character}**: {claimed}/∞"  # Infinity symbol for unlimited slots
            else:
                slot_display = f"**{character}**: {claimed}/{slots}"

            message_content += slot_display

            # Add claimer info if claimed
            if character in claims and claims[character]:
                for i, claim in enumerate(claims[character]):
                    user_id = claim['user_id']
                    try:
                        user = await bot.fetch_user(int(user_id))
                        mc_name = claim['minecraft_name']
                        message_content += f" - <@{user_id}> ({mc_name})"
                    except:
                        message_content += f" - Unknown User"

            message_content += "\n"

        message_content += "\n"

    # Split message if too long (Discord has 2000 character limit)
    if len(message_content) <= 2000:
        await list_channel.send(message_content)
    else:
        # Split into multiple messages
        chunks = [message_content[i:i + 1900] for i in range(0, len(message_content), 1900)]
        for chunk in chunks:
            await list_channel.send(chunk)


@bot.command()
@commands.has_permissions(administrator=True)
async def refresh(ctx):
    """Admin command to refresh the character list"""
    await ctx.message.delete()
    await update_ct_list()
    response = await ctx.send("Character list refreshed!")
    await response.delete(delay=5)


@bot.command()
@commands.has_permissions(administrator=True)
async def unclaim(ctx, character, user: discord.Member = None):
    """Admin command to remove a claim"""
    await ctx.message.delete()

    character = character.capitalize()

    if character not in CHARACTER_FACTION:
        response = await ctx.send(f"'{character}' is not a valid character name.")
        await response.delete(delay=10)
        return

    if character not in claims or not claims[character]:
        response = await ctx.send(f"{character} is not currently claimed.")
        await response.delete(delay=10)
        return

    # If user is specified, remove their specific claim
    if user:
        for i, claim in enumerate(claims[character]):
            if claim['user_id'] == str(user.id):
                removed_claim = claims[character].pop(i)

                # Remove from Google Sheet
                records = sheet.get_all_records()
                for i, record in enumerate(records):
                    if (record.get('Character') == character and
                            str(record.get('User ID')) == str(user.id)):
                        sheet.delete_row(i + 2)  # +2 because of header row and 1-indexing
                        break

                # Check if user still has any other claims
                user_has_other_claims = False
                user_faction = None
                for char, char_claims in claims.items():
                    for claim in char_claims:
                        if claim['user_id'] == str(user.id):
                            user_has_other_claims = True
                            user_faction = CHARACTER_FACTION[char]
                            break
                    if user_has_other_claims:
                        break

                # Remove role if no other claims in the same faction
                if not user_has_other_claims:
                    try:
                        faction = CHARACTER_FACTION[character]
                        role_id = FACTION_ROLE_IDS.get(faction)
                        if role_id:
                            guild = ctx.guild
                            role = guild.get_role(role_id)
                            if role and role in user.roles:
                                await user.remove_roles(role)
                    except Exception as e:
                        print(f"Error removing role: {e}")

                await update_ct_list()
                await ctx.send(f"Removed {user.mention}'s claim on {character}.")
                return

        await ctx.send(f"{user.mention} hasn't claimed {character}.")
    else:
        # Remove the last claim for this character
        removed_claim = claims[character].pop()

        try:
            user = await bot.fetch_user(int(removed_claim['user_id']))
            user_member = await ctx.guild.fetch_member(int(removed_claim['user_id']))

            # Check if user still has any other claims
            user_has_other_claims = False
            for char, char_claims in claims.items():
                for claim in char_claims:
                    if claim['user_id'] == removed_claim['user_id']:
                        user_has_other_claims = True
                        break
                if user_has_other_claims:
                    break

            # Remove role if no other claims in the same faction
            if not user_has_other_claims:
                try:
                    faction = CHARACTER_FACTION[character]
                    role_id = FACTION_ROLE_IDS.get(faction)
                    if role_id:
                        guild = ctx.guild
                        role = guild.get_role(role_id)
                        if role and user_member and role in user_member.roles:
                            await user_member.remove_roles(role)
                except Exception as e:
                    print(f"Error removing role: {e}")

            await ctx.send(f"Removed {user.mention}'s claim on {character}.")
        except:
            await ctx.send(f"Removed claim on {character} by unknown user.")

        # Remove from Google Sheet
        records = sheet.get_all_records()
        for i, record in enumerate(records):
            if (record.get('Character') == character and
                    str(record.get('User ID')) == removed_claim['user_id']):
                sheet.delete_row(i + 2)  # +2 because of header row and 1-indexing
                break

        await update_ct_list()


@bot.command()
@commands.has_permissions(administrator=True)
async def forceclaim(ctx, character, user: discord.Member, minecraft_name: str = None):
    """Admin command to force a claim for a user"""
    await ctx.message.delete()

    character = character.capitalize()

    if character not in CHARACTER_FACTION:
        response = await ctx.send(f"'{character}' is not a valid character name.")
        await response.delete(delay=10)
        return

    # Check if character is already fully claimed (unless unlimited)
    max_slots = CHARACTER_SLOTS.get(character, 1)
    if character in claims and max_slots != -1 and len(claims[character]) >= max_slots:
        response = await ctx.send(f"{character} has already been claimed and has no slots left.")
        await response.delete(delay=10)
        return

    # Use stored minecraft name if not provided
    user_id = str(user.id)
    if minecraft_name is None:
        minecraft_name = minecraft_usernames.get(user_id, user.display_name)
    else:
        # Update minecraft_usernames dictionary
        minecraft_usernames[user_id] = minecraft_name

        # Update nickname if possible
        try:
            await user.edit(nick=minecraft_name)
        except discord.Forbidden:
            await ctx.send(f"Warning: Couldn't update {user.mention}'s nickname due to insufficient permissions.")

    timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # Record the claim
    if character not in claims:
        claims[character] = []

    claims[character].append({
        'user_id': user_id,
        'timestamp': timestamp,
        'minecraft_name': minecraft_name
    })

    # Add to Google Sheet
    sheet.append_row([character, user_id, user.name, minecraft_name, timestamp])

    # Assign faction role
    try:
        faction = CHARACTER_FACTION[character]
        role_id = FACTION_ROLE_IDS.get(faction)

        if role_id:
            guild = ctx.guild
            role = guild.get_role(role_id)
            if role:
                await user.add_roles(role)
                role_message = f" and assigned the {role.name} role"
            else:
                role_message = ""
        else:
            role_message = ""
    except Exception as e:
        print(f"Error assigning role: {e}")
        role_message = ""

    # Log the claim
    log_channel = bot.get_channel(LOG_CHANNEL_ID)

    await log_channel.send(
        f"**Force Claim by Admin**\n"
        f"Character: {character}\n"
        f"Assigned to: {user.mention} ({minecraft_name})\n"
        f"Time: {timestamp}\n"
        f"Faction: {CHARACTER_FACTION[character]}"
    )

    # Confirm the claim
    await ctx.send(
        f"✅ Admin has assigned **{character}** ({CHARACTER_FACTION[character]}) to {user.mention}{role_message}!"
    )

    # Update the character list channel
    await update_ct_list()


@bot.command()
@commands.has_permissions(administrator=True)
async def setminecraft(ctx, user: discord.Member, minecraft_name: str):
    """Admin command to update a user's Minecraft name"""
    await ctx.message.delete()

    user_id = str(user.id)
    # Update the minecraft name in our dictionary
    minecraft_usernames[user_id] = minecraft_name

    # Update the minecraft name in any claims
    found = False
    for character, char_claims in claims.items():
        for i, claim in enumerate(claims[character]):
            if claim['user_id'] == user_id:
                # Update the minecraft name
                claims[character][i]['minecraft_name'] = minecraft_name
                found = True

                # Update in Google Sheet
                records = sheet.get_all_records()
                for j, record in enumerate(records):
                    if (record.get('Character') == character and
                            str(record.get('User ID')) == user_id):
                        # Update the cell (+2 for header row and 1-indexing)
                        sheet.update_cell(j + 2, 4, minecraft_name)
                        break

    # Try to update nickname
    try:
        await user.edit(nick=minecraft_name)
        await ctx.send(f"Updated {user.mention}'s Minecraft name to '{minecraft_name}' and set their nickname.")
    except discord.Forbidden:
        await ctx.send(
            f"Updated {user.mention}'s Minecraft name to '{minecraft_name}' but couldn't update their nickname (insufficient permissions).")

    if not found:
        await ctx.send(f"Note: {user.mention} hasn't claimed any character yet.")

    await update_ct_list()


@bot.command()
@commands.has_permissions(administrator=True)
async def syncnicknames(ctx):
    """Admin command to sync all nicknames with Minecraft usernames"""
    await ctx.message.delete()
    count = 0
    failed = 0

    guild = ctx.guild
    for user_id, minecraft_name in minecraft_usernames.items():
        try:
            member = await guild.fetch_member(int(user_id))
            if member and member.display_name != minecraft_name:
                await member.edit(nick=minecraft_name)
                count += 1
        except Exception:
            failed += 1

    await ctx.send(f"Nickname sync complete: {count} updated, {failed} failed.")


@bot.command()
@commands.has_permissions(administrator=True)
async def setslots(ctx, character, slots: int):
    """Admin command to set the number of slots for a character"""
    await ctx.message.delete()

    character = character.capitalize()

    if character not in CHARACTER_FACTION:
        response = await ctx.send(f"'{character}' is not a valid character name.")
        await response.delete(delay=10)
        return

    old_slots = CHARACTER_SLOTS.get(character, 1)

    # Update the slots
    CHARACTER_SLOTS[character] = slots

    # Update the slots in the Google Sheet
    await update_character_slots()

    # If reducing slots, check if we need to remove claims
    if slots != -1 and slots < old_slots and character in claims and len(claims[character]) > slots:
        excess = len(claims[character]) - slots
        await ctx.send(f"Warning: Reduced {character} slots from {old_slots} to {slots}. "
                       f"There are {excess} excess claims that should be manually removed.")

    # Update display
    await update_ct_list()

    if slots == -1:
        await ctx.send(f"Set {character} to have unlimited slots.")
    else:
        await ctx.send(f"Set {character} to have {slots} slots.")


@bot.command()
@commands.has_permissions(administrator=True)
async def infinite(ctx, character):
    """Admin command to set a character to have unlimited slots"""
    await ctx.message.delete()

    character = character.capitalize()

    if character not in CHARACTER_FACTION:
        response = await ctx.send(f"'{character}' is not a valid character name.")
        await response.delete(delay=10)
        return

    # Set to -1 for unlimited slots
    CHARACTER_SLOTS[character] = -1

    # Update the slots in the Google Sheet
    await update_character_slots()

    # Update display
    await update_ct_list()

    await ctx.send(f"Set {character} to have unlimited slots.")


@bot.command()
@commands.has_permissions(administrator=True)
async def commands(ctx):
    """Show available admin commands"""
    await ctx.message.delete()

    commands_list = (
        "**Admin Commands:**\n"
        "`!refresh` - Refresh the character list\n"
        "`!unclaim <character> [user]` - Remove a claim (specify user or remove last claim)\n"
        "`!forceclaim <character> <user> [minecraft_name]` - Force assign a character to a user\n"
        "`!setminecraft <user> <minecraft_name>` - Update a user's Minecraft name and nickname\n"
        "`!syncnicknames` - Sync all users' nicknames with their Minecraft names\n"
        "`!setslots <character> <slots>` - Set how many slots a character has\n"
        "`!infinite <character>` - Set a character to have unlimited slots\n"
        "`!commands` - Show this help message"
    )

    response = await ctx.send(commands_list)
    await response.delete(delay=30)


# Run the bot
bot.run(os.getenv('DISCORD_TOKEN'))
