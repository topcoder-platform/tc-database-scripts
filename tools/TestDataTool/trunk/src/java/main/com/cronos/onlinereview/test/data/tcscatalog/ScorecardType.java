/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the scorecard types. Corresponds to <code>tcs_catalog.scorecard_type_Lu</code> database table.
 * </p>
 * 
 * @author isv
 * @version 1.0
 */
public enum ScorecardType {
    
    SCREENING(1, "Screening"),
    
    REVIEW(2, "Review"),
    
    APPROVAL(3, "Approval"),
    
    POST_MORTEM(4, "Post-Mortem"),
    
    SPECIFICATION_REVIEW(5, "Specification Review");

    /**
     * <p>A <code>long</code> providing the ID of this scorecard type.</p>
     */
    private long scorecardTypeId;

    /**
     * <p>A <code>String</code> providing the name of this scorecard type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>ScorecardType</code> instance with specified ID and name.</p>
     *
     * @param scorecardTypeId a <code>long</code> providing the ID of this scorecard type.
     * @param name a <code>String</code> providing the name of this scorecard type.
     */
    private ScorecardType(long scorecardTypeId, String name) {
        this.scorecardTypeId = scorecardTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this scorecard type.</p>
     *
     * @return a <code>String</code> providing the name of this scorecard type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this scorecard type.</p>
     *
     * @return a <code>long</code> providing the ID of this scorecard type.
     */
    public long getScorecardTypeId() {
        return this.scorecardTypeId;
    }
}
