package az.lesson.course.service;

import model.Lesson;

import java.util.List;

public interface LessonService {

    List<Lesson> getLessonList() throws Exception;

    boolean addLesson(Lesson lesson) throws Exception;
}
