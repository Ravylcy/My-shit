package net.hadences.common;

import net.minecraft.client.gui.components.LerpingBossEvent;
import net.minecraft.network.chat.Component;
import net.minecraft.util.Mth;
import net.minecraft.world.BossEvent;
import net.minecraft.world.entity.LivingEntity;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.api.distmarker.OnlyIn;

public class CustomBossBarManager {
    public static final CustomBossBarManager INSTANCE = new CustomBossBarManager();
    @OnlyIn(Dist.CLIENT)
    private LivingEntity clientTaggedEntity = null;
    @OnlyIn(Dist.CLIENT)
    private static LerpingBossEvent clientBossBar = null;

    // This method is called in the onInitialize method of the main mod class - Server side only
    public static void initServer() {
        ModNetworking.register();
    }

    // This method is called in the onInitializeClient method of the client mod class - Client side only
    @OnlyIn(Dist.CLIENT)
    public static void initClient() {
        clientBossBar = new LerpingBossEvent(Mth.createInsecureUUID(new java.util.Random()), Component.empty(),
                BossEvent.BossBarColor.YELLOW, BossEvent.BossBarOverlay.PROGRESS, false, false, false);
    }

    public CustomBossBarManager() {

    }

    @OnlyIn(Dist.CLIENT)
    public void setClientTaggedEntity(LivingEntity entity) {
        this.clientTaggedEntity = entity;
    }

    @OnlyIn(Dist.CLIENT)
    public LivingEntity getClientTaggedEntity() {
        return this.clientTaggedEntity;
    }

    @OnlyIn(Dist.CLIENT)
    public static LerpingBossEvent getClientBossBar() {
        return clientBossBar;
    }
}