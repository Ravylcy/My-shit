${input$entity}.getCapability(JujutsucraftModVariables.PLAYER_VARIABLES_CAPABILITY, null).ifPresent(capability -> {
capability.flag_sukuna = ${input$logic};
capability.syncPlayerVariables(${input$entity});
});