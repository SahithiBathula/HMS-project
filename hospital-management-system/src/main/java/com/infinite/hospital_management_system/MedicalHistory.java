package com.infinite.hospital_management_system;

import javax.persistence.Table;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Table(name="medical_history")
@ManagedBean
@SessionScoped
public class MedicalHistory {
	@Id
	@Column(name="med_his_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int medHisId;
	
	@Column(name="patient_id")
	private int patientId;
	
	@Column(name="treatment_day")
	private int treatmentDay;
	
	@Column(name="treatment_description")
	private String treatmentDescription;

	
	public int getMedHisId() {
		return medHisId;
	}

	public void setMedHisId(int medHisId) {
		this.medHisId = medHisId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getTreatmentDay() {
		return treatmentDay;
	}

	public void setTreatmentDay(int treatmentDay) {
		this.treatmentDay = treatmentDay;
	}

	public String getTreatmentDescription() {
		return treatmentDescription;
	}

	public void setTreatmentDescription(String treatmentDescription) {
		this.treatmentDescription = treatmentDescription;
	}
}
