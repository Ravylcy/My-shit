		if (${input$entity} instanceof LivingEntity _entity && !_entity.level().isClientSide())
					_entity.addEffect(new MobEffectInstance(JujutsucraftModMobEffects.ZONE.get(), ${input$value3},
							(int) ((entity instanceof LivingEntity && ((LivingEntity) ${input$entity}).hasEffect(JujutsucraftModMobEffects.ZONE.get())
									? ((LivingEntity) ${input$entity}).getEffect(JujutsucraftModMobEffects.ZONE.get()).getAmplifier()
									: 0) + ${input$value2}),
							${input$logic1}, ${input$logic2}));