		if (${input$entity} instanceof LivingEntity _entity && !_entity.level().isClientSide())
					_entity.addEffect(new MobEffectInstance(JujutsucraftModMobEffects.REVERSE_CURSED_TECHNIQUE.get(), ${input$value3},
							(int) ((entity instanceof LivingEntity && ((LivingEntity) ${input$entity}).hasEffect(JujutsucraftModMobEffects.REVERSE_CURSED_TECHNIQUE.get())
									? ((LivingEntity) ${input$entity}).getEffect(JujutsucraftModMobEffects.REVERSE_CURSED_TECHNIQUE.get()).getAmplifier()
									: 0) + ${input$value2}),
							${input$logic1}, ${input$logic2}));