/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

/**
 * <p>An enumeration over the existing billing project statuses. Corresponds to <code>time_oltp.project_status</code>
 * database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum BillingProjectStatus {
    
    ACTIVE(1, "Active");

    /**
     * <p>A <code>long</code> providing the ID of this billing project status.</p>
     */
    private long id;

    /**
     * <p>A <code>String</code> providing the name of this billing project status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>BillingProjectStatus</code> instance.</p>
     * 
     * @param id a <code>long</code> providing the ID of this billing project status.
     * @param name a <code>String</code> providing the name of this billing project status.
     */
    private BillingProjectStatus(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>Gets the name of this billing project status.</p>
     *
     * @return a <code>String</code> providing the name of this billing project status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this billing project status.</p>
     *
     * @return a <code>long</code> providing the ID of this billing project status.
     */
    public long getId() {
        return this.id;
    }
}
