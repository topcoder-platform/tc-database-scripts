/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the project statuses. Corresponds to <code>tcs_catalog.project_status_lu</code> database
 * table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum ProjectStatus {
    
    ACTIVE(1, "Active"),

    INACTIVE(2, "Inactive"),

    DELETED(3, "Deleted"),

    CANCELLED_FAILED_REVIEW(4, "Cancelled - Failed Review"),

    CANCELLED_FAILED_SCREENING(5, "Cancelled - Failed Screening"),

    CANCELLED_ZERO_SUBMISSIONS(6, "Cancelled - Zero Submissions"),

    COMPLETED(7, "Completed"),

    CANCELLED_WINNER_UNRESPONSIVE(8, "Cancelled - Winner Unresponsive"),

    CANCELLED_CLIENT_REQUEST(9, "Cancelled - Client Request"),

    CANCELLED_REQUIREMENTS_INFEASIBLE(10, "Cancelled - Requirements Infeasible"),

    CANCELLED_ZERO_REGISTRATIONS(11, "Cancelled - Zero Registrations");

    /**
     * <p>A <code>long</code> providing the ID of this project status.</p>
     */
    private long projectStatusId;

    /**
     * <p>A <code>String</code> providing the name of this project status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>ProjectStatus</code> instance with specified ID and name.</p>
     *
     * @param projectStatusId a <code>long</code> providing the ID of this project status.
     * @param name a <code>String</code> providing the name of this project status.
     */
    private ProjectStatus(long projectStatusId, String name) {
        this.projectStatusId = projectStatusId;
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
    public long getProjectStatusId() {
        return this.projectStatusId;
    }
    
}
