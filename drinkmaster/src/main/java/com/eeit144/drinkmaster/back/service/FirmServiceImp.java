package com.eeit144.drinkmaster.back.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eeit144.drinkmaster.back.model.FirmService;
import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.dao.FirmRepository;
import com.eeit144.drinkmaster.dto.FirmDTO;

@Service
@Transactional
public class FirmServiceImp implements FirmService {

	private FirmRepository firmDao;

	@Autowired
	public FirmServiceImp(FirmRepository firmDao) {
		super();
		this.firmDao = firmDao;
	}

	@Override
	public Optional<FirmBean> findById(Integer id) {
		return firmDao.findById(id);
	}

	@Override
	public Page<FirmBean> findAll(Pageable pab) {
		return firmDao.findAll(pab);
	}

	@Override
	public void deleteById(Integer id) {
		firmDao.deleteById(id);
	}

	@Override
	public void insertFirm(FirmBean firm) {
		firmDao.save(firm);
	}

	@Override
	public FirmDTO change(FirmBean firm) {
		FirmDTO firmDTO = new FirmDTO();
		firmDTO.setFirmId(firm.getFirmId());
		firmDTO.setFirmName(firm.getFirmName());
		firmDTO.setFirmAddress(firm.getFirmAddress());
		firmDTO.setFirmPhone(firm.getFirmPhone());
		firmDTO.setUserId(firm.getUserBean().getUserId());
		return firmDTO;
	}

	@Override
	public Page<FirmBean> findAllByFirmNameOrFirmPhone(String FirmName, String FirmPhone, Pageable pab) {
		return firmDao.findAllByFirmNameContainingAndFirmPhoneContaining(FirmName, FirmPhone, pab);
	}

	public Page<FirmBean> findAll2(Example<FirmBean> firm, Pageable pab) {
		return firmDao.findAll(firm, pab);
	}

	public void deleteByIds(List<Integer> ids) {
		firmDao.deleteAllById(ids);
	}
	
	@Override
	public Page<FirmBean> findFirmByUserId(Integer userId, Pageable pab) {
		return firmDao.findByUserBean_userId(userId, pab);
	}

	@Override
	public List<FirmBean> findFirmByUserId(Integer userId) {
		return firmDao.findByUserBean_userId(userId);
	}

	@Override
	public List<FirmBean> findAll3() {
		return firmDao.findAll();
	}

	@Override
	public List<FirmBean> findByFirmNameContaining(String firmName) {
		return firmDao.findByFirmNameContaining(firmName);
	}



}
