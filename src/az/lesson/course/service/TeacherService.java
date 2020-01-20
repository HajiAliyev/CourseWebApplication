package az.lesson.course.service;

import model.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> getTeacherList() throws Exception;

    boolean addTeacher(Teacher teacher) throws Exception;

    List<Teacher> getTeacherListByLessonId(Long lessonId) throws Exception;
}
