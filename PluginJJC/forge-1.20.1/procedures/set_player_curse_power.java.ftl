${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.PlayerCursePower = ${input$ce_value};
capability.syncPlayerVariables(${input$entity});
});