package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class User implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userId")
	private int userId;

	@Column(name = "nom", nullable = true, length = 255, columnDefinition = "NVARCHAR(255)")
	protected String nom;
	@Column(name = "prenom", nullable = true, length = 255, columnDefinition = "NVARCHAR(255)")
	protected String prenom;

	@Column(name = "username", nullable = true, length = 255, columnDefinition = "NVARCHAR(255)", unique = true)
	private String username;

	@Column(name = "active", nullable = true, length = 255, columnDefinition = "NVARCHAR(255)")
	protected String active;
	

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "nombreVisit", nullable = true, length = 255)
	private int nombreVisit;

	public int getNombreVisit() {
		return nombreVisit;
	}

	public void setNombreVisit(int i) {
		this.nombreVisit = i;
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "UserNormaleRole", joinColumns = { @JoinColumn(name = "UserNormaleId") }, inverseJoinColumns = {
			@JoinColumn(name = "UserRoleId") })

	private List<UserRole> userRole = new ArrayList<UserRole>();

	public List<UserRole> getUserRole() {
		return userRole;
	}

	public void setUserRole(List<UserRole> userRole) {
		this.userRole = userRole;
	}

	@Column(name = "email", nullable = true, length = 255, columnDefinition = "NVARCHAR(255)")
	protected String email;

	@Column(name = "pass", nullable = true, length = 255, columnDefinition = "NVARCHAR(255)")
	protected String pass;

	public String getPassConfirm() {
		return passConfirm;
	}

	public void setPassConfirm(String passConfirm) {
		this.passConfirm = passConfirm;
	}

	@Column
	@CreationTimestamp
	private LocalDateTime createDateTime;

	@Column
	@UpdateTimestamp
	private LocalDateTime updateDateTime;

	public LocalDateTime getCreateDateTime() {
		return createDateTime;
	}

	public void setCreateDateTime(LocalDateTime createDateTime) {
		this.createDateTime = createDateTime;
	}

	public LocalDateTime getUpdateDateTime() {
		return updateDateTime;
	}

	public void setUpdateDateTime(LocalDateTime updateDateTime) {
		this.updateDateTime = updateDateTime;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}

	@Column
	private Date deleteDateTime;

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Transient
	protected String passConfirm;

	@Column(name = "poste", nullable = true, length = 255, columnDefinition = "NVARCHAR(255)")
	protected String poste;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public String getPoste() {
		return poste;
	}

	public void setPoste(String poste) {
		this.poste = poste;
	}

}
