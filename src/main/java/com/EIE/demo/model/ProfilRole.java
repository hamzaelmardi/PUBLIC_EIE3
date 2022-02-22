package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.None.class, property = "@id")
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "profilerole")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class ProfilRole implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int profilroleId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "roleId")
	private Role role;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "profilId")
	private Profil profil;
	
	
	public int getProfilroleId() {
		return profilroleId;
	}



	public void setProfilroleId(int profilroleId) {
		this.profilroleId = profilroleId;
	}



	public Role getRole() {
		return role;
	}



	public void setRole(Role role) {
		this.role = role;
	}



	public Profil getProfil() {
		return profil;
	}



	public void setProfil(Profil profil) {
		this.profil = profil;
	}



	public String getValider() {
		return valider;
	}



	public void setValider(String valider) {
		this.valider = valider;
	}



	public String getModifier() {
		return modifier;
	}



	public void setModifier(String modifier) {
		this.modifier = modifier;
	}



	public String getAnnuler() {
		return annuler;
	}



	public void setAnnuler(String annuler) {
		this.annuler = annuler;
	}

	@Column(name = "valider",columnDefinition = "NVARCHAR(255)")
	private String valider;
	
	@Column(name = "modifier",columnDefinition = "NVARCHAR(255)")
	private String modifier;
	
	@Column(name = "tous",columnDefinition = "NVARCHAR(255)")
	private String tous;
	
	public String getTous() {
		return tous;
	}



	public void setTous(String tous) {
		this.tous = tous;
	}

	@Column(name = "annuler",columnDefinition = "NVARCHAR(255)")
	private String annuler;
	
	
	
	
	

	

	



	
	


	
	

	

	
	
	
	
	

	
	
	
	
	
	
	
	


	

}
