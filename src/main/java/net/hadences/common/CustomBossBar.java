package net.hadences.common;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.BossEvent;

public class CustomBossBar {
    private int color;
    private BossEvent.BossBarOverlay style;
    private boolean darkenSky;
    private boolean playBossMusic;
    private boolean createWorldFog;
    private double visibleDistance;

    private ResourceLocation overlayID;
    private ResourceLocation[] overlayTextures;
    private int overlayFrames;
    private final boolean hasOverlay;

    public CustomBossBar(int color, BossEvent.BossBarOverlay style, boolean darkenScreen, boolean playBossMusic, boolean createWorldFog) {
        this.color = color;
        this.style = style;
        this.darkenSky = darkenScreen;
        this.playBossMusic = playBossMusic;
        this.createWorldFog = createWorldFog;
        this.visibleDistance = 30.0D;
        this.hasOverlay = false;
    }

    public CustomBossBar(int color, BossEvent.BossBarOverlay style, boolean darkenScreen, boolean playBossMusic, boolean createWorldFog, double visibleDistance) {
        this.color = color;
        this.style = style;
        this.darkenSky = darkenScreen;
        this.playBossMusic = playBossMusic;
        this.createWorldFog = createWorldFog;
        this.visibleDistance = visibleDistance;
        this.hasOverlay = false;
    }

    public CustomBossBar(int color, BossEvent.BossBarOverlay style, boolean darkenScreen,
                         boolean playBossMusic, boolean createWorldFog, double visibleDistance,
                         ResourceLocation overlayID, int overlayFrames) {
        this.color = color;
        this.style = style;
        this.darkenSky = darkenScreen;
        this.playBossMusic = playBossMusic;
        this.createWorldFog = createWorldFog;
        this.visibleDistance = visibleDistance;
        this.overlayID = overlayID;
        this.overlayFrames = overlayFrames;
        overlayTextures = new ResourceLocation[overlayFrames];
        for (int i = 0; i < overlayFrames; i++) {
            int val = i+1;
            overlayTextures[i] = new ResourceLocation(overlayID.getNamespace(), overlayID.getPath() + val + ".png");
        }
        this.hasOverlay = true;
    }

    public ResourceLocation[] getOverlayTextures() {
        return overlayTextures;
    }

    public boolean hasOverlay() {
        return hasOverlay;
    }

    public ResourceLocation getOverlayID() {
        return overlayID;
    }

    public int getOverlayFrames() {
        return overlayFrames;
    }

    public Double getVisibleDistance() {
        return visibleDistance;
    }

    public void setVisibleDistance(Double visibleDistance) {
        this.visibleDistance = visibleDistance;
    }

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public BossEvent.BossBarOverlay getStyle() {
        return style;
    }

    public void setStyle(BossEvent.BossBarOverlay style) {
        this.style = style;
    }

    public boolean isDarkenSky() {
        return darkenSky;
    }

    public void setDarkenSky(boolean darkenSky) {
        this.darkenSky = darkenSky;
    }

    public boolean isPlayBossMusic() {
        return playBossMusic;
    }

    public void setPlayBossMusic(boolean playBossMusic) {
        this.playBossMusic = playBossMusic;
    }

    public boolean isCreateWorldFog() {
        return createWorldFog;
    }

    public void setCreateWorldFog(boolean createWorldFog) {
        this.createWorldFog = createWorldFog;
    }
}