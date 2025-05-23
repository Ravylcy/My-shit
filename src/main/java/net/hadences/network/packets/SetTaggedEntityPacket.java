package net.hadences.network.packets;

import net.hadences.common.CustomBossBarManager;
import net.minecraft.client.Minecraft;
import net.minecraft.network.FriendlyByteBuf;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.LivingEntity;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.fml.DistExecutor;
import net.minecraftforge.network.NetworkEvent;

import java.util.function.Supplier;

public class SetTaggedEntityPacket {
    private final int entityID;

    public SetTaggedEntityPacket(int entityID) {
        this.entityID = entityID;
    }

    public SetTaggedEntityPacket(FriendlyByteBuf buf) {
        this.entityID = buf.readInt();
    }

    public void toBytes(FriendlyByteBuf buf) {
        buf.writeInt(this.entityID);
    }

    public boolean handle(Supplier<NetworkEvent.Context> contextSupplier) {
        NetworkEvent.Context context = contextSupplier.get();
        context.enqueueWork(() -> {
            DistExecutor.unsafeRunWhenOn(Dist.CLIENT, () -> () -> {
                Minecraft client = Minecraft.getInstance();
                if (client.level == null) return;
                Entity entity = client.level.getEntity(entityID);
                if (entity instanceof LivingEntity le) {
                    CustomBossBarManager.INSTANCE.setClientTaggedEntity(le);
                }
            });
        });
        return true;
    }
}