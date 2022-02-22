package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;

@Entity

@Table(name = "userrole")

@Inheritance(strategy = InheritanceType.JOINED)

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class UserRole implements Serializable {

	@Id

	@GeneratedValue(strategy = GenerationType.AUTO)

	@Column(name = "userRoleId")
	private int userRoleId;

	@ManyToOne(fetch = FetchType.EAGER)

	@JoinColumn(name = "roleId")
	private Role role;

	@ManyToOne(fetch = FetchType.EAGER)

	@JoinColumn(name = "userId")
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)

	
	public int getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAjouter() {
		return ajouter;
	}

	public void setAjouter(String ajouter) {
		this.ajouter = ajouter;
	}

	public String getAfficher() {
		return afficher;
	}

	public void setAfficher(String afficher) {
		this.afficher = afficher;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public String getSupprimer() {
		return supprimer;
	}

	public void setSupprimer(String supprimer) {
		this.supprimer = supprimer;
	}

	public String getTous() {
		return tous;
	}

	public void setTous(String tous) {
		this.tous = tous;
	}

	String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column
	private String ajouter;

	@Column
	private String afficher;

	@Column
	private String modifier;

	@Column
	private String supprimer;

	@Column
	private String tous;

}
