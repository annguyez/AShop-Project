package com.annguyen.service;

import java.util.List;

import com.annguyen.entity.Roles;

public interface RolesServices {
	public List<Roles> getListRoles();
	public void delete(int role_id);
	public void create(Roles role_id );
	public void update(Roles role_id );
	public int getLastest();
	public Roles getRole(int role_id);
	public boolean check(String role_name);
}
