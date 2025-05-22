${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.PlayerCursePowerFormer = ${input$value};
capability.syncPlayerVariables(${input$entity});
});