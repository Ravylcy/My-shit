# Give the Prison Realm sealing scroll
give @s minecraft:carrot_on_a_stick{display:{Name:'{"text":"Prison Realm Scroll","color":"dark_purple","italic":false}',Lore:['{"text":"A forbidden cursed technique","color":"light_purple","italic":true}','{"text":"Right-click to seal a nearby player","color":"gray","italic":false}']},CustomModelData:960123,PrisonRealm:1b,Enchantments:[{id:"minecraft:unbreaking",lvl:1s}],HideFlags:1} 1

# Grant permission to use the Prison Realm
scoreboard players set @s pr_permission 1
scoreboard players set @s pr_cooldown 0

tellraw @s {"text":"You have been granted the power of the Prison Realm!","color":"light_purple"}