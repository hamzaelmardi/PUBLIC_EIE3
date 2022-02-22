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
@Table(name = "detail_region")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class DetailRegion implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public DetailRegion() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_detail")
	private int id_detail;

	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "detail_region_region",
			joinColumns = { @JoinColumn(name = "id_detail") },
			inverseJoinColumns = { @JoinColumn(name = "id_region") })
	private List<Region> region = new ArrayList<Region>();


	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "detail_region_prefecture",
			joinColumns = { @JoinColumn(name = "id_detail") },
			inverseJoinColumns = { @JoinColumn(name = "id_prefecture") })
	private List<Prefecture> prefectures = new ArrayList<Prefecture>();


	@ManyToMany(fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "detail_region_commune",
			joinColumns = { @JoinColumn(name = "id_detail") },
			inverseJoinColumns = { @JoinColumn(name = "id_commune") })
	private List<Commune> communes = new ArrayList<Commune>();


	@Column(name = "deleteDateTime", nullable = true)
	private Date deleteDateTime;


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public int getId_detail() {
		return id_detail;
	}

	public void setId_detail(int id_detail) {
		this.id_detail = id_detail;
	}

	public List<Region> getRegion() {
		return region;
	}

	public void setRegion(List<Region> region) {
		this.region = region;
	}

	public List<Prefecture> getPrefectures() {
		return prefectures;
	}

	public void setPrefectures(List<Prefecture> prefectures) {
		this.prefectures = prefectures;
	}

	public List<Commune> getCommunes() {
		return communes;
	}

	public void setCommunes(List<Commune> communes) {
		this.communes = communes;
	}

	public Date getDeleteDateTime() {
		return deleteDateTime;
	}

	public void setDeleteDateTime(Date deleteDateTime) {
		this.deleteDateTime = deleteDateTime;
	}
}
