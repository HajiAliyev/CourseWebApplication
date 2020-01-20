package az.lesson.course.service;

import model.Login;
import model.Role;

import java.util.List;

public interface LoginService {

    Login login(String username, String password) throws Exception;

    List<Role> getRoleList() throws Exception;

    boolean register(Login login) throws Exception;

}
