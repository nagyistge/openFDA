package com.wasoftware.openfda.Dao;

import com.wasoftware.openfda.model.UsersEntity;
import java.util.List;

/**
 * Created by yipty on 6/25/2015.
 */
public interface UsersDao {
    public void addUsersEntity(UsersEntity users);
    public void updateUsersEntity(UsersEntity users);
    public List<UsersEntity> listUsersEntity();
    public UsersEntity getUsersEntityById(int id);
    public UsersEntity getUsersEntityByUsername(String userName);
    public void removeUsersEntity(int id);
}
