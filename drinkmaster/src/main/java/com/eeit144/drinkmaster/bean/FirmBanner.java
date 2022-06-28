package com.eeit144.drinkmaster.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "firmBanner")
public class FirmBanner {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Transient
	private Integer firmId;
	
	@OneToOne
	@JoinColumn(name="firmId")
	private FirmBean firmBean;

	@Column(name="firmPic", columnDefinition = "varbinary(max)")
	private byte[] firmPiic;

	public Integer getFirmId() {
		return firmId;
	}

	public void setFirmId(Integer firmId) {
		this.firmId = firmId;
	}

	public byte[] getFirmPiic() {
		return firmPiic;
	}

	public void setFirmPiic(byte[] firmPiic) {
		this.firmPiic = firmPiic;
	}
	
	

	public FirmBean getFirmBean() {
		return firmBean;
	}

	public void setFirmBean(FirmBean firmBean) {
		this.firmBean = firmBean;
	}

	public FirmBanner() {
	}

}
