package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "prefecture")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Prefecture implements Serializable {
	
	public Prefecture() {
		
	}

	@Id
    @GeneratedValue (strategy=GenerationType.IDENTITY)
    @Column (name="id_prefecture")
    private int id_prefecture;
	
	

	public int getId_prefecture() {
		return id_prefecture;
	}

	public void setId_prefecture(int id_prefecture) {
		this.id_prefecture = id_prefecture;
	}
	
	public List<Commune> getCommune() {
		return commune;
	}

	public void setCommune(List<Commune> commune) {
		this.commune = commune;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "commune_prefecture", joinColumns = {
			@JoinColumn(name = "id_prefectures") }, inverseJoinColumns = { @JoinColumn(name = "id_commune") })

	private List<Commune> commune = new ArrayList<Commune>();

	@Column(name = "nom_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_fr;

	@Column(name = "nom_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nom_ar;

	public String getNom_ar() {
		return nom_ar;
	}

	public void setNom_ar(String nom_ar) {
		this.nom_ar = nom_ar;
	}

	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;
	
	
	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	
	

	public String getNom_fr() {
		return nom_fr;
	}

	public void setNom_fr(String nom_fr) {
		this.nom_fr = nom_fr;
	}

	
	
	

	

	

	
	

	

	
	

	
	
	
	

}
