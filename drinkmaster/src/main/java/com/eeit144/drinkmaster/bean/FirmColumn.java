package com.eeit144.drinkmaster.bean;

public enum FirmColumn {
	firmId(1,"firmId"), firmName(2,"firmName"), firmAddress(3,"firmAddress"), firmPhone(4,"firmPhone");

	private final int value;
	private final String columnName;

	FirmColumn(int value, String columnName) {
		this.value = value;
		this.columnName = columnName;
	}
	
	public static String getColumne(int index){
		for(FirmColumn fc:values()) {
			if(fc.getValue()== index) {
				return fc.getColumnName();
			} 
		}
		return FirmColumn.values()[0].getColumnName();
	}
	
	public int getValue() {
		return this.value;
	}

	public String getColumnName() {
		return this.columnName;
	}
}
