/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the screening statuses. Corresponds to <code>tcs_catalog.screening_status_lu</code> database
 * table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum ScreeningStatus {
    
    PENDING(1, "Pending"),
    
    SCREENING(2, "Screening"),
    
    FAILED(3, "Failed"),
    
    PASSED(4, "Passed"),
    
    PASSED_WITH_WARNING(5, "Passed with Warning");
    
    /**
     * <p>A <code>long</code> providing the ID of this screening status.</p>
     */
    private long screeningStatusId;

    /**
     * <p>A <code>String</code> providing the name of this screening status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>ScreeningStatus</code> instance with specified ID and name.</p>
     *
     * @param screeningStatusId a <code>long</code> providing the ID of this screening status.
     * @param name a <code>String</code> providing the name of this screening status.
     */
    private ScreeningStatus(long screeningStatusId, String name) {
        this.screeningStatusId = screeningStatusId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this screening status.</p>
     *
     * @return a <code>String</code> providing the name of this screening status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this screening status.</p>
     *
     * @return a <code>long</code> providing the ID of this screening status.
     */
    public long getScreeningStatusId() {
        return this.screeningStatusId;
    }
}
