{
					double _setval = ${input$value};
					${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
						capability.${field$datalist} = _setval;
						capability.syncPlayerVariables(${input$entity});
					});
				}