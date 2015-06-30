package com.wasoftware.openfda.dao;

import com.wasoftware.openfda.model.DataSetsEntity;
import java.util.List;

/**
 * Created by yipty on 6/25/2015.
 */
public interface DataSetsDao {
    public void addDataSetsEntity(DataSetsEntity p);
    public void updateDataSetsEntity(DataSetsEntity p);
    public List<DataSetsEntity> listDataSetsEntity();
    public List<DataSetsEntity> listDataSetsEntityByDataSetListID(int listId);
    public DataSetsEntity getDataSetsEntityById(int id);
    public void removeDataSetsEntity(int id);
    public void removeDataSetsEntityByDataSetListID(int id);
}
