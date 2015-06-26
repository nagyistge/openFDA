package com.wasoftware.openfda.Service;

/**
 * Created by yipty on 6/25/2015.
 */

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import com.wasoftware.openfda.Dao.DataSetsDao;
import com.wasoftware.openfda.model.DataSetsEntity;

public class DataSetsServiceImpl implements DataSetsDao{
    private DataSetsDao dataSetsDao;

    public void setDataSetsDao(DataSetsDao dataSetsDao) {
        this.dataSetsDao = dataSetsDao;
    }

    @Override
    @Transactional
    public void addDataSetsEntity(DataSetsEntity dataSets) {
        this.dataSetsDao.addDataSetsEntity(dataSets);
    }

    @Override
    @Transactional
    public void updateDataSetsEntity(DataSetsEntity dataSets) {
        this.dataSetsDao.updateDataSetsEntity(dataSets);
    }

    @Override
    @Transactional
    public List<DataSetsEntity> listDataSetsEntity() {
        return this.dataSetsDao.listDataSetsEntity();
    }


    @Override
    @Transactional
    public DataSetsEntity getDataSetsEntityById(int id) {
        return this.dataSetsDao.getDataSetsEntityById(id);
    }

    @Override
    @Transactional
    public void removeDataSetsEntity(int id) {
        this.dataSetsDao.removeDataSetsEntity(id);
    }
}
