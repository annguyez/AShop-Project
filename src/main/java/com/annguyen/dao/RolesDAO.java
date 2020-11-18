package com.annguyen.dao;

import java.util.List;

import com.annguyen.entity.Category;
import com.annguyen.entity.Roles;

public interface RolesDAO {
	
	public Roles getRoles(int roles_id);
	public List<Roles> getListRoles();
	public String getRolesName(int roles_id);
	public List<String> getListRolesName();
	public void create(Roles roles );
	public void delete(int roles_id);
	public void update(Roles roles);
	public boolean check(String role_name);
}
