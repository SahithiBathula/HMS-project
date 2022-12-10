package com.infinite.hospital_management_system;

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@ManagedBean(name="treatment")
@SessionScoped
@Entity
@Table(name="treatmentdetails")
public class Treatment {  
    @Id
    @Column(name="treatment_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int treatmentId;
    
    @Column(name="patient_id")
    private int patientid;
    
    @Column(name="doctor_id")
    private int doctorid;
    
    @Column(name="VisitingOrAdmitting")
    private int visitingOrAdmitting;
    
    @Column(name="treatment_date")
    private Date treatmentdate;

    @Column(name="discharge_date")
    private Date dischargedate;
    
    @Column(name="issue_id")
    private int issueId;

    @Column(name="room_id")
    private int roomId;
     

    public int getTreatmentId() {
        return treatmentId;
    }

    public void setTreatmentId(int treatmentId) {
        this.treatmentId = treatmentId;
    }

    public int getPatientid() {
        return patientid;
    }

    public void setPatientid(int patientid) {
        this.patientid = patientid;
    }

    public int getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(int doctorid) {
        this.doctorid = doctorid;
    }
    
    public int getVisitingOrAdmitting() {
        return visitingOrAdmitting;
    }

    public void setVisitingOrAdmitting(int visitingOrAdmitting) {
        this.visitingOrAdmitting = visitingOrAdmitting;
    }

    public Date getTreatmentdate() {
        return treatmentdate;
    }

    public void setTreatmentdate(Date treatmentdate) {
        this.treatmentdate = treatmentdate;
    }

    public Date getDischargedate() {
        return dischargedate;
    }

    public void setDischargedate(Date dischargedate) {
        this.dischargedate = dischargedate;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }
    
    public int getRoomId() {
    	return roomId;
    }
    
    public void setRoomId(int roomId) {
    	this.roomId = roomId;
    }
}