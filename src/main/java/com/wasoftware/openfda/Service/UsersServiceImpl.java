package com.wasoftware.openfda.Service;

/**
 * Created by yipty on 6/25/2015.
 */

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import com.wasoftware.openfda.Dao.UsersDao;
import com.wasoftware.openfda.model.UsersEntity;

public class UsersServiceImpl implements UsersDao {
    private UsersDao usersDao;

    public void setUsersDao(UsersDao usersDao) {
        this.usersDao = usersDao;
    }

    @Override
    @Transactional
    public void addUsersEntity(UsersEntity users) {
        this.usersDao.addUsersEntity(users);
    }

    @Override
    @Transactional
    public void updateUsersEntity(UsersEntity users) {
        this.usersDao.updateUsersEntity(users);
    }

    @Override
    @Transactional
    public List<UsersEntity> listUsersEntity() {
        return this.usersDao.listUsersEntity();
    }


    @Override
    @Transactional
    public UsersEntity getUsersEntityById(int id) {
        return this.usersDao.getUsersEntityById(id);
    }

    @Override
    @Transactional
    public void removeUsersEntity(int id) {
        this.usersDao.removeUsersEntity(id);
    }
}
