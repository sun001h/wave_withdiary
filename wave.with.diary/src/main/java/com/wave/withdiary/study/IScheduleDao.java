package com.wave.withdiary.study;

import java.util.List;

public interface IScheduleDao {
	
	public List<ScheduleDto> listSch();
	public int insertSch(ScheduleDto vo);
	public int updateSch(ScheduleDto vo);
	public int deleteSch(int studyNo);
	public ScheduleDto selectSch(int studyNo);

	
}
