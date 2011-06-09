package org.project.model;

import java.util.Date;


public class Mmessage_class implements java.io.Serializable{

	/**
	 * 
	 */
	public Mmessage_class() {
		// TODO Auto-generated constructor stub
	}


	public String getCLASS_ID() {
		return CLASS_ID;
	}


	public void setCLASS_ID(String class_id) {
		CLASS_ID = class_id;
	}


	public String getCLASS_NAME() {
		return CLASS_NAME;
	}


	public void setCLASS_NAME(String class_name) {
		CLASS_NAME = class_name;
	}


	/**
	 * @param class_id
	 * @param class_name
	 */
	public Mmessage_class(String class_id, String class_name) {
		CLASS_ID = class_id;
		CLASS_NAME = class_name;
	}


	private String CLASS_ID;
	
	private String CLASS_NAME;



	
}
