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
import com.wasoftware.openfda.model.UsersEntity;
import com.wasoftware.openfda.Service.DataSetListsService;
import com.wasoftware.openfda.Service.DataSetsService;
import com.wasoftware.openfda.Service.UsersService;
import org.springframework.web.bind.annotation.PathVariable;
//import com.wasoftware.openfda.Dao.*;
import java.util.List;

/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class ViewDataController {
    private DataSetListsService dataSetListsService;
    private DataSetsService dataSetsService;
    private UsersService usersService;
    private int currentDataSetListID = 0 ;

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
    //JSONArray jsonArrayMeta = new JSONArray();

    @RequestMapping(value = "/dataSetLists", method = RequestMethod.GET)
    public String dataSetLists(ModelMap model) {
        System.out.println("i am here");
        List<DataSetListsEntity> dataSetListsEntityList = dataSetListsService.listDataSetListsEntity();
        model.addAttribute("dataSetListsEntityList",dataSetListsEntityList);
        return "dataSetLists";
    }

    @RequestMapping(value = "/viewDataSets/{id}", method = RequestMethod.GET)
    public String viewDataSets(ModelMap model,
                               @PathVariable("id") int selectedDateSetListID
                               //@RequestParam(value = "selectedSetListID", defaultValue = "0") String selectedDataSetListID
                                ) {
        //currentDataSetListID = Integer.parseInt(selectedDataSetListID);
        List<DataSetsEntity> dataSetsEntityList = dataSetsService.listDataSetsEntityByDataSetListID(selectedDateSetListID);
        model.addAttribute("dataSetsArray",dataSetsEntityList);
        return "dataSets";
    }
    @RequestMapping(value = "/deleteDataSets/{id}", method = RequestMethod.GET)
    public String deleteDataSets(ModelMap model,
                                 @PathVariable("id") int selectedDateSetListID
                                 ) {
        //currentDataSetListID = Integer.parseInt(selectedDataSetListID);
        dataSetListsService.removeDataSetListsEntity(selectedDateSetListID);
        dataSetsService.removeDataSetsEntityByDataSetListID(selectedDateSetListID);
        //model.addAttribute("dataSetsArray",dataSetsEntityList);
        return "redirect:/dataSetLists";
    }

    @RequestMapping(value = "/dataSetsNewGet", method = RequestMethod.GET)
    public String dataSetsNewGet(ModelMap model,
                                 @RequestParam(value = "fromDate", defaultValue = "") String fromDate,
                                 @RequestParam(value = "toDate", defaultValue = "") String toDate
                                 ) {
        //get current datasetlistid from session
        String errorMessage = "";
        String originalFromDate = fromDate;
        String originalToDate = toDate;
        if (fromDate.length() > 0 && toDate.length() > 0) {
            adverseEvent adverseevent = new adverseEvent();
            fromDate = FormatDate.formatDate(fromDate);
            toDate = FormatDate.formatDate(toDate);
            String jsonResult = "";
            //JSONArray jsonArrayResult;
            //jsonArrayResult = new JSONArray();
            JSONParser jsonParser = new JSONParser();
            try {
                jsonResult = adverseevent.getAdverseEventCountByDate(fromDate, toDate);
                System.out.println("xxxxxxxxxxxxxxx" + jsonResult);
                Object object = jsonParser.parse(jsonResult);
                JSONObject jsonObject = (JSONObject) object;
                //jsonArrayMeta = (JSONArray) jsonObject.get("meta");
                jsonObjectMeta = (JSONObject) jsonObject.get("meta");
                jsonArrayResult = (JSONArray) jsonObject.get("results");
                model.addAttribute("drugResultSet", jsonArrayResult.toString());
                model.addAttribute("hasResult", "yes");
            } catch (Exception e) {
                System.out.println(e.toString());
                errorMessage = GetMessage.getMessage("drugs.nodata");
            }
        }
        model.addAttribute("fromDate", originalFromDate);
        model.addAttribute("toDate", originalToDate);
        model.addAttribute("errorMessage", errorMessage);
        return "dataSets";
    }

    @RequestMapping(value = "/dataSetsOverwrite", method = RequestMethod.POST)
    public String dataSetsOverwrite(ModelMap model) {
        //get current datasetlistid from session
       /* DataSetListsEntity dataSetListsEntity = new DataSetListsEntity();
        dataSetListsEntity.setDataSetName("");
        dataSetListsEntity.setDataSetType("Drug");
        System.out.println("meta:   ccc " + jsonObjectMeta.toString());
        dataSetListsEntity.setMetadata(jsonObjectMeta.toString());
        dataSetListsEntity.setNotes("");*/
        //dataSetListsService.addDataSetListsEntity(dataSetListsEntity);
        // save detail data set
        for (Object item : jsonArrayResult) {
            JSONObject jo = (JSONObject) item;
            System.out.print(jo.get("time"));
            System.out.println(" : " + jo.get("count"));
            /*DataSetsEntity dataSetsEntity = new DataSetsEntity();
            dataSetsEntity.setKey((JSONObejct) item.get("time").toString());
            dataSetsEntity.setValue(item.get("count").toString());
            dataSetsEntity.setId(currentDataSetListID);
            dataSetsService.updateDataSetsEntity(dataSetsEntity);*/
        }
        return "dataSets";
    }

}

