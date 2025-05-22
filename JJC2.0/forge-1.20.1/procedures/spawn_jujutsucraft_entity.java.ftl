<#assign entitytype = generator.map(field$entitytype, "entities", 1)!"null">
<#if entitytype != "null">
  if (world instanceof ServerLevel _serverLevel) {
    Entity entitytospawn = JujutsucraftModEntities.${field$entitytype}.get().spawn(_serverLevel, BlockPos.containing(${input$x}, ${input$y}, ${input$z}), MobSpawnType.MOB_SUMMONED);
    if (entitytospawn != null) {
		  entitytospawn.setYRot(world.getRandom().nextFloat() * 360.0F);
		  ${statement$do}
    	_serverLevel.addFreshEntity(entitytospawn);
    }
  }
</#if>