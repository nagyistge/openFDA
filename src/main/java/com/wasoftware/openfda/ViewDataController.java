package com.wasoftware.openfda;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wasoftware.openfda.restclient.drug.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestParam;
import com.wasoftware.openfda.util.*;
import com.wasoftware.openfda.model.DataSetListsEntity;
import com.wasoftware.openfda.model.DataSetsEntity;
import com.wasoftware.openfda.service.DataSetListsService;
import com.wasoftware.openfda.service.DataSetsService;
import com.wasoftware.openfda.service.UsersService;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.List;


/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class ViewDataController {
    private DataSetListsService dataSetListsService;
    private DataSetsService dataSetsService;
    private int currentDataSetListID;


    @Autowired(required = true)
    @Qualifier(value = "dataSetListsService")
    public void setDataSetListsService(DataSetListsService dataSetListsService) {
        this.dataSetListsService = dataSetListsService;
    }

    @Autowired(required = true)
    @Qualifier(value = "dataSetsService")
    public void setDataSetsServiceService(DataSetsService ps) {
        this.dataSetsService = ps;
    }

    @Autowired(required = true)
    @Qualifier(value = "usersService")
    public void setUsersService(UsersService ps) {
        this.usersService = ps;
    }

    JSONObject jsonObjectMeta = new JSONObject();
    JSONArray jsonArrayResult = new JSONArray();

    @RequestMapping(value = "/dataSetLists", method = RequestMethod.GET)
    public String dataSetLists(ModelMap model) {
        List<DataSetListsEntity> dataSetListsEntityList = dataSetListsService.listDataSetListsEntity();
        model.addAttribute("dataSetListsEntityList",dataSetListsEntityList);
        return "dataSetLists";
    }

    @RequestMapping(value = "/viewDataSets/{id}", method = RequestMethod.GET)
    public String viewDataSets(ModelMap model,
                               @PathVariable("id") int selectedDateSetListID
                                ) {
        currentDataSetListID = selectedDateSetListID;
        DataSetListsEntity dataSetListsEntity = dataSetListsService.getDataSetListsEntityById(selectedDateSetListID );
        List<DataSetsEntity> dataSetsEntityList = dataSetsService.listDataSetsEntityByDataSetListID(selectedDateSetListID);
        jsonArrayResult = new JSONArray();
        for(DataSetsEntity dataSetsEntity : dataSetsEntityList){
            if (dataSetsEntity.getKey() != null) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("time", dataSetsEntity.getKey());
                jsonObject.put("count", dataSetsEntity.getValue());
                jsonArrayResult.add(jsonObject);
            }
        }
        model.addAttribute("currentDataSetListEntity",dataSetListsEntity);
        model.addAttribute("ResultSet",jsonArrayResult);
        model.addAttribute("hasResult","yes");
        return "dataSets";
    }
    @RequestMapping(value = "/deleteDataSets/{id}", method = RequestMethod.GET)
    public String deleteDataSets(
                                 @PathVariable("id") int selectedDateSetListID
                                 ) {
        dataSetListsService.removeDataSetListsEntity(selectedDateSetListID);
        dataSetsService.removeDataSetsEntityByDataSetListID(selectedDateSetListID);
        return "redirect:/dataSetLists";
    }


    @RequestMapping(value = "/viewDataSets", params="reloadData", method = RequestMethod.POST)
    public String dataSetsNewGet(ModelMap model,
                                 @RequestParam(value = "fromDate", defaultValue = "") String fromDate,
                                 @RequestParam(value = "toDate", defaultValue = "") String toDate
                                 ) {

        String errorMessage = "";
        String originalFromDate = fromDate;
        String originalToDate = toDate;
        if (fromDate.length() > 0 && toDate.length() > 0) {
            adverseEvent adverseevent = new adverseEvent();
            fromDate = FormatDate.formatDate(fromDate);
            toDate = FormatDate.formatDate(toDate);
            String jsonResult = "";
            JSONParser jsonParser = new JSONParser();
            try {
                jsonResult = adverseevent.getAdverseEventCountByDate(fromDate, toDate);
                Object object = jsonParser.parse(jsonResult);
                JSONObject jsonObject = (JSONObject) object;
                jsonObjectMeta = (JSONObject) jsonObject.get("meta");
                jsonArrayResult = (JSONArray) jsonObject.get("results");
                model.addAttribute("ResultSet", jsonArrayResult.toString());
                model.addAttribute("hasResult", "yes");
            } catch (Exception e) {
                System.out.println(e.toString());
                errorMessage = GetMessage.getMessage("drugs.nodata");
            }
        }
        DataSetListsEntity dataSetListsEntity = dataSetListsService.getDataSetListsEntityById(currentDataSetListID);
        dataSetListsEntity.setStartDate(originalFromDate);
        dataSetListsEntity.setEndDate(originalToDate);
        model.addAttribute("currentDataSetListEntity",dataSetListsEntity);
        model.addAttribute("errorMessage", errorMessage);
        return "dataSets";
    }


    @RequestMapping(value = "/viewDataSets", params="overwriteData", method = RequestMethod.POST)
    public String dataSetsOverwrite(ModelMap model,
                                    @RequestParam(value = "fromDate", defaultValue = "") String fromDate,
                                    @RequestParam(value = "toDate", defaultValue = "") String toDate
                                    ) {

        DataSetListsEntity dataSetListsEntity = dataSetListsService.getDataSetListsEntityById(currentDataSetListID);
        dataSetListsEntity.setMetadata(jsonObjectMeta.toString());
        dataSetListsEntity.setStartDate(fromDate);
        dataSetListsEntity.setEndDate(toDate);
        dataSetListsService.updateDataSetListsEntity(dataSetListsEntity);
        // save detail data set
        // remove old data set
        dataSetsService.removeDataSetsEntityByDataSetListID(currentDataSetListID);
        for (Object item : jsonArrayResult) {
            JSONObject jsonObjectItem = (JSONObject) item;
            DataSetsEntity dataSetsEntity = new DataSetsEntity();
            dataSetsEntity.setKey(jsonObjectItem.get("time").toString());
            dataSetsEntity.setValue(jsonObjectItem.get("count").toString());
            dataSetsEntity.setDataSetListID(currentDataSetListID);
            dataSetsService.addDataSetsEntity(dataSetsEntity);
            System.out.println("insert dtaset:"+ dataSetsEntity.getValue() + "," + dataSetsEntity.getId());
        }
        model.addAttribute("currentDataSetListEntity",dataSetListsEntity);
        model.addAttribute("ResultSet", jsonArrayResult.toString());
        model.addAttribute("hasResult", "yes");
        return "dataSets";
    }

}

