package com.wasoftware.openfda.service;

/**
 * Created by yipty on 6/25/2015.
 */

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import com.wasoftware.openfda.dao.DataSetListsDao;
import com.wasoftware.openfda.model.DataSetListsEntity;

@Service
public class DataSetListsServiceImpl implements DataSetListsService{

    private DataSetListsDao dataSetListsDao;

    public void setDataSetListsDao(DataSetListsDao dataSetListsDao) {
        this.dataSetListsDao = dataSetListsDao;
    }

    @Override
    @Transactional
    public void addDataSetListsEntity(DataSetListsEntity dataSetLists) {
        this.dataSetListsDao.addDataSetListsEntity(dataSetLists);
    }

    @Override
    @Transactional
    public void updateDataSetListsEntity(DataSetListsEntity dataSetLists) {
        this.dataSetListsDao.updateDataSetListsEntity(dataSetLists);
    }

    @Override
    @Transactional
    public List<DataSetListsEntity> listDataSetListsEntity() {
        return this.dataSetListsDao.listDataSetListsEntity();
    }


    @Override
    @Transactional
    public DataSetListsEntity getDataSetListsEntityById(int id) {
        return this.dataSetListsDao.getDataSetListsEntityById(id);
    }

    @Override
    @Transactional
    public int getDataSetListsEntityMaxId() {return this.dataSetListsDao.getDataSetListsEntityMaxId();}

    @Override
    @Transactional
    public void removeDataSetListsEntity(int id) {
        this.dataSetListsDao.removeDataSetListsEntity(id);
    }

}
