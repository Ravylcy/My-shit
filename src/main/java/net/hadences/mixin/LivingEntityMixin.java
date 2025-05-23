package net.hadences.mixin;

import net.hadences.common.CustomBossBarRegistry;
import net.hadences.network.ModNetworking;
import net.hadences.network.packets.SetTaggedEntityPacket;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.boss.enderdragon.EnderDragon;
import net.minecraft.world.entity.boss.wither.WitherBoss;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Unique;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(LivingEntity.class)
public class LivingEntityMixin {

    @Inject(method="hurt", at=@At("HEAD"))
    public void onDamage(DamageSource source, float amount, CallbackInfoReturnable<Boolean> cir) {
        if(source.getEntity() instanceof ServerPlayer attacker) {
            LivingEntity entity = (LivingEntity)(Object)this;

            if(entity instanceof WitherBoss || entity instanceof EnderDragon){
                int entityID = ((LivingEntity)(Object)this).getId();
                ModNetworking.INSTANCE.sendTo(new SetTaggedEntityPacket(entityID), attacker.connection.connection, net.minecraftforge.network.NetworkDirection.PLAY_TO_CLIENT);
                return;
            }

            if(!hasBossBar(entity.getType())) return;

            int entityID = ((LivingEntity)(Object)this).getId();
            ModNetworking.INSTANCE.sendTo(new SetTaggedEntityPacket(entityID), attacker.connection.connection, net.minecraftforge.network.NetworkDirection.PLAY_TO_CLIENT);
        }
    }

    @Unique
    private boolean hasBossBar(EntityType<?> entityType){
        return CustomBossBarRegistry.getInstance().getBossBarMap(entityType) != null;
    }
}