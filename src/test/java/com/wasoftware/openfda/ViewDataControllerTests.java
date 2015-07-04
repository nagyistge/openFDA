package com.wasoftware.openfda;

/**
 * Created by yipty on 6/28/2015.
 */


//import com.wasoftware.openfda.model.DataSetListsEntity;
import com.wasoftware.openfda.service.DataSetListsService;
//import junit.framework.Assert;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.*;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.http.HttpSession;

import static org.junit.Assert.assertEquals;
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
    private static String SEC_CONTEXT_ATTR = HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;


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

    @Test
    public void testDataSetListsDelete() throws Exception {
        String maxDataSetListID = String.valueOf(dataSetListsService.getDataSetListsEntityMaxId());

        String routeParam = "/deleteDataSets/" + maxDataSetListID;
        mockMvc.perform(get(routeParam))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSetLists"));
    }


}

