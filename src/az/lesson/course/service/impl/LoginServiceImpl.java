package az.lesson.course.service.impl;

import az.lesson.course.dao.LoginDao;
import az.lesson.course.service.LoginService;
import model.Login;
import model.Role;

import java.util.List;

public class LoginServiceImpl implements LoginService {

    private LoginDao loginDao;

    public LoginServiceImpl(LoginDao loginDao) {
        this.loginDao = loginDao;
    }

    @Override
    public Login login(String username, String password) throws Exception {
        return loginDao.login(username,password);
    }

    @Override
    public List<Role> getRoleList() throws Exception {
        return loginDao.getRoleList();
    }

    @Override
    public boolean register(Login login) throws Exception {
        return loginDao.register(login);
    }
}
