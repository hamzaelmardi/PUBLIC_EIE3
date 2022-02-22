package com.EIE.demo.web;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.EIE.demo.dataService.WebService;
import com.EIE.demo.dataService.WebServiceRegion;
import com.EIE.demo.model.Compte;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller

public class ControlerTest {


	@Autowired
	private WebService webt;
	@Autowired
	private WebServiceRegion web;
	
	
//	@RequestMapping(value = "/api/getFamille", method = RequestMethod.GET)
//	public  ModelAndView getStockOneMagasin() {
//		Map<String, Object> model = new HashMap<String, Object>();
//		
//		Famille[] finAppelAll=web.getFamile();
//	
//		
//	
//		model.put("me", finAppelAll);
//		return new ModelAndView("acceuil/acceuil", model);
//	}
	
	
	/*@RequestMapping(value = { "/*" }, method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session, Principal principal) {

		return (principal != null) ? "/login" : "redirect:connexion";//addjsp
	}*/

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView indexS(HttpServletRequest request, HttpSession session, Principal principal) {

		Compte ct=webt.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user",ct);
		model.put("Preparezvotredemarche",0);
		if(ct==null) {
			return new ModelAndView("login", model);
		}
		else {
			return new ModelAndView("login6", model);
		}
	}

	@RequestMapping(value = { "/index" }, method = RequestMethod.GET)
	public ModelAndView getPage(HttpServletRequest request, HttpSession session, Principal principal) {
		Compte ct=webt.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user",ct);
		model.put("Preparezvotredemarche",0);
		if(ct==null) {
			return new ModelAndView("login", model);
		}
		else {
			return new ModelAndView("login6", model);
		}
	}

	@RequestMapping(value = { "/Preparezvotredemarche" }, method = RequestMethod.GET)
	public ModelAndView login6(HttpServletRequest request, HttpSession session, Principal principal) {
		Compte ct=webt.getCompteConnected();
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user",ct);
		model.put("Preparezvotredemarche",1);
		return new ModelAndView("login6", model);

	}



}
	








