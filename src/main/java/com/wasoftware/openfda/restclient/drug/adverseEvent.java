package com.wasoftware.openfda.restclient.drug;

import org.json.simple.JSONObject;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * Created by wlo on 6/22/2015.
 *
 */
public class adverseEvent {

    static private String base_uri = "https://api.fda.gov/drug/event.json";

    public adverseEvent() {
    }

    public String getAdverseEvent()
    {
        final String uri = base_uri;
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(uri, String.class);
    }


    public String getAdverseEventSkipandLimit(int offset, int limit)
    {
        final UriComponents uriComponents = UriComponentsBuilder.fromUriString("{base_ri}?skip={offset}&limit={limit}").build().expand(base_uri,offset,limit);
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(uriComponents.toUri(), String.class);
    }

    public String getAdverseEventById(String safetyreportid)
    {
        final UriComponents uriComponents = UriComponentsBuilder.fromUriString("{base_ri}?search=safetyreportid:{safetyreportid}").build().expand(base_uri,safetyreportid);
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(uriComponents.toUri(), String.class);
    }

    public String getAdverseEventCountByDate(String fromDate, String toDate)
    {
        final UriComponents uriComponents = UriComponentsBuilder.fromUriString("{base_ri}?search=receivedate:{DateRange}&count=receivedate").build().expand(base_uri,composeDateRange(fromDate,toDate));
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(uriComponents.toUri(), String.class);
    }

    public String composeDateRange(String fromDate, String toDate)
    {
        return "[" + fromDate + "+TO+" + toDate + "]";
    }






}
