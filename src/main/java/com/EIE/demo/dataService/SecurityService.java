package com.EIE.demo.dataService;

public interface SecurityService {
    String findLoggedInUsername();

    public String  autologin(String username, String password);

	
}
