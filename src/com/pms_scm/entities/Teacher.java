package com.pms_scm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.jeecgframework.core.common.entity.IdEntity;

@Entity
@Table(name="t_s_teacher")
public class Teacher extends IdEntity implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String tname;
	private int tage;
	
	@Column(name = "tname")
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	@Column(name = "tage")
	public int getTage() {
		return tage;
	}
	public void setTage(int tage) {
		this.tage = tage;
	}
}
