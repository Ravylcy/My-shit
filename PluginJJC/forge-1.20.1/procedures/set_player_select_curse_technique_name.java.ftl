${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.PlayerSelectCurseTechniqueName = ${input$text};
capability.syncPlayerVariables(${input$entity});
});