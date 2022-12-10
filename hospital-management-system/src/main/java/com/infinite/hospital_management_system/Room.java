package com.infinite.hospital_management_system;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Rooms")
public class Room {
	@Id
	@Column(name="room_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int roomId;
	
	@Column(name="room_cost")
	private double roomCost;
	
	@Column(name="status")
	private String status;
	

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public double getRoomCost() {
		return roomCost;
	}

	public void setRoomCost(Double roomCost) {
		this.roomCost = roomCost;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
