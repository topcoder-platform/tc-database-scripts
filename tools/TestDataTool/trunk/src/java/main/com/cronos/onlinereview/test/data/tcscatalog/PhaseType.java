/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration of the project phase types. Corresponds to <code>tcs_catalog.phase_type_lu</code> database table.
 * </p>
 * 
 * @author isv
 * @version 1.0
 */
public enum PhaseType {

    SPECIFICATION_SUBMISSION(13, "Specification Submission", null),
    
    SPECIFICATION_REVIEW(14, "Specification Review", SPECIFICATION_SUBMISSION),
    
    REGISTRATION(1, "Registration", SPECIFICATION_REVIEW),

    SUBMISSION(2, "Submission", REGISTRATION),

    SCREENING(3, "Screening", SUBMISSION),

    REVIEW(4, "Review", SCREENING),

    APPEALS(5, "Appeals", REVIEW),

    APPEALS_RESPONSE(6, "Appeals Response", APPEALS),

    AGGREGATION(7, "Aggregation", APPEALS_RESPONSE),
    
    AGGREGATION_REVIEW(8, "Aggregation Review", AGGREGATION),

    FINAL_FIX(9, "Final Fix", AGGREGATION_REVIEW),

    FINAL_REVIEW(10, "Final Review", FINAL_FIX),

    APPROVAL(11, "Approval", FINAL_REVIEW),

    POST_MORTEM(12, "Post-Mortem", null);

    /**
     * <p>A <code>long</code> providing the ID of this project phase type.</p>
     */
    private long phaseTypeId;

    /**
     * <p>A <code>String</code> providing the name of this project phase type.</p>
     */
    private String name;

    /**
     * <p>A <code>PhaseType</code> providing the type of the phase which this phase type depends on.</p>
     */
    private PhaseType mainPhaseType;

    /**
     * <p>A <code>boolean</code> flag indicating whether the phase of this type start when dependency phase starts (if 
     * <code>true</code>) or ends (if <code>false</code>).</p>
     */
    private boolean startsWhenDependencyStarts = false;

    /**
     * <p>Constructs new <code>PhaseType</code> instance with specified ID and name.</p>
     *
     * @param phaseTypeId a <code>long</code> providing the ID of this project phase type.
     * @param name a <code>String</code> providing the name of this project info type.
     * @param mainPhaseType a <code>PhaseType</code> referencing the main phase type which this type depends on.
     */
    private PhaseType(long phaseTypeId, String name, PhaseType mainPhaseType) {
        this.phaseTypeId = phaseTypeId;
        this.name = name;
        this.mainPhaseType = mainPhaseType;
        if (phaseTypeId == 2) {
            this.startsWhenDependencyStarts = true;
        }
    }

    /**
     * <p>Gets the type of the phase which this phase type depends on.</p>
     *
     * @return a <code>PhaseType</code> providing the type of the phase which this phase type depends on.
     */
    public PhaseType getMainPhaseType() {
        return this.mainPhaseType;
    }

    /**
     * <p>Gets the name of this project phase type.</p>
     *
     * @return a <code>String</code> providing the name of this project phase type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this project phase type.</p>
     *
     * @return a <code>long</code> providing the ID of this project phase type.
     */
    public long getPhaseTypeId() {
        return this.phaseTypeId;
    }

    /**
     * <p>Gets the flag indicating on phase starts.</p>
     * 
     * @return a <code>boolean</code> flag indicating whether the phase of this type start when dependency phase starts
     *         (if <code>true</code>) or ends (if <code>false</code>).
     */
    public boolean getStartsWhenDependencyStarts() {
        return this.startsWhenDependencyStarts;
    }

    /**
     * <p>Gets the ordinal value for this enumeration item.</p>
     * 
     * @return an <code>int</code> providing the ordinal value.
     */
    public int getOrdinal() {
        PhaseType[] phaseTypes = values();
        for (int i = 0; i < phaseTypes.length; i++) {
            PhaseType phaseType = phaseTypes[i];
            if (phaseType == this) {
                return i;
            }
        }
        return 0;
    }
}
