package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "ValidationDateAuth")

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect
public class ValidationDateAuth implements Serializable {


	public ValidationDateAuth() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_validation")
    private int id_validation;
	
	
	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;
	
	@Column(name = "nbr_jour", nullable = true, columnDefinition = "NVARCHAR(255)")
	private Integer nbr_jour;

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;

	public int getId_validation() {
		return id_validation;
	}

	public void setId_validation(int id_validation) {
		this.id_validation = id_validation;
	}

	public Integer getNbr_jour() {
		return nbr_jour;
	}

	public void setNbr_jour(Integer nbr_jour) {
		this.nbr_jour = nbr_jour;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}


}
