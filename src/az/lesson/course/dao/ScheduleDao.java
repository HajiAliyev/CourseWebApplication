package az.lesson.course.dao;

import model.AdvancedSearch;
import model.Schedule;

import java.util.List;

public interface ScheduleDao {

    boolean addSchedule(Schedule schedule) throws Exception;

    List<Schedule> getScheduleList() throws Exception;

    List<Schedule> searchSchedule(String keyword) throws Exception;

    List<Schedule> advancedSearchScheduleList(AdvancedSearch advancedSearch) throws Exception;

}
