package com.EIE.demo;

import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.Compte;
import com.EIE.demo.model.ProfilRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private WebService web;

    @Override

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Compte user = web.chackmail(username);

        if (user == null)
            throw new UsernameNotFoundException(username);

        List<ProfilRole> roles = null;
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        try {
            for (ProfilRole role : roles) {
                String i = role.getRole().getNomFr();
                grantedAuthorities.add(new SimpleGrantedAuthority(i));
            }

        } catch (Exception e) {
            // Ignore ...
        }

        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
                grantedAuthorities);
    }
}
