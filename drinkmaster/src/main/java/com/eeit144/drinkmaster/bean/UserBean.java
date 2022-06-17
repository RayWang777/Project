package com.eeit144.drinkmaster.bean;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "users")
public class UserBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userid")
	private Integer userId;

	@Column(name = "username",nullable = false)
	private String userName;

	@Column(name = "useraccount",nullable = false)
	private String userAccount;

	@Column(name = "userpassword",nullable = false)
	private String userPassword;

	@Column(name = "useraddress",nullable = false)
	private String userAddress;

	@Column(name = "photo")
	private byte[] photo;

	@Column(name = "phone",nullable = false)
	private String phone;

	@Column(name = "role",nullable = false)
	private String role;
	
	@Column(name = "gender",nullable = false)
	private String gender;
	
	
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8" )
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	@Temporal(TemporalType.DATE)
	@Column(name = "birthday", columnDefinition="date")
	private Date birthday;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8" ) // JSP DATE
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") //MVC DATE 
	@Temporal(TemporalType.TIMESTAMP)	//SQL DATE
	@Column(name = "createdate", columnDefinition="datetime",nullable = false)
	private Date createdate;
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "userBean",cascade = CascadeType.ALL)
	private Set<ServiceBean> services = new LinkedHashSet<ServiceBean>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "userBean",cascade = CascadeType.ALL)
	private Set<ShopCarBean> shopCars = new LinkedHashSet<ShopCarBean>();
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "userBean",cascade = CascadeType.ALL)
	private Set<CommentBean> comments = new LinkedHashSet<CommentBean>();
	
	public UserBean() {
		super();
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Set<ServiceBean> getServices() {
		return services;
	}

	public void setServices(Set<ServiceBean> services) {
		this.services = services;
	}

}
