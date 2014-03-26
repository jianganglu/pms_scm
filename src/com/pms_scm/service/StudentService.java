package com.pms_scm.service;

import org.jeecgframework.core.common.service.CommonService;

import jeecg.system.pojo.base.TSUser;

public interface StudentService extends CommonService{

	public TSUser checkUserExits(TSUser user);
	public String getUserRole(TSUser user);
	public void pwdInit(TSUser user, String newPwd);
}
