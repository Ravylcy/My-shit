		if (${input$entity} instanceof LivingEntity _entity && !_entity.level().isClientSide())
			_entity.addEffect(new MobEffectInstance(JujutsucraftModMobEffects.COOLDOWN_TIME.get(), ${input$value2}, ${input$value1}, ${input$tickambient}, ${input$particles}));
			
			