package az.lesson.course.service.impl;


import az.lesson.course.dao.LessonDao;
import az.lesson.course.dao.impl.LessonDaoİmpl;
import az.lesson.course.service.LessonService;
import model.Lesson;

import java.util.List;

public class LessonServiceİmpl implements LessonService{
    LessonDao lessonDao = new LessonDaoİmpl();

    public LessonServiceİmpl(LessonDao lessonDao) {

        this.lessonDao = lessonDao;
    }

    @Override
    public List<Lesson> getLessonList() throws Exception {
        return lessonDao.getLessonList();
    }

    @Override
    public boolean addLesson(Lesson lesson) throws Exception {
        return lessonDao.addLesson(lesson);
    }
}
