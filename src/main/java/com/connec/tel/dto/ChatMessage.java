package com.connec.tel.dto;

public class ChatMessage {
	public enum MessegeType{
		ENTER, TALK
	}
	
	private MessegeType type;
	private String roomId;
	private String sender;
	private String emp_no;
	private String message;
	
	public MessegeType getType() {
		return type;
	}
	public void setType(MessegeType type) {
		this.type = type;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
