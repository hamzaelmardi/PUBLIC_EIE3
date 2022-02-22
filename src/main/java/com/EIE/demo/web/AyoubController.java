package com.EIE.demo.web;

import com.EIE.demo.dataService.WebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class AyoubController {

    @Autowired
    private WebService webt;

    @RequestMapping(value = "/api/checkUserEnv/{type}", method = RequestMethod.GET)
    public  String checkUserEnv(@PathVariable String type) {
        Map<String,Object> model = new HashMap<>();
        int nbr = 0;

        if(type.equals("EE") || type.equals("RS") || type.equals("NT")){
            nbr = webt.getNombreEIEByUser(webt.getCompteConnected().getCompteId(),type);
            if(nbr==0) {
                return "redirect:/api/demandeinformation/0/" + type;
            }
        }
        return "redirect:/api/checkUserEnv/"+type;

    }

    @RequestMapping(value = "/login7", method = RequestMethod.GET)
    public  ModelAndView login7() {

        return new ModelAndView("p_test/login7");
    }


}
