package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "comite")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@JsonAutoDetect
public class Comite implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comiteId")
	private int comiteId;

	public int getComiteId() {
		return comiteId;
	}

	public void setComiteId(int comiteId) {
		this.comiteId = comiteId;
	}

	@Column(name = "nomComite_fr", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nomComite_fr;

	@Column(name = "nomComite_ar", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String nomComite_ar;

	public String getNomComite_fr() {
		return nomComite_fr;
	}

	public void setNomComite_fr(String nomComite_fr) {
		this.nomComite_fr = nomComite_fr;
	}

	public String getNomComite_ar() {
		return nomComite_ar;
	}

	public void setNomComite_ar(String nomComite_ar) {
		this.nomComite_ar = nomComite_ar;
	}

	@Column(name = "email", nullable = false, columnDefinition = "NVARCHAR(255)")

	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "tel", nullable = false, columnDefinition = "NVARCHAR(10)")

	private String tel;

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "adresse", nullable = true, columnDefinition = "NVARCHAR(MAX)")
	private String adresse;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	@Column(name = "type", nullable = true, columnDefinition = "NVARCHAR(255)")
	public String type;
	@Column(name = "permanent", nullable = true, columnDefinition = "NVARCHAR(255)")
	public String permanent;

	public String getPermanent() {
		return permanent;
	}

	public void setPermanent(String permanent) {
		this.permanent = permanent;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idRegion", nullable = true)
	private Region region;

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
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
