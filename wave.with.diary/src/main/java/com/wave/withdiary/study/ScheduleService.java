package com.wave.withdiary.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService implements IScheduleService {

	@Autowired
	private IScheduleDao dao;
	
	@Override
	public List<ScheduleDto> listSch() {
		return dao.listSch();
	}
	
	@Override
	public int insertSch(ScheduleDto vo) {
		return dao.insertSch(vo);
	}

	@Override
	public int updateSch(ScheduleDto vo) {
		return dao.updateSch(vo);
	}

	@Override
	public ScheduleDto selectSch(int studyNo) {
		// TODO Auto-generated method stub
		return dao.selectSch(studyNo);
	}

	@Override
	public int deleteSch(int studyNo) {
		// TODO Auto-generated method stub
		return dao.deleteSch(studyNo);
	}

}
