package net.hadences.network;

import net.hadences.BossBarLib;
import net.hadences.network.packets.SetTaggedEntityPacket;
import net.minecraft.resources.ResourceLocation;
import net.minecraftforge.network.NetworkDirection;
import net.minecraftforge.network.NetworkRegistry;
import net.minecraftforge.network.simple.SimpleChannel;

public class ModNetworking {
    private static final String PROTOCOL_VERSION = "1";
    public static final SimpleChannel INSTANCE = NetworkRegistry.newSimpleChannel(
            new ResourceLocation(BossBarLib.MOD_ID, "main"),
            () -> PROTOCOL_VERSION,
            PROTOCOL_VERSION::equals,
            PROTOCOL_VERSION::equals
    );

    public static void register() {
        int id = 0;

        INSTANCE.messageBuilder(SetTaggedEntityPacket.class, id++, NetworkDirection.PLAY_TO_CLIENT)
                .decoder(SetTaggedEntityPacket::new)
                .encoder(SetTaggedEntityPacket::toBytes)
                .consumerMainThread(SetTaggedEntityPacket::handle)
                .add();
    }
}