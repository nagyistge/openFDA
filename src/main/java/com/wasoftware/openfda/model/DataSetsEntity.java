package com.wasoftware.openfda.model;

import javax.persistence.*;

/**
 * Created by yipty on 6/26/2015.
 */
@Entity
@Table(name = "DataSets", schema = "", catalog = "openfda_test")
public class DataSetsEntity {
    private int id;
    private int dataSetList_id;
    private String key;
    private String value;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "dataSetList_id")
    public int getDataSetListID() {
        return this.dataSetList_id;
    }

    public void setDataSetListID(int ListId) {this.dataSetList_id = ListId;}

    @Basic
    @Column(name = "`key`")
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    @Basic
    @Column(name = "value")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DataSetsEntity that = (DataSetsEntity) o;

        if (id != that.id) return false;
        if (dataSetList_id != that.dataSetList_id) return false;
        if (key != null ? !key.equals(that.key) : that.key != null) return false;
        if (value != null ? !value.equals(that.value) : that.value != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + dataSetList_id;
        result = 31 * result + (key != null ? key.hashCode() : 0);
        result = 31 * result + (value != null ? value.hashCode() : 0);
        return result;
    }
}
