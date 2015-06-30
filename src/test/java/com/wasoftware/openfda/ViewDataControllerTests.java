package com.wasoftware.openfda;

/**
 * Created by yipty on 6/28/2015.
 */


import com.wasoftware.openfda.model.DataSetListsEntity;
import com.wasoftware.openfda.service.DataSetListsService;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.http.HttpSession;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

/**
 * FdaDataController Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Jun 24, 2015</pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")
public class ViewDataControllerTests {
    private MockMvc mockMvc;
    private DataSetListsService dataSetListsService;

    @Autowired(required = true)
    @Qualifier(value = "dataSetListsService")
    public void setDataSetListsService(DataSetListsService dataSetListsService) {
        this.dataSetListsService = dataSetListsService;
    }

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    protected WebApplicationContext wac;

    @Before
    public void before() throws Exception {
        this.mockMvc = webAppContextSetup(this.wac).build();
    }

    @After
    public void after() throws Exception {
    }


    @Test
    public void testDataSetLists() throws Exception {
        mockMvc.perform(get("/dataSetLists"))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSetLists"));
    }
    @Test
    public void testDataSetsViewReloadOverwrite() throws Exception {
        mockMvc.perform(get("/viewDataSets/18"))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
    }


    @Test
    public void testDataSetReload() throws Exception {
        mockMvc.perform(get("/viewDataSets/18"))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
        mockMvc.perform(post("/viewDataSets").param("reloadData","")
                                             .param("fromDate","05/01/2014")
                                             .param("toDate","06/01/2014")
                                             )
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
    }

    @Test
    public void testDataSetOverwrite() throws Exception {
        mockMvc.perform(get("/viewDataSets/18"))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
        mockMvc.perform(post("/viewDataSets").param("reloadData","")
                        .param("fromDate","05/01/2014")
                        .param("toDate","06/01/2014")
        )
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
        mockMvc.perform(post("/viewDataSets").param("overwriteData",""))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
    }

   /* @Test
    public void testDataSetListsDelete() throws Exception {
        //RequestBuilder requestBuilder = formLogin().user("username").password("passowrd");
        HttpSession session = mockMvc.perform(post("/j_security_check")
                .param("j_username", "user1").param("j_password", "123456"))
                .andExpect(status().is(HttpStatus.FOUND.value()))
                .andExpect(redirectedUrl("/welcome"))
                .andReturn()
                .getRequest()
                .getSession();
        mockMvc.perform(post("/j_spring_security_check")
                        .param("j_username", "user1")
                        .param("j_password", "123456"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(cookie().exists("JSESSIONID"));
        *//*mockMvc.perform(post("/drugs").param("fromDate","05/01/2014")
                                      .param("toDate", "06/30/2014") )
                .andExpect(status().isOk())
                .andExpect(view().name("drugs"));
        mockMvc.perform(get("/drugsSaveDrugData").param("inputNote","test"))
                .andExpect(status().isOk())
                .andExpect(view().name("drugs"));*//*
        *//*String maxDataSetListID = String.valueOf(dataSetListsService.getDataSetListsEntityMaxId());
        System.out.println("-----------------"+maxDataSetListID);
        String routeParam = "/deleteDataSets/" + maxDataSetListID;
        mockMvc.perform(get(routeParam))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSetLists"));*//*
    }*/
}

