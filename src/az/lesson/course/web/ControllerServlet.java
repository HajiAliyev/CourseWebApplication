package az.lesson.course.web;

import az.lesson.course.dao.*;
import az.lesson.course.dao.impl.*;
import az.lesson.course.service.*;
import az.lesson.course.service.impl.*;
import model.*;
import util.Constant;
import util.Methods;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "ControllerServlet", urlPatterns = "/cs")
public class ControllerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String action = null;
        String address = null;

        StudentDao studentDao = new StudentDaoImpl();
        StudentService studentService = new StudentServiceImpl(studentDao);

        TeacherDao teacherDao = new TeacherDaoImpl();
        TeacherService teacherService = new TeacherServiceImpl(teacherDao);

        LessonDao lessonDao = new LessonDaoİmpl();
        LessonService lessonService = new LessonServiceİmpl(lessonDao);

        ScheduleDao scheduleDao = new ScheduleDaoImpl();
        ScheduleService scheduleService = new ScheduleServiceImpl(scheduleDao);

        LoginDao loginDao = new LoginDaoImpl();
        LoginService loginService = new LoginServiceImpl(loginDao);

        DateFormat df = new SimpleDateFormat("yy-mm-dd");


        try {
            if (request.getParameter("action") != null) {
                action = request.getParameter("action");
            }

            if (action.equalsIgnoreCase("register")) {
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String country = request.getParameter("country");
                String[] cities = request.getParameterValues("city");
                FileWriter fw = new FileWriter("D://natiqweb.txt", true);
                BufferedWriter bw = new BufferedWriter(fw);
                bw.write("Name: " + name);
                bw.newLine();
                bw.write("Surname: " + surname);
                bw.newLine();
                bw.write("Country: " + country);
                bw.newLine();
                bw.write("Cities: ");
                for (String city : cities) {
                    bw.write(city + " ");
                }
                bw.newLine();
                bw.close();
                pw.println("Melumat fayla yazildi.");
            } else if (action.equalsIgnoreCase(Constant.GET_STUDENT_LIST)) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    List<Student> studentList = studentDao.getStudentList();
                    request.setAttribute("studentList", studentList);
                    address = "WEB-INF/pages/studentList.jsp";
                }

            } else if (action.equalsIgnoreCase(Constant.GET_TEACHER_LIST)) {
                List<Teacher> teacherList = teacherDao.getTeacherList();
                request.setAttribute("teacherList", teacherList);
                address = "WEB-INF/pages/teacherList.jsp";
            } else if (action.equalsIgnoreCase("getLessonList")) {
                List<Lesson> lessonList = lessonDao.getLessonList();
                request.setAttribute("lessonList", lessonList);
                address = "WEB-INF/pages/lessonList.jsp";
            } else if (action.equalsIgnoreCase("newStudent")) {
                List<Role> roleList = loginService.getRoleList();
                request.setAttribute("roleList", roleList);
                address = "WEB-INF/pages/newStudent.jsp";
            } else if (action.equalsIgnoreCase("addStudent")) {
                Student student = new Student();
                String name = request.getParameter("name");
                student.setName(name);
                String surname = request.getParameter("surname");
                student.setSurname(surname);
                UUID code =  UUID.randomUUID();
                student.setDob( df.parse(request.getParameter("dob")));
                student.setAddress(request.getParameter("address"));
                student.setPhone(request.getParameter("phone"));
                String email = request.getParameter("email");
                student.setEmail(email);
                Login login = new Login();
                login.setUsername(request.getParameter("username"));
                Role role = new Role();
                role.setId(Long.parseLong(request.getParameter("role")));
                login.setRole(role);
                login.setName(name);
                login.setPassword(code.toString());
                login.setSurname(surname);
                boolean isSendMail = Methods.sendMail("New Password", "Your password is:"+ code.toString(), email);
                boolean isRegistered = loginService.register(login);
                boolean isAdded = studentService.addStudent(student);
                response.setContentType("text/html");
                if (isAdded && isRegistered && isSendMail) {
                    pw.print("success");
                } else if (isAdded && isRegistered == false && isSendMail){
                    pw.print("Student added but have a problem when giving access");
                } else {
                    pw.print("Problem bash verdi");
                }
            } else if (action.equalsIgnoreCase("newSchedule")) {
                List<Student> studentList = studentService.getStudentList();
                List<Teacher> teacherList = teacherService.getTeacherList();
                List<Lesson> lessonList = lessonService.getLessonList();
                request.setAttribute("studentList", studentList);
                request.setAttribute("teacherList", teacherList);
                request.setAttribute("lessonList", lessonList);
                address = "WEB-INF/pages/newSchedule.jsp";
            } else if (action.equalsIgnoreCase("addSchedule")) {
                Schedule schedule = new Schedule();
                Long studentCombo = Long.parseLong(request.getParameter("studentCombo"));
                Long teacherCombo = Long.parseLong(request.getParameter("teacherCombo"));
                Long lessonCombo = Long.parseLong(request.getParameter("lessonCombo"));
                Student student = new Student();
                student.setId(studentCombo);
                Teacher teacher = new Teacher();
                teacher.setId(teacherCombo);
                Lesson lesson = new Lesson();
                lesson.setId(lessonCombo);
                schedule.setStudent(student);
                schedule.setTeacher(teacher);
                schedule.setLesson(lesson);
                boolean isAdded = scheduleService.addSchedule(schedule);
                response.setContentType("text/html");
                if (isAdded) {
                    pw.print("success");
                } else {
                    pw.print("failed");
                }
            } else if (action.equalsIgnoreCase("getScheduleList")) {
                List<Schedule> scheduleList = scheduleService.getScheduleList();
                List<Teacher> teacherList = teacherService.getTeacherList();
                List<Lesson> lessonList = lessonService.getLessonList();
                request.setAttribute("scheduleList", scheduleList);
                request.setAttribute("teacherList", teacherList);
                request.setAttribute("lessonList", lessonList);
                address = "WEB-INF/pages/scheduleList.jsp";
            } else if (action.equalsIgnoreCase("addTeacher")) {
                Teacher teacher = new Teacher();
                teacher.setName(request.getParameter("name"));
                teacher.setSurname(request.getParameter("surname"));
                teacher.setDob(df.parse(request.getParameter("dob")));
                teacher.setAddress(request.getParameter("address"));
                teacher.setPhone(request.getParameter("phone"));
                teacher.setEmail(request.getParameter("email"));
                response.setContentType("text/html");
                boolean isAdded = teacherService.addTeacher(teacher);
                if (isAdded) {
                    pw.print("success");
                } else {
                    pw.print("failed");
                }
            } else if (action.equalsIgnoreCase("addLesson")) {
                Lesson lesson = new Lesson();
                lesson.setLessonName(request.getParameter("lessonName"));
                lesson.setLessonTime(Integer.parseInt(request.getParameter("lessonTime")));
                lesson.setLessonPrice(Double.valueOf(request.getParameter("lessonPrice")));
                response.setContentType("text/html");
                boolean isAdded = lessonService.addLesson(lesson);
                if (isAdded) {
                    pw.print("success");
                } else {
                    pw.print("failed");
                }
            } else if (action.equalsIgnoreCase(Constant.EDIT_STUDENT)) {
                Long studentId = Long.parseLong(request.getParameter("studentId"));
                Student student = studentService.getStudentById(studentId);
                request.setAttribute("student", student);
                address = "WEB-INF/pages/editStudent.jsp";


            } else if (action.equalsIgnoreCase(Constant.UPDATE_STUNDET)) {
                Long studentId = Long.parseLong(request.getParameter("studentId"));
                Student student = new Student();
                student.setName(request.getParameter("name"));
                student.setSurname(request.getParameter("surname"));
                student.setDob(df.parse(request.getParameter("dob")));
                student.setAddress(request.getParameter("address"));
                student.setPhone(request.getParameter("phone"));
                student.setEmail(request.getParameter("email"));
                boolean isAdded = studentService.updateStudent(student, studentId);
                response.setContentType("text/html");
                if (isAdded) {
                    pw.print("success");
                } else {
                    pw.print("failed");
                }
            } else if (action.equalsIgnoreCase(Constant.SEARCH_STUDENT)) {
                String keyword = request.getParameter("keyword");
                List<Student> studentList = studentService.searchStudent(keyword);
                request.setAttribute("studentList", studentList);
                address = "WEB-INF/pages/studentList.jsp";
            } else if (action.equalsIgnoreCase(Constant.SEARCH_SCHEDULE)) {
                String keyword = request.getParameter("keyword");
                List<Schedule> scheduleList = scheduleService.searchSchedule(keyword);
                request.setAttribute("scheduleList", scheduleList);
                address = "WEB-INF/pages/scheduleList.jsp";
            } else if (action.equalsIgnoreCase(Constant.GET_TEACHER_COMBO_BY_LESSON_ID)) {
                Long lessonId = Long.parseLong(request.getParameter("lessonId"));
                List<Teacher> teacherList = teacherService.getTeacherListByLessonId(lessonId);
                request.setAttribute("teacherList", teacherList);
                address = "WEB-INF/pages/teacherCombo.jsp";
            } else if (action.equalsIgnoreCase(Constant.ADVANCED_SEARCH_SCHEDULE)) {
                Long advLessonCombo = Long.parseLong(request.getParameter("advLessonCombo"));
                Long advTeacherCombo = Long.parseLong(request.getParameter("advTeacherCombo"));
                String advBeginDate = request.getParameter("advBeginDate");
                String advEndDate = request.getParameter("advEndDate");
                AdvancedSearch advancedSearch = new AdvancedSearch();
                advancedSearch.setLessonId(advLessonCombo);
                advancedSearch.setTeacherId(advTeacherCombo);
                advancedSearch.setBeginDate(advBeginDate);
                advancedSearch.setEndDate(advEndDate);
                List<Schedule> scheduleList = scheduleService.advancedSearchScheduleList(advancedSearch);
                request.setAttribute("scheduleList", scheduleList);
                address = "WEB-INF/pages/scheduleData.jsp";
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        if (address != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
        }


    }

}
