/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the existing resource roles. Corresponds to <code>tcs_catalog.resource_role_lu</code> database
 * table.</p>
 *
 * @author isv
 * @version 1.0
 */
public enum ResourceRole {

    SUBMITTER(1, "Submitter", null),

    PRIMARY_SCREENER(2, "Primary Screener", PhaseType.SCREENING),

    SCREENER(3, "Screener", PhaseType.SCREENING),

    REVIEWER(4, "Reviewer", PhaseType.REVIEW),

    ACCURACY_REVIEWER(5, "Accuracy Reviewer", PhaseType.REVIEW),

    FAILURE_REVIEWER(6, "Failure Reviewer", PhaseType.REVIEW),

    STRESS_REVIEWER(7, "Stress Reviewer", PhaseType.REVIEW),

    AGGREGATOR(8, "Aggregator", PhaseType.AGGREGATION),

    FINAL_REVIEWER(9, "Final Reviewer", PhaseType.FINAL_REVIEW),

    APPROVER(10, "Approver", null),

    DESIGNER(11, "Designer", null),

    OBSERVER(12, "Observer", null),

    MANAGER(13, "Manager", null),

    COPILOT(14, "Copilot", null),

    CLIENT_MANAGER(15, "Client Manager", null),

    POST_MORTEM_REVIEWER(16, "Post-Mortem Reviewer", null),
    
    SPECIFICATION_SUBMITTER(17, "Specification Submitter", null),
    
    SPECIFICATION_REVIEWER(18, "Specification Reviewer", PhaseType.SPECIFICATION_REVIEW);

    /**
     * <p>A <code>long</code> providing the ID of this resource role.</p>
     */
    private long resourceRoleId;

    /**
     * <p>A <code>String</code> providing the name of this resource role.</p>
     */
    private String name;

    /**
     * <p>A <code>PhaseType</code> providing the type of the phase which resource of this role has to be associated
     * with.</p>
     */
    private PhaseType phaseType;

    /**
     * <p>Constructs new <code>ResourceRole</code> instance with specified ID and name.</p>
     *
     * @param resourceRoleId a <code>long</code> providing the ID of this resource role.
     * @param name a <code>String</code> providing the name of this resource role.
     * @param phaseType a <code>PhaseType</code> providing the type of the phase which resource of this role has to be
     *        associated with. 
     */
    private ResourceRole(long resourceRoleId, String name, PhaseType phaseType) {
        this.resourceRoleId = resourceRoleId;
        this.name = name;
        this.phaseType = phaseType;
    }

    /**
     * <p>Gets the name of this resource role.</p>
     *
     * @return a <code>String</code> providing the name of this resource role.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this resource role.</p>
     *
     * @return a <code>long</code> providing the ID of this resource role.
     */
    public long getResourceRoleId() {
        return this.resourceRoleId;
    }

    /**
     * <p>Gets the type of the phase which resource of this role has to be associated with.</p>
     *
     * @return a <code>PhaseType</code> providing the type of the phase which resource of this role has to be associated
     *         with.
     */
    public PhaseType getPhaseType() {
        return this.phaseType;
    }
}
