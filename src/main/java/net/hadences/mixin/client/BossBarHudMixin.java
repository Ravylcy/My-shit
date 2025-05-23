package net.hadences.mixin.client;

import com.mojang.blaze3d.systems.RenderSystem;
import net.hadences.common.CustomBossBar;
import net.hadences.common.CustomBossBarManager;
import net.hadences.common.CustomBossBarRegistry;
import net.minecraft.client.Minecraft;
import net.minecraft.client.gui.GuiGraphics;
import net.minecraft.client.gui.components.BossHealthOverlay;
import net.minecraft.client.gui.components.LerpingBossEvent;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.util.Mth;
import net.minecraft.world.BossEvent;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import org.joml.Vector3f;
import org.spongepowered.asm.mixin.Final;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.Unique;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(BossHealthOverlay.class)
public class BossBarHudMixin {
    @Unique
    private static final ResourceLocation[] BACKGROUND_TEXTURES = new ResourceLocation[]{
            new ResourceLocation("textures/gui/bars.png"), new ResourceLocation("textures/gui/bars.png"),
            new ResourceLocation("textures/gui/bars.png"), new ResourceLocation("textures/gui/bars.png"),
            new ResourceLocation("textures/gui/bars.png"), new ResourceLocation("textures/gui/bars.png"),
            new ResourceLocation("textures/gui/bars.png")
    };
    @Unique
    private static final ResourceLocation[] PROGRESS_TEXTURES = new ResourceLocation[]{
            new ResourceLocation("textures/gui/bars.png"), new ResourceLocation("textures/gui/bars.png"),
            new ResourceLocation("textures/gui/bars.png"), new ResourceLocation("textures/gui/bars.png"),
            new ResourceLocation("textures/gui/bars.png"), new ResourceLocation("textures/gui/bars.png"),
            new ResourceLocation("textures/gui/bars.png")
    };

    @Shadow @Final private Minecraft minecraft;

    @Inject(method = "render", at = @At("HEAD"), cancellable = true)
    public void onRender(GuiGraphics graphics, CallbackInfo ci){
        LivingEntity livingEntity = CustomBossBarManager.INSTANCE.getClientTaggedEntity();
        if(livingEntity != null && this.hasBossBar(livingEntity.getType())
                && !livingEntity.isSpectator() && !livingEntity.isInvisible() && livingEntity.isAlive()){
            int i = graphics.guiWidth();
            int j = 12;
            int k = i / 2 - 91;

            CustomBossBar customBossBar = CustomBossBarRegistry.getInstance().getBossBarMap(livingEntity.getType());
            LerpingBossEvent bossBar = CustomBossBarManager.getClientBossBar();

            if(this.isWithinDistance(livingEntity, customBossBar)) {
                //customize the boss bar
                bossBar.setColor(BossEvent.BossBarColor.WHITE);
                bossBar.setOverlay(customBossBar.getStyle());
                bossBar.setDarkenScreen(customBossBar.isDarkenSky());
                bossBar.setPlayBossMusic(customBossBar.isPlayBossMusic());
                bossBar.setCreateWorldFog(customBossBar.isCreateWorldFog());

                bossBar.setProgress(livingEntity.getHealth() / livingEntity.getMaxHealth());
                if(customBossBar.hasOverlay()){
                    j = 18;
                }
                this.onRenderBossBar(graphics, k, j, bossBar, customBossBar.getColor());
                Component text = livingEntity.getDisplayName();
                int m = this.minecraft.font.width(text);
                int n = i / 2 - m / 2 + 2;
                int o = j - (customBossBar.hasOverlay() ? 14 : 9);
                graphics.drawString(this.minecraft.font, text, n, o, 0xFFFFFF);
                if(customBossBar.hasOverlay()){
                    this.onRenderOverlay(customBossBar, graphics, k, 2);
                }

                ci.cancel();
            }
        }
    }

    @Unique
    private void onRenderOverlay(CustomBossBar customBossBar, GuiGraphics graphics, int x, int y){
        int frames = customBossBar.getOverlayFrames();
        ResourceLocation[] overlayTextures = customBossBar.getOverlayTextures();

        long millisPerFrame = 100;
        long currentTime = System.currentTimeMillis();
        int frameIndex = (int) ((currentTime / millisPerFrame) % frames);

        RenderSystem.enableBlend();
        graphics.blit(overlayTextures[frameIndex], x-64, y, 0, 0, 310, 48, 310, 48);
        RenderSystem.disableBlend();
    }

    @Unique
    private boolean isWithinDistance(LivingEntity entity, CustomBossBar cbb){
        return entity.distanceToSqr(this.minecraft.player) <= cbb.getVisibleDistance() * cbb.getVisibleDistance();
    }

    @Unique
    private boolean hasBossBar(EntityType<?> entityType){
        return CustomBossBarRegistry.getInstance().getBossBarMap(entityType) != null;
    }

    @Unique
    private void onRenderBossBar(GuiGraphics graphics, int x, int y, LerpingBossEvent bossBar, int color) {
        this.onRenderBossBar(graphics, x, y, bossBar, 182, BACKGROUND_TEXTURES, color);
        int i = Mth.lerpDiscrete(bossBar.getProgress(), 0, 182);
        if (i > 0) {
            this.onRenderBossBar(graphics, x, y, bossBar, i, PROGRESS_TEXTURES, color);
        }
    }

    @Unique
    private void onRenderBossBar(GuiGraphics graphics, int x, int y, LerpingBossEvent bossBar, int width, ResourceLocation[] textures, int color) {
        Vector3f c = intToNormalizedRGBVector(color);
        RenderSystem.setShaderColor(c.x, c.y, c.z, 1.0F);
        graphics.blit(textures[BossEvent.BossBarColor.WHITE.ordinal()], x, y, 0, 0, width, 5, 182, 5);
        RenderSystem.setShaderColor(1.0F, 1.0F, 1.0F, 1.0F);
    }

    @Unique
    public Vector3f intToNormalizedRGBVector(int color) {
        float red = (color >> 16) & 0xFF;
        float green = (color >> 8) & 0xFF;
        float blue = color & 0xFF;

        return new Vector3f(red / 255f, green / 255f, blue / 255f);
    }
}