package com.wasoftware.openfda;

/**
 * Created by yipty on 6/28/2015.
 */


import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.Assert.assertEquals;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
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
    public void testDataSets() throws Exception {
        mockMvc.perform(get("/dataSets"))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
    }


    @Test
    public void testDataSetNewGet() throws Exception {
        mockMvc.perform(get("/dataSetNewGets"))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
    }

    @Test
    public void testDataSetOverwrite() throws Exception {
        mockMvc.perform(get("/dataSetOverwrites"))
                .andExpect(status().isOk())
                .andExpect(view().name("dataSets"));
    }

}

