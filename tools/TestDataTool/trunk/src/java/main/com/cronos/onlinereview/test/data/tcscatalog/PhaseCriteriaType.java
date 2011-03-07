/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration of the project phase criteria types. Corresponds to <code>tcs_catalog.phase_criteria_type_lu</code>
 * database table.</p>
 *
 * @author isv
 * @version 1.0
 */
public enum PhaseCriteriaType {

    SCORECARD_ID(1, "Scorecard ID"),

    REGISTRATION_NUMBER(2, "Registration Number"),

    SUBMISSION_NUMBER(3, "Submission Number"),

    VIEW_RESPONSE_DURING_APPEALS(4, "View Response During Appeals"),

    MANUAL_SCREENING(5, "Manual Screening"),

    REVIEWER_NUMBER(6, "Reviewer Number");

    /**
     * <p>A <code>long</code> providing the ID of this project phase criteria type.</p>
     */
    private long phaseCriteriaTypeId;

    /**
     * <p>A <code>String</code> providing the name of this project phase criteria type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>PhaseCriteriaType</code> instance with specified ID and name.</p>
     *
     * @param phaseCriteriaTypeId a <code>long</code> providing the ID of this project phase criteria type.
     * @param name a <code>String</code> providing the name of this project info type.
     */
    private PhaseCriteriaType(long phaseCriteriaTypeId, String name) {
        this.phaseCriteriaTypeId = phaseCriteriaTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this project phase criteria type.</p>
     *
     * @return a <code>String</code> providing the name of this project phase criteria type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this project phase criteria type.</p>
     *
     * @return a <code>long</code> providing the ID of this project phase criteria type.
     */
    public long getPhaseCriteriaTypeId() {
        return this.phaseCriteriaTypeId;
    }
}
