package com.infinite.hospital_management_system;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DoctorDetails")
@ManagedBean
@SessionScoped
public class Doctor {
	@Id
	@Column(name="doctor_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int doctorId;
	
	@Column(name="doctor_name")
	private String doctorName;
	
	@Column(name="doctor_specialization")
	private String doctorSpecialization;
	
	@Column(name="experience")
	private int doctorExperience;
	
	@Column(name="doctor_status")
	private String doctorStatus;
	
	
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDoctorSpecialization() {
		return doctorSpecialization;
	}
	public void setDoctorSpecialization(String doctorSpecialization) {
		this.doctorSpecialization = doctorSpecialization;
	}
	public int getDoctorExperience() {
		return doctorExperience;
	}
	public void setDoctorExperience(int doctorExperience) {
		this.doctorExperience = doctorExperience;
	}
	public String getDoctorStatus() {
		return doctorStatus;
	}
	public void setDoctorStatus(String doctorStatus) {
		this.doctorStatus = doctorStatus;
	}
}
