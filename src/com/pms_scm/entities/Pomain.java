package com.pms_scm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.jeecgframework.core.common.entity.IdEntity;

@Entity
@Table(name = "t_s_pomain")
public class Pomain extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private int pomainId;
	private String account;
	private String createTime;
	private String productCode;
	private int num;
	private int unitPrice;
	private int totalPrice;
	private String payType;
	private String vender;
	private String comm;
	private String status;
	private String stockUser;
	private String stockTime;
	private String payUser;
	private String payTime;
	private String endUser;
	private String endTime;
	private String createTime2;

	@Transient
	public String getCreateTime2() {
		return createTime2;
	}

	public void setCreateTime2(String createTime2) {
		this.createTime2 = createTime2;
	}

	@Column(name = "pomainId")
	public int getPomainId() {
		return pomainId;
	}

	public void setPomainId(int pomainId) {
		this.pomainId = pomainId;
	}

	@Column(name = "account")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "createTime")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Column(name = "productCode")
	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	@Column(name = "num")
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Column(name = "unitPrice")
	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	@Column(name = "totalPrice")
	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name = "payType")
	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	@Column(name = "vender")
	public String getVender() {
		return vender;
	}

	public void setVender(String vender) {
		this.vender = vender;
	}

	@Column(name = "comm")
	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	@Column(name = "status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "stockUser")
	public String getStockUser() {
		return stockUser;
	}

	public void setStockUser(String stockUser) {
		this.stockUser = stockUser;
	}

	@Column(name = "stockTime")
	public String getStockTime() {
		return stockTime;
	}

	public void setStockTime(String stockTime) {
		this.stockTime = stockTime;
	}

	@Column(name = "payUser")
	public String getPayUser() {
		return payUser;
	}

	public void setPayUser(String payUser) {
		this.payUser = payUser;
	}

	@Column(name = "payTime")
	public String getPayTime() {
		return payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	@Column(name = "endUser")
	public String getEndUser() {
		return endUser;
	}

	public void setEndUser(String endUser) {
		this.endUser = endUser;
	}

	@Column(name = "endTime")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}
