		CompoundTag dataIndex1 = new CompoundTag();
		${input$entity}.saveWithoutId(dataIndex1);
		dataIndex1.getCompound("ForgeData").putString("OWNER_UUID", (${input$entity2}.getStringUUID()));
		${input$entity}.load(dataIndex1);
		CompoundTag dataIndex3 = new CompoundTag();
		${input$entity}.saveWithoutId(dataIndex3);
		dataIndex3.getCompound("ForgeData").putDouble("friend_num", (new Object() {
			public double getValue() {
				CompoundTag dataIndex2 = new CompoundTag();
				${input$entity2}.saveWithoutId(dataIndex2);
				return dataIndex2.getCompound("ForgeData").getDouble("friend_num");
			}
		}.getValue()));
		${input$entity}.load(dataIndex3);