package com.wasoftware.openfda.service;

/**
 * Created by yipty on 6/25/2015.
 */
import java.util.List;

import com.wasoftware.openfda.model.DataSetsEntity;
public interface DataSetsService {
    public void addDataSetsEntity(DataSetsEntity dataSet);
    public void updateDataSetsEntity( DataSetsEntity dataSet);
    public List<DataSetsEntity> listDataSetsEntity();
    public List<DataSetsEntity> listDataSetsEntityByDataSetListID(int listId);
    public DataSetsEntity getDataSetsEntityById(int id);
    public void removeDataSetsEntity(int id);
    public void removeDataSetsEntityByDataSetListID(int id);
}
