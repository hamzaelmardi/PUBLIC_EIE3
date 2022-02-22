package com.EIE.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@org.hibernate.annotations.Proxy(lazy = true)
@Table(name = "regiondoc")

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class RegionDoc implements Serializable {
	
	
	public RegionDoc() {
		
	}

	@Id
    @GeneratedValue (strategy= GenerationType. IDENTITY)
    @Column (name="id_regiondoc")
    private int id_regiondoc;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "region_id")
	private Region region;
	
	
	public int getId_regiondoc() {
		return id_regiondoc;
	}


	public void setId_regiondoc(int id_regiondoc) {
		this.id_regiondoc = id_regiondoc;
	}


	public Region getRegion() {
		return region;
	}


	public void setRegion(Region region) {
		this.region = region;
	}


	public String getDoc() {
		return doc;
	}


	public void setDoc(String doc) {
		this.doc = doc;
	}

	@Column(name = "doc", nullable = true, columnDefinition = "NVARCHAR(255)")
	private String doc;
	
	
}
