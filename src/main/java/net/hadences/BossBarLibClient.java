package net.hadences;

import net.hadences.common.CustomBossBarManager;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.api.distmarker.OnlyIn;
import net.minecraftforge.fml.event.lifecycle.FMLClientSetupEvent;

@OnlyIn(Dist.CLIENT)
public class BossBarLibClient {

    public static void clientSetup(final FMLClientSetupEvent event) {
        BossBarLib.LOGGER.info("BossBarLibClient initialized");
        event.enqueueWork(() -> {
            CustomBossBarManager.initClient();
        });
    }
}