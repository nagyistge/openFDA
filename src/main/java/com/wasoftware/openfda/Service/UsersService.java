package com.wasoftware.openfda.Service;

/**
 * Created by yipty on 6/25/2015.
 */
import java.util.List;

import com.wasoftware.openfda.model.UsersEntity;
public interface UsersService {
    public void addUsersEntity(UsersEntity users);
    public void updateUsersEntity(UsersEntity users);
    public List<UsersEntity> listUsersEntity();
    public UsersEntity getUsersEntityById(int id);
    public UsersEntity getUsersEntityByUsername(String userName);
    public void removeUsersEntity(int id);
}
