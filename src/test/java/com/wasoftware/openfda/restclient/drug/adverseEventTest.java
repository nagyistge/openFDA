package com.wasoftware.openfda.restclient.drug;

import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 * adverseEvent Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Jun 22, 2015</pre>
 */

//@RunWith(SpringJUnit4ClassRunner.class)
public class adverseEventTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getAdverseEvent()
     */
    @Test
    public void testGetAdverseEvent() throws Exception {
        adverseEvent event = new adverseEvent();
        Assert.assertThat(event.getAdverseEvent(), CoreMatchers.containsString("meta"));
    }

    /**
     * Method: getAdverseEventSkipandLimit(int offset, int limit)
     */
    @Test
    public void testGetAdverseEventSkipandLimit() throws Exception {
        adverseEvent event = new adverseEvent();
        Assert.assertThat(event.getAdverseEventSkipandLimit(100, 50), CoreMatchers.containsString("100"));
    }

    /**
     * Method: getAdverseEventById(int safetyreportid)
     */
    @Test
    public void testGetAdverseEventById() throws Exception {
        adverseEvent event = new adverseEvent();
        //Assert.assertThat(event.getAdverseEventById("invalidID"), CoreMatchers.containsString("NOT_FOUND"));
        Assert.assertThat(event.getAdverseEventById("10003502"), CoreMatchers.containsString("10003502"));
    }

    /**
     * Method: getAdverseEventCountByDate(Date fromDate, Date toDate)
     */
    @Test
    public void testGetAdverseEventCountByDate() throws Exception {

        String fromDate = "20050101";
        String toDate = "20060101";

        adverseEvent event = new adverseEvent();
        Assert.assertThat(event.getAdverseEventCountByDate(fromDate, toDate), CoreMatchers.containsString("meta"));
    }

    /**
     * Method: composeDateRange(Date fromDate, Date toDate)
     */
    @Test
    public void testComposeDateRange() throws Exception {

        String fromDate = "20050101";
        String toDate = "20060101";

        adverseEvent event = new adverseEvent();
        Assert.assertThat(event.composeDateRange(fromDate, toDate), CoreMatchers.containsString("[20050101+TO+20060101]"));
    }


} 
