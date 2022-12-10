package com.infinite.hospital_management_system;

import javax.faces.bean.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="issues")
@ManagedBean
@SessionScoped
public class Issues {
	@Id
	@Column(name="issue_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int issueId;
	
	@Column(name="issue")
	private String issue;
	
	@Column(name="treatment_cost")
	private double treatmentCost;

	
	public int getIssueId() {
		return issueId;
	}

	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public double getTreatmentCost() {
		return treatmentCost;
	}

	public void setTreatmentCost(double treatmentCost) {
		this.treatmentCost = treatmentCost;
	}
}
