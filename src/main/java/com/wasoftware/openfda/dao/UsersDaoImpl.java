package com.wasoftware.openfda.dao;

import com.wasoftware.openfda.model.UsersEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
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
    public UsersEntity getUsersEntityByUsername(String userName) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from UsersEntity u where u.username = :userName");
        query.setParameter("userName",userName);
        List<UsersEntity> usersList = query.list();
        UsersEntity users = usersList.get(0); // get the first one
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
