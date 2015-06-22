package com.wasoftware.openfda.restclient.drug;

import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * adverseEvent Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>Jun 22, 2015</pre>
 */
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

        SimpleDateFormat dateformat1 = new SimpleDateFormat("dd/MM/yyyy");
        Date fromDate = dateformat1.parse("01/01/2005");
        Date toDate = dateformat1.parse("01/01/2006");

        adverseEvent event = new adverseEvent();
        Assert.assertThat(event.getAdverseEventCountByDate(fromDate, toDate), CoreMatchers.containsString("meta"));
    }

    /**
     * Method: composeDateRange(Date fromDate, Date toDate)
     */
    @Test
    public void testComposeDateRange() throws Exception {

        SimpleDateFormat dateformat = new SimpleDateFormat("MM/dd/yyyy");
        Date fromDate = dateformat.parse("01/01/2005");
        Date toDate = dateformat.parse("12/31/2010");

        adverseEvent event = new adverseEvent();
        Assert.assertThat(event.composeDateRange(fromDate, toDate), CoreMatchers.containsString("[20050101+TO+20101231]"));
    }


} 
