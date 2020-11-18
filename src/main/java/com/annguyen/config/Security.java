package com.annguyen.config;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
@Configuration
@EnableWebSecurity
public class Security extends WebSecurityConfigurerAdapter{
	@Autowired
	DataSource dataSource;
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).
		usersByUsernameQuery("Select username,password,employee_id from employees where username=?")
		.authoritiesByUsernameQuery("select username,role_name from roles "
				+ "inner join employees on roles.role_id =employees.role_id where username= ?");
		
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests()
		.antMatchers("/admin/order/**").hasAnyRole("ADMIN","VENDER")
		.antMatchers("/admin/product/**").hasAnyRole("ADMIN", "VENDER")
		.antMatchers("/admin/role/**").hasAnyRole("ADMIN")
		.antMatchers("/admin/color/**").hasAnyRole("ADMIN")
		.antMatchers("/admin/category/**").hasAnyRole("ADMIN")
		.antMatchers("/admin/size/**").hasAnyRole("ADMIN")
		.antMatchers("/admin/allsale/**").hasAnyRole("ADMIN")
		.antMatchers("/admin/sale/**").hasAnyRole("ADMIN","VENDER")
		.antMatchers("/cart").hasAnyRole("USER", "ADMIN","VENDER")
		.antMatchers("/details/**").hasAnyRole("USER", "ADMIN","VENDER")
		.antMatchers("/checkout").hasAnyRole("USER", "ADMIN","VENDER")
		.antMatchers("/order").hasAnyRole("USER","ADMIN","VENDER")
		.antMatchers("/home").hasAnyRole("USER","ADMIN","VENDER")
		.antMatchers("/admin/**").hasAnyRole("ADMIN","VENDER")
		.anyRequest().permitAll().and().formLogin().loginPage("/login").loginProcessingUrl("/login")
		.usernameParameter("username").passwordParameter("password").defaultSuccessUrl("/home")
		.failureUrl("/login?error=Failed").and().exceptionHandling().accessDeniedPage("/404");
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}
