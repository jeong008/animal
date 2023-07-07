package data.address;

import com.google.gson.annotations.SerializedName;

public class AddressDocument {
	
	@SerializedName("y")
	String lng;  // 경도
	
	@SerializedName("x")
	String lat;  // 위도
	
	@SerializedName("address_type")
	String tpye;
	
	@SerializedName("address_name")
	String name;

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getTpye() {
		return tpye;
	}

	public void setTpye(String tpye) {
		this.tpye = tpye;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "AddressDocument [lng=" + lng + ", lat=" + lat + ", tpye=" + tpye + ", name=" + name + "]";
	}
	
}
