package az.lesson.course.service;

import model.AdvancedSearch;
import model.Schedule;

import java.util.List;

public interface ScheduleService {

    boolean addSchedule(Schedule schedule) throws Exception;

    List<Schedule> getScheduleList() throws Exception;

    List<Schedule> searchSchedule(String keyword) throws  Exception;

    List<Schedule> advancedSearchScheduleList(AdvancedSearch advancedSearch) throws Exception;
}
