package com.EIE.demo.model;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.PrimaryKeyJoinColumns;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "usernormale")

@PrimaryKeyJoinColumns({
@PrimaryKeyJoinColumn(name = "userId",referencedColumnName="userId" ),
})
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})

public class UserNormale extends User {
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    

	
	
	
	
	

}
