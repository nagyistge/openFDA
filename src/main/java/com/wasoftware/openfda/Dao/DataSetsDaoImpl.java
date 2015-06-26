package com.wasoftware.openfda.Dao;

/**
 * Created by yipty on 6/25/2015.
 */
import java.util.List;
import com.wasoftware.openfda.model.DataSetsEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DataSetsDaoImpl implements DataSetsDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactoryf) {
        this.sessionFactory = sessionFactoryf;
    }

    @Override
    public void addDataSetsEntity(DataSetsEntity dataSet) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(dataSet);
        System.out.println("DataSets saved successfully, DataSets Details=" + dataSet);
    }

    @Override
    public void updateDataSetsEntity(DataSetsEntity dataSet) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(dataSet);
        System.out.println("DataSets  updated successfully, DataSets Details=" + dataSet);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<DataSetsEntity> listDataSetsEntity() {
        Session session = this.sessionFactory.getCurrentSession();
        List<DataSetsEntity> dataSetsEntityList = session.createQuery("from DataSetsEntity").list();
        for (DataSetsEntity dataSet : dataSetsEntityList) {
            System.out.println("DataSets List::" + dataSet);
        }

        return dataSetsEntityList;
    }

    @Override
    public DataSetsEntity getDataSetsEntityById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        DataSetsEntity dataSet = (DataSetsEntity) session.load(DataSetsEntity.class, new Integer(id));
        System.out.println("DataSets loaded successfully, DataSets details=" + dataSet);
        return dataSet;
    }

    @Override
    public void removeDataSetsEntity(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        DataSetsEntity dataSet = (DataSetsEntity) session.load(DataSetsEntity.class, new Integer(id));
        if (null != dataSet) {
            session.delete(dataSet);
        }
        System.out.println("DataSets deleted successfully, DataSets details=" + dataSet);
    }
}