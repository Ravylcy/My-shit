${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.PlayerSelectCurseTechnique = ${input$value};
capability.syncPlayerVariables(${input$entity});
});