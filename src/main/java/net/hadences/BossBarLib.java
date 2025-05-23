package net.hadences;

import net.hadences.common.CustomBossBarManager;
import net.minecraftforge.common.MinecraftForge;
import net.minecraftforge.eventbus.api.IEventBus;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.event.lifecycle.FMLCommonSetupEvent;
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext;
import net.minecraftforge.fml.loading.FMLEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Mod(BossBarLib.MOD_ID)
public class BossBarLib {
	public static final Logger LOGGER = LoggerFactory.getLogger("bossbarlib");
	public static final String MOD_ID = "bossbarlib";

	public BossBarLib() {
		IEventBus modEventBus = FMLJavaModLoadingContext.get().getModEventBus();

		modEventBus.addListener(this::commonSetup);

		MinecraftForge.EVENT_BUS.register(this);

		if (FMLEnvironment.dist.isClient()) {
			modEventBus.addListener(BossBarLibClient::clientSetup);
		}
	}

	private void commonSetup(final FMLCommonSetupEvent event) {
		LOGGER.info("BossBarLib initialized");
		event.enqueueWork(() -> {
			CustomBossBarManager.initServer();
		});
	}
}