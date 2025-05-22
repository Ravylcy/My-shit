${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.PlayerTechniqueUsedNumber = ${input$value1};
capability.syncPlayerVariables(${input$entity});
});