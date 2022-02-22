package com.EIE.demo.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "renouvellement")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@JsonAutoDetect
public class Renouvellement implements Serializable{
	private static final long serialVersionUID = 1L;
public Renouvellement() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_renouvellement")
    private int id_renouvellement;
	
	public int getId_renouvellement() {
		return id_renouvellement;
	}

	
	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;
	
	@Column(name = "number_mois", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String number_mois;
	
	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;


	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setId_renouvellement(int id_renouvellement) {
		this.id_renouvellement = id_renouvellement;
	}

	public String getNumber_mois() {
		return number_mois;
	}

	public void setNumber_mois(String number_mois) {
		this.number_mois = number_mois;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
