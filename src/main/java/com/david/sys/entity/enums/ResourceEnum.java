package com.david.sys.entity.enums;

/**
 * 资源类型
 * @author David
 */
public enum ResourceEnum {

	menu("菜单"), form("表单元素");

	private final String info;

	private ResourceEnum(String info) {
		this.info = info;
	}

	public String getInfo() {
		return info;
	}

}
