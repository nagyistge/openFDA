package com.wasoftware.openfda.Dao;

import com.wasoftware.openfda.model.UsersEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
/**
 * Created by yipty on 6/25/2015.
 */
public class UsersDaoImpl implements UsersDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactoryf) {
        this.sessionFactory = sessionFactoryf;
    }

    @Override
    public void addUsersEntity(UsersEntity users) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(users);
        System.out.println("Users saved successfully, Users Details=" + users);
    }

    @Override
    public void updateUsersEntity(UsersEntity users) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(users);
        System.out.println("Users  updated successfully, Users Details=" + users);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<UsersEntity> listUsersEntity() {
        Session session = this.sessionFactory.getCurrentSession();
        List<UsersEntity> usersEntityList = session.createQuery("from UsersEntity").list();
        for (UsersEntity users : usersEntityList) {
            System.out.println("Users List::" + users);
        }

        return usersEntityList;
    }

    @Override
    public UsersEntity getUsersEntityById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        UsersEntity users = (UsersEntity) session.load(UsersEntity.class, new Integer(id));
        System.out.println("Users loaded successfully, Users details=" + users);
        return users;
    }

    @Override
    public void removeUsersEntity(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        UsersEntity users = (UsersEntity) session.load(UsersEntity.class, new Integer(id));
        if (null != users) {
            session.delete(users);
        }
        System.out.println("Users deleted successfully, Users details=" + users);
    }
}
