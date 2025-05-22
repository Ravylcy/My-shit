${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.FlagSixEyes = ${input$logic};
capability.syncPlayerVariables(${input$entity});
});