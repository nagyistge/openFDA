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
import org.springframework.web.bind.annotation.PathVariable;
import static org.apache.commons.lang.StringEscapeUtils.escapeHtml;
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


    JSONObject jsonObjectMeta = new JSONObject();
    JSONArray jsonArrayResult = new JSONArray();

    @RequestMapping(value = "/dataSetLists", method = RequestMethod.GET)
    public String dataSetLists(ModelMap model) {
        List<DataSetListsEntity> dataSetListsEntityList = dataSetListsService.listDataSetListsEntity();
        model.addAttribute("dataSetListsEntityList", dataSetListsEntityList);
        return "dataSetLists";
    }

    @RequestMapping(value = "/viewDataSets/{id}", method = RequestMethod.GET)
    public String viewDataSets(ModelMap model,
                               @PathVariable("id") int selectedDateSetListID
    ) {
        currentDataSetListID = selectedDateSetListID;
        DataSetListsEntity dataSetListsEntity = dataSetListsService.getDataSetListsEntityById(selectedDateSetListID);
        List<DataSetsEntity> dataSetsEntityList = dataSetsService.listDataSetsEntityByDataSetListID(selectedDateSetListID);
        jsonArrayResult = new JSONArray();
        for (DataSetsEntity dataSetsEntity : dataSetsEntityList) {
            if (dataSetsEntity.getKey() != null) {
                JSONObject jsonObject = new JSONObject();

                jsonObject.put("time", escapeHtml(dataSetsEntity.getKey()));
                jsonObject.put("count", escapeHtml(dataSetsEntity.getValue()));
                jsonArrayResult.add(jsonObject);
            }
        }

        model.addAttribute("ResultSet", jsonArrayResult);
        model.addAttribute("hasResult", "yes");
        model.addAttribute("currentDataSetListEntity", dataSetListsEntity);
        return "dataSets";
    }

    @RequestMapping(value = "/deleteDataSets/{id}", method = RequestMethod.GET)
    public String deleteDataSets(
            @PathVariable("id") int selectedDateSetListID
    ) {
        try {
            dataSetsService.removeDataSetsEntityByDataSetListID(selectedDateSetListID);
            dataSetListsService.removeDataSetListsEntity(selectedDateSetListID);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "redirect:/dataSetLists";
    }


    @RequestMapping(value = "/viewDataSets", params = "reloadData", method = RequestMethod.POST)
    public String dataSetsNewGet(ModelMap model,
                                 @RequestParam(value = "fromDate", defaultValue = "") String fromDate,
                                 @RequestParam(value = "toDate", defaultValue = "") String toDate
    ) {

        String errorMessage = "";
        String originalFromDate = fromDate;
        String originalToDate = toDate;
        if (fromDate.length() > 0 && toDate.length() > 0) {
            if (!ValidateDate.validateDate(fromDate)) {
                errorMessage = GetMessage.getMessage("error.fromdateerror");
            }
            if (!ValidateDate.validateDate(toDate) && (errorMessage.length() == 0)) {
                errorMessage = GetMessage.getMessage("error.todateerror");
            }
            if (!ValidateDate.compareDate(fromDate, toDate) && (errorMessage.length() == 0)) {
                errorMessage = GetMessage.getMessage("error.daterangeerror");
            }
            if (errorMessage.length() == 0) { //data validated
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
                    model.addAttribute("errorMessage", GetMessage.getMessage("viewdataset.datareloaded"));
                } catch (Exception e) {
                    System.out.println(e.toString());
                    model.addAttribute("errorMessage", GetMessage.getMessage("drugs.nodata"));
                }
            }
        }
        DataSetListsEntity dataSetListsEntity = dataSetListsService.getDataSetListsEntityById(currentDataSetListID);
        dataSetListsEntity.setStartDate(originalFromDate);
        dataSetListsEntity.setEndDate(originalToDate);
        model.addAttribute("currentDataSetListEntity", dataSetListsEntity);
        return "dataSets";
    }


    @RequestMapping(value = "/viewDataSets", params = "overwriteData", method = RequestMethod.POST)
    public String dataSetsOverwrite(ModelMap model,
                                    @RequestParam(value = "fromDate", defaultValue = "") String fromDate,
                                    @RequestParam(value = "toDate", defaultValue = "") String toDate
    ) {
        String errorMessage = "";
        DataSetListsEntity dataSetListsEntity = dataSetListsService.getDataSetListsEntityById(currentDataSetListID);

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
            model.addAttribute("errorMessage", GetMessage.getMessage("dataSet.dataoverwritten"));
        }
        model.addAttribute("currentDataSetListEntity", dataSetListsEntity);
        model.addAttribute("ResultSet", jsonArrayResult.toString());
        model.addAttribute("hasResult", "yes");
        return "dataSets";
    }

}

