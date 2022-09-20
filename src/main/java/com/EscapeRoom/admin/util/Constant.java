package com.EscapeRoom.admin.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.EscapeRoom.admin.dao.ProjectAdminDao;
import com.EscapeRoom.reserve.dao.ReserveDao;

public class Constant {

	public static BCryptPasswordEncoder passwordEncoder;
	public static ProjectAdminDao edao;
}
