package com.wasoftware.openfda.service;

/**
 * Created by yipty on 6/25/2015.
 */
import java.util.List;
import com.wasoftware.openfda.model.DataSetListsEntity;

public interface DataSetListsService {
    public void addDataSetListsEntity(DataSetListsEntity dataSetList);
    public void updateDataSetListsEntity(DataSetListsEntity dataSetList);
    public List<DataSetListsEntity> listDataSetListsEntity();
    public DataSetListsEntity getDataSetListsEntityById(int id);
    public void removeDataSetListsEntity(int id);
}
