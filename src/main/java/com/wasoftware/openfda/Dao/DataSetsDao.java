package com.wasoftware.openfda.Dao;

import com.wasoftware.openfda.model.DataSetsEntity;
import java.util.List;

/**
 * Created by yipty on 6/25/2015.
 */
public interface DataSetsDao {
    public void addDataSetsEntity(DataSetsEntity p);
    public void updateDataSetsEntity(DataSetsEntity p);
    public List<DataSetsEntity> listDataSetsEntity();
    public DataSetsEntity getDataSetsEntityById(int id);
    public void removeDataSetsEntity(int id);
}
