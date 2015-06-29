package com.wasoftware.openfda;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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


/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class DrugsController {
    private DataSetListsService dataSetListsService;
    private DataSetsService dataSetsService;
    private UsersService usersService;
    private String originalFromDate = "";
    private String originalToDate = "";

    @Autowired(required=true)
    @Qualifier(value="dataSetListsService")
    public void setDataSetListsService(DataSetListsService dataSetListsService){this.dataSetListsService = dataSetListsService;}

    @Autowired(required=true)
    @Qualifier(value="dataSetsService")
    public void setDataSetsServiceService(DataSetsService ps){ this.dataSetsService = ps;}

    @Autowired(required=true)
    @Qualifier(value="usersService")
    public void setUsersService(UsersService ps){this.usersService = ps; }

    JSONObject jsonObjectMeta = new JSONObject();
    JSONArray jsonArrayResult =  new JSONArray();
    JSONArray jsonArrayMeta =  new JSONArray();

    @RequestMapping(value = "/drugs", method = RequestMethod.GET)
    public String drugData(ModelMap model) {
        return "drugs";
    }

    @RequestMapping(value = "/drugs", method = RequestMethod.POST)
    public String getDrugData(ModelMap model,
                             @RequestParam(value = "fromDate",defaultValue="") String fromDate,
                             @RequestParam(value = "toDate",defaultValue="") String toDate
    ) {
        String errorMessage="";
        originalFromDate = fromDate;
        originalToDate = toDate;
        if (fromDate.length() > 0 && toDate.length() > 0) {
            adverseEvent adverseevent = new adverseEvent();
            fromDate = FormatDate.formatDate(fromDate);
            toDate = FormatDate.formatDate(toDate);
            String jsonResult = "";
            JSONParser jsonParser = new JSONParser();
            try{
                jsonResult = adverseevent.getAdverseEventCountByDate(fromDate, toDate);
                Object object = jsonParser.parse(jsonResult);
                JSONObject jsonObject = (JSONObject) object;
                jsonObjectMeta = (JSONObject) jsonObject.get("meta");
                jsonArrayResult = (JSONArray) jsonObject.get("results");
                model.addAttribute("drugResultSet", jsonArrayResult.toString());
                model.addAttribute("hasResult", "yes");
            }catch(Exception e){
                System.out.println(e.toString());
                errorMessage = GetMessage.getMessage("drugs.nodata");
            }
        }
        model.addAttribute("fromDate",originalFromDate);
        model.addAttribute("toDate", originalToDate);
        model.addAttribute("errorMessage", errorMessage);
        return "drugs";
    }
    @RequestMapping(value = "/drugsSaveDrugData", method = RequestMethod.GET)
    public String saveDrugData(ModelMap model,
                               @RequestParam(value = "inputNote",defaultValue="") String inputNote
                               ) {
        DataSetListsEntity dataSetListsEntity = new DataSetListsEntity();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); //get logged in username
        UsersEntity users = usersService.getUsersEntityByUsername(username);
        dataSetListsEntity.setUserID(users.getId());
        dataSetListsEntity.setDataSetName("");
        dataSetListsEntity.setDataSetType("Drug");
        dataSetListsEntity.setMetadata(jsonObjectMeta.toString());
        dataSetListsEntity.setNotes(inputNote);
        dataSetListsService.addDataSetListsEntity(dataSetListsEntity);

        // save detail data set
        for (Object item : jsonArrayResult){
            JSONObject jsonObjectItem  = (JSONObject) item;
            DataSetsEntity dataSetsEntity = new DataSetsEntity();
            dataSetsEntity.setKey(jsonObjectItem.get("time").toString());
            dataSetsEntity.setValue(jsonObjectItem.get("count").toString());
            dataSetsEntity.setDataSetListID(dataSetListsEntity.getId());
            dataSetsService.addDataSetsEntity(dataSetsEntity);
        }
        model.addAttribute("drugResultSet", jsonArrayResult.toString());
        model.addAttribute("hasResult", "yes");
        model.addAttribute("fromDate",originalFromDate);
        model.addAttribute("toDate", originalToDate);
        model.addAttribute("errorMessage", GetMessage.getMessage("drugs.datasaved"));
        return "drugs";
    }

}
