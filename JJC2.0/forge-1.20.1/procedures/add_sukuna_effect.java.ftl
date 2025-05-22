		if (${input$entity} instanceof LivingEntity _entity && !_entity.level().isClientSide())
					_entity.addEffect(new MobEffectInstance(JujutsucraftModMobEffects.SUKUNA_EFFECT.get(), ${input$value3},
							(int) ((entity instanceof LivingEntity && ((LivingEntity) ${input$entity}).hasEffect(JujutsucraftModMobEffects.SUKUNA_EFFECT.get())
									? ((LivingEntity) ${input$entity}).getEffect(JujutsucraftModMobEffects.SUKUNA_EFFECT.get()).getAmplifier()
									: 0) + ${input$value2}),
							${input$logic1}, ${input$logic2}));