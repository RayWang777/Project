package com.eeit144.drinkmaster.bean;

public enum StoreColumn {
	storeId(1,"storeId"), firmId(2,"firmId"), storeName(3,"storeName"), storeAddress(4,"storeAddress")
	,storePhone(5,"storePhone"), openTime(6,"openTime"), longitude(7,"longitude"), latitude(8,"latitude");
	
	private final int value;
	private final String columnName;

	StoreColumn(int value, String columnName) {
		this.value = value;
		this.columnName = columnName;
	}
	
	public static String getColumne(int index){
		for(StoreColumn fc:values()) {
			if(fc.getValue()== index) {
				return fc.getColumnName();
			} 
		}
		return StoreColumn.values()[0].getColumnName();
	}
	
	public int getValue() {
		return this.value;
	}

	public String getColumnName() {
		return this.columnName;
	}
}
