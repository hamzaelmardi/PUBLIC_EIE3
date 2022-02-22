package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@id")
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "role")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Role implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roleId;
	
	public String getNom() {
		return nom;
	}
	
	

	public void setNom(String nom) {
		this.nom = nom;
	}

	@Column(name = "nom",columnDefinition = "NVARCHAR(255)")
	private String nom;
	@Column(name = "type",columnDefinition = "NVARCHAR(255)")
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "nomFr",columnDefinition = "NVARCHAR(255)")
	private String nomFr;
	
	
	
	
	

	

	



	public String getNomFr() {
		return nomFr;
	}



	public void setNomFr(String nomFr) {
		this.nomFr = nomFr;
	}



	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}


	
	

	

	
	
	
	
	

	
	
	
	
	
	
	
	


	

}
