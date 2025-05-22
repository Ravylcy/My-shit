${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.PlayerCurseTechnique = ${input$ct_value};
capability.syncPlayerVariables(${input$entity});
});