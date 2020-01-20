package az.lesson.course.web;

import az.lesson.course.dao.LoginDao;
import az.lesson.course.dao.impl.LoginDaoImpl;
import az.lesson.course.service.LoginService;
import az.lesson.course.service.impl.LoginServiceImpl;
import model.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = "/ls")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = "";
        LoginDao loginDao = new LoginDaoImpl();
        LoginService loginService = new LoginServiceImpl(loginDao);
        try{
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if(username != null && !username.isEmpty() && password!= null && !password.isEmpty()){
              Login login =  loginService.login(username,password);
              if(login!=null){
                  HttpSession session = request.getSession(true);
                  session.setAttribute("login",login);
                  address = "index.jsp";
              }else {
                  request.setAttribute("invalid","Username or password invalid");
                  address = "login.jsp";
              }

            }else {
                request.setAttribute("invalid","Username or password empty");
                address = "login.jsp";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request,response);
    }

}
