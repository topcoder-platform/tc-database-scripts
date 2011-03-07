/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration of the project phase statuses. Corresponds to <code>tcs_catalog.phase_status_lu</code> database
 * table.</p>
 *
 * @author isv
 * @version 1.0
 */
public enum PhaseStatus {

    SCHEDULED(1, "Scheduled"),
    
    OPEN(2, "Open"),

    CLOSED(3, "Closed");

    /**
     * <p>A <code>long</code> providing the ID of this project phase status.</p>
     */
    private long phaseStatusId;

    /**
     * <p>A <code>String</code> providing the name of this project phase status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>PhaseStatus</code> instance with specified ID and name.</p>
     *
     * @param phaseStatusId a <code>long</code> providing the ID of this project phase status.
     * @param name a <code>String</code> providing the name of this project info type.
     */
    private PhaseStatus(long phaseStatusId, String name) {
        this.phaseStatusId = phaseStatusId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this project phase status.</p>
     *
     * @return a <code>String</code> providing the name of this project phase status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this project phase status.</p>
     *
     * @return a <code>long</code> providing the ID of this project phase status.
     */
    public long getPhaseStatusId() {
        return this.phaseStatusId;
    }
}
