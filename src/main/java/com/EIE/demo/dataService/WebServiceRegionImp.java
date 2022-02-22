package com.EIE.demo.dataService;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Service
public class WebServiceRegionImp implements WebServiceRegion{
	@Value("${url}")
	private String urlRest;

//	@Override
//	public Famille[] getFamile() {
//
//		final String uri = urlRest+"/getFamille";
//		RestTemplate restTemplate = new RestTemplate();
//		Famille[] response =  restTemplate.getForObject(uri, Famille[].class);
//
//		return response;
//
//	}
	
	
	
	
	@RequestMapping(value = { "/*" }, method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session, Principal principal) {

		return (principal != null) ? "accueil" : "login";
	}

	
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String indexS(HttpServletRequest request, HttpSession session, Principal principal) {

		return "login";
	}
	
	@RequestMapping(value = { "/index" }, method = RequestMethod.GET)
	public String getPage(Principal principal) {

		return "login";
	}
	
	

	



}
