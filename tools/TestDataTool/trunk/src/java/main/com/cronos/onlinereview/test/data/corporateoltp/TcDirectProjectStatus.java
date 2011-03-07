/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.corporateoltp;

/**
 * <p>An enumeration over the exiting statuses for TC Direct projects. Corresponds to 
 * <code>corporate_oltp.tc_direct_project_status_lu</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum TcDirectProjectStatus {
    
    ACTIVE(1, "Active"),
    
    INACTIVE(2, "Inactive");

    /**
     * <p>A <code>long</code> providing the ID of this client status.</p>
     */
    private long id;

    /**
     * <p>A <code>String</code> providing the name of this client status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>TcDirectProjectStatus</code> instance.</p>
     * 
     * @param id a <code>long</code> providing the ID of this project status.
     * @param name a <code>String</code> providing the name of this project status.
     */
    private TcDirectProjectStatus(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>Gets the name of this project status.</p>
     *
     * @return a <code>String</code> providing the name of this project status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this project status.</p>
     *
     * @return a <code>long</code> providing the ID of this project status.
     */
    public long getId() {
        return this.id;
    }
}
