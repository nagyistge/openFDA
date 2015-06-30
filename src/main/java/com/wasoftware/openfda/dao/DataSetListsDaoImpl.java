package com.wasoftware.openfda.dao;

/**
 * Created by yipty on 6/25/2015.
 */
import java.util.List;
import com.wasoftware.openfda.model.DataSetListsEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DataSetListsDaoImpl implements DataSetListsDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addDataSetListsEntity(DataSetListsEntity dataSetList) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(dataSetList);        
        System.out.println("DataSetLists saved successfully, DataSetLists Details=" + dataSetList);
    }

    @Override
    public void updateDataSetListsEntity(DataSetListsEntity dataSetList) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(dataSetList);
        System.out.println("DataSetLists  updated successfully, DataSetLists Details=" + dataSetList);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<DataSetListsEntity> listDataSetListsEntity() {
        Session session = this.sessionFactory.getCurrentSession();
        List<DataSetListsEntity> dataSetListsEntityList = session.createQuery("from DataSetListsEntity d order by d.id desc").list();
        for (DataSetListsEntity dataSetList : dataSetListsEntityList) {
            System.out.println("DataSetLists List::" + dataSetList);
        }

        return dataSetListsEntityList;
    }

    @Override
    public DataSetListsEntity getDataSetListsEntityById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        DataSetListsEntity dataSetList = (DataSetListsEntity) session.load(DataSetListsEntity.class, new Integer(id));
        System.out.println("DataSetLists loaded successfully, DataSetLists details=" + dataSetList);
        return dataSetList;
    }

    @Override
    public void removeDataSetListsEntity(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        DataSetListsEntity dataSetList = (DataSetListsEntity) session.load(DataSetListsEntity.class, new Integer(id));
        if (null != dataSetList) {
            session.delete(dataSetList);
        }
        System.out.println("DataSetLists deleted successfully, DataSetLists details=" + dataSetList);
    }
}
