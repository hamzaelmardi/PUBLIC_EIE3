package com.EIE.demo.model;
import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "audit")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Audit implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="auditId")
    private int auditId;
	public String getId_en() {
		return id_en;
	}

	public void setId_en(String id_en) {
		this.id_en = id_en;
	}
	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	@Column(name = "num_auto", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String num_auto;
	
	@Column(name = "id_en", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String id_en;
	@Column(name = "tables", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String tables;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "compteId")
	private Compte compte;
	
	

	public String getTables() {
		return tables;
	}

	public void setTables(String tables) {
		this.tables = tables;
	}

	@Lob
	@Column(name = "newData", nullable = true,columnDefinition = "NVARCHAR(max)")
	private String newData;
	@Lob
	@Column(name = "oldData", nullable = false,columnDefinition = "NVARCHAR(max)")
	private String oldData; 
	
	
	
	public String getNewData() {
		return newData;
	}

	public void setNewData(String newData) {
		this.newData = newData;
	}

	public String getOldData() {
		return oldData;
	}

	public void setOldData(String oldData) {
		this.oldData = oldData;
	}

	public int getAuditId() {
		return auditId;
	}

	public void setAuditId(int auditId) {
		this.auditId = auditId;
	}

	public String getNum_auto() {
		return num_auto;
	}

	public void setNum_auto(String num_auto) {
		this.num_auto = num_auto;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	public Date getDateTime() {
		return DateTime;
	}

	public void setDateTime(Date dateTime) {
		DateTime = dateTime;
	}

	public String getAction_fr() {
		return action_fr;
	}

	public void setAction_fr(String action_fr) {
		this.action_fr = action_fr;
	}

	public String getAction_ar() {
		return action_ar;
	}

	public void setAction_ar(String action_ar) {
		this.action_ar = action_ar;
	}

	@Column
	private Date DateTime;
	@Column(name = "action_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String action_fr;
	
	@Column(name = "action_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String action_ar;
}
