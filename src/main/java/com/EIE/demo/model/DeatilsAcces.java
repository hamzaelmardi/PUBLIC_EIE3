package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "detailsacce")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class DeatilsAcces implements Serializable {
	
	
	public DeatilsAcces() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_details")
    private int id_details;
	
	
	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String type;
	
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_groupe")
	private GroupAcces groupe;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_statut")
	private StatutProjet statut;
	
	

	public int getId_details() {
		return id_details;
	}

	public void setId_details(int id_details) {
		this.id_details = id_details;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public GroupAcces getGroupe() {
		return groupe;
	}

	public void setGroupe(GroupAcces groupe) {
		this.groupe = groupe;
	}

	public StatutProjet getStatut() {
		return statut;
	}

	public void setStatut(StatutProjet statut) {
		this.statut = statut;
	}

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	
	

	

	
}
