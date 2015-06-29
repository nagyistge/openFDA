package com.wasoftware.openfda.model;

import javax.persistence.*;

/**
 * Created by yipty on 6/26/2015.
 */
@Entity
@Table(name = "DataSetLists", schema = "", catalog = "openfda_test")
public class DataSetListsEntity {
    private int id;
    private int user_id;
    private String dataSetName;
    private String dataSetType;
    private String keyName;
    private String valueName;
    private String metadata;
    private String notes;

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
    @Column(name = "user_id")
    public int getUserID() {
        return this.user_id;
    }

    public void setUserID(int user_id) {
        this.user_id = user_id;
    }

    @Basic
    @Column(name = "dataSetName")
    public String getDataSetName() {
        return dataSetName;
    }

    public void setDataSetName(String dataSetName) {
        this.dataSetName = dataSetName;
    }

    @Basic
    @Column(name = "dataSetType")
    public String getDataSetType() {
        return dataSetType;
    }

    public void setDataSetType(String dataSetType) {
        this.dataSetType = dataSetType;
    }

    @Basic
    @Column(name = "keyName")
    public String getKeyName() {
        return keyName;
    }

    public void setKeyName(String keyName) {
        this.keyName = keyName;
    }

    @Basic
    @Column(name = "valueName")
    public String getValueName() {
        return valueName;
    }

    public void setValueName(String valueName) {
        this.valueName = valueName;
    }

    @Basic
    @Column(name = "metadata")
    public String getMetadata() {
        return metadata;
    }

    public void setMetadata(String metadata) {
        this.metadata = metadata;
    }

    @Basic
    @Column(name = "notes")
    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DataSetListsEntity that = (DataSetListsEntity) o;

        if (id != that.id) return false;
        if (user_id != that.user_id) return false;
        if (dataSetName != null ? !dataSetName.equals(that.dataSetName) : that.dataSetName != null) return false;
        if (dataSetType != null ? !dataSetType.equals(that.dataSetType) : that.dataSetType != null) return false;
        if (keyName != null ? !keyName.equals(that.keyName) : that.keyName != null) return false;
        if (valueName != null ? !valueName.equals(that.valueName) : that.valueName != null) return false;
        if (metadata != null ? !metadata.equals(that.metadata) : that.metadata != null) return false;
        if (notes != null ? !notes.equals(that.notes) : that.notes != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31* result + user_id;
        result = 31 * result + (dataSetName != null ? dataSetName.hashCode() : 0);
        result = 31 * result + (dataSetType != null ? dataSetType.hashCode() : 0);
        result = 31 * result + (keyName != null ? keyName.hashCode() : 0);
        result = 31 * result + (valueName != null ? valueName.hashCode() : 0);
        result = 31 * result + (metadata != null ? metadata.hashCode() : 0);
        result = 31 * result + (notes != null ? notes.hashCode() : 0);
        return result;
    }
}
