package com.wasoftware.openfda;

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
public class DrugControllerTests {
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

    /**
     * Method: fdaData(ModelMap model)
     */
    @Test
    public void testDrug() throws Exception {
        mockMvc.perform(get("/drugs"))
                .andExpect(status().isOk())
                .andExpect(view().name("drugs"));
    }

    /**
     * Method: getFdaData(ModelMap model, @RequestParam(value = "fromDate",defaultValue="") String fromDate, @RequestParam(value = "toDate",defaultValue="") String toDate)
     */
    @Test
    public void testGetFdaData() throws Exception {
        mockMvc.perform(post("/drugs").param("fromDate","05/01/2014")
                                      .param("toDate","06/30/2014") )
                .andExpect(status().isOk())
                .andExpect(view().name("drugs"));
    }
    @Test
    public void testDrugsSaveDrugData() throws Exception {
        mockMvc.perform(get("/drugsSaveDrugData").param("inputNote","test"))
                .andExpect(status().isOk())
                .andExpect(view().name("drugs"));
    }

} 
