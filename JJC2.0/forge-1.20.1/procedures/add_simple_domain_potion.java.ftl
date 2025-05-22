		if (${input$entity} instanceof LivingEntity _entity && !_entity.level().isClientSide())
					_entity.addEffect(new MobEffectInstance(JujutsucraftModMobEffects.SIMPLE_DOMAIN.get(), ${input$value3},
							(int) ((entity instanceof LivingEntity && ((LivingEntity) ${input$entity}).hasEffect(JujutsucraftModMobEffects.SIMPLE_DOMAIN.get())
									? ((LivingEntity) ${input$entity}).getEffect(JujutsucraftModMobEffects.SIMPLE_DOMAIN.get()).getAmplifier()
									: 0) + ${input$value2}),
							${input$logic1}, ${input$logic2}));