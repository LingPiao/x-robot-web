package org.project.model;

public class Music implements java.io.Serializable {

	public Music() {
	}

	public Music(String id, String songs, String singer, String type,
			String valid) {
		ID = id;
		SONGS = songs;
		SINGER = singer;
		TYPE = type;
		VALID = valid;
	}

	private String ID;
	private String SONGS;
	private String SINGER;
	private String TYPE;
	private String VALID;

	public String getID() {
		return ID;
	}

	public void setID(String id) {
		ID = id;
	}

	public String getSONGS() {
		return SONGS;
	}

	public void setSONGS(String songs) {
		SONGS = songs;
	}

	public String getSINGER() {
		return SINGER;
	}

	public void setSINGER(String singer) {
		SINGER = singer;
	}

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String type) {
		TYPE = type;
	}

	public String getVALID() {
		return VALID;
	}

	public void setVALID(String valid) {
		VALID = valid;
	}

}
