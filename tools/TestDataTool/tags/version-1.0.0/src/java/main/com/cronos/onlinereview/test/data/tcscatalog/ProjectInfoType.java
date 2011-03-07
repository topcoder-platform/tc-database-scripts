/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the project info types. Corresponds to <code>tcs_catalog.project_info_type_lu</code> database
 * table.</p>
 *
 * @author isv
 * @version 1.0
 */
public enum ProjectInfoType {

    EXTERNAL_REFERENCE_ID(1, "External Reference ID", true),

    COMPONENT_ID(2, "Component ID", true),

    VERSION_ID(3, "Version ID", true),

    DEVELOPER_FORUM_ID(4, "Developer Forum ID", false),

    ROOT_CATALOG_ID(5, "Root Catalog ID", true),

    PROJECT_NAME(6, "Project Name", true),

    PROJECT_VERSION(7, "Project version", true),

    SVN_MODULE(8, "SVN Module", true),

    AUTOPILOT_OPTION(9, "Autopilot Option", true),

    STATUS_NOTIFICATION(10, "Status Notification", true),

    TIMELINE_NOTIFICATION(11, "Timeline Notification", true),

    PUBLIC(12, "Public", true),

    RATED(13, "Rated", true),

    ELIGIBILITY(14, "Eligibility", true),

    PAYMENTS_REQUIRED(15, "Payments Required", false),

    PAYMENTS(16, "Payments", true),

    NOTES(17, "Notes", true),

    DEACTIVATED_TIMESTAMP(18, "Deactivated Timestamp", false),

    DEACTIVATED_PHASE(19, "Deactivated Phase", false),

    DEACTIVATED_REASON(20, "Deactivated Reason", false),

    COMPLETION_TIMESTAMP(21, "Completion Timestamp", false),

    RATED_TIMESTAMP(22, "Rated Timestamp", false),

    WINNER_EXTERNAL_REFERENCE_ID(23, "Winner External Reference ID", false),

    RUNNER_UP_EXTERNAL_REFERENCE_ID(24, "Runner-Up External Reference ID", false),

    EVENT_FLAG(25, "Event Flag", false),

    DIGITAL_RUN_FLAG(26, "Digital Run Flag", true),

    AUTOPILOT_AD_CHANGE(27, "AutoPilot AD Change", false),

    ALLOW_MULTIPLE_SUBMISSIONS(28, "Allow multiple submissions", false),

    CONTEST_INDICATOR(29, "Contest Indicator", false),

    DR_POINTS(30, "DR Points", true),

    ADMIN_FEE(31, "Admin Fee", true),

    BILLING_PROJECT(32, "Billing Project", true),

    REVIEW_COST(33, "Review Cost", true),

    CONFIDENTIALITY_TYPE(34, "Confidentiality Type", true),

    SPEC_REVIEW_COST(35, "Spec Review Cost", true),

    FIRST_PLACE_COST(36, "First Place Cost", true),

    SECOND_PLACE_COST(37, "Second Place Cost", true),

    RELIABILITY_BONUS_COST(38, "Reliability Bonus Cost", true),

    MILESTONE_BONUS_COST(39, "Milestone Bonus Cost", true),

    COST_LEVEL(40, "Cost Level", true),

    APPROVAL_REQUIRED(41, "Approval Required", true),

    REQUIRES_OTHER_FIXES(42, "Requires Other Fixes", false),

    SEND_WINNER_EMAILS(43, "Send Winner Emails", true),
    
    POST_MORTEM_REQUIRED(44, "Post-Mortem Required", true),
    
    RELIABILITY_BONUS_ELIGIBLE(45, "Reliability Bonus Eligible", true),
    
    MEMBER_PAYMENTS_ELIGIBLE(46, "Member Payments Eligible", true),
    
    PHASE_DEPENDENCIES_EDITABLE(47, "Phase Dependencies Editable", false),
    
    TRACK_LATE_DELIVERABLES(48, "Track Late Deliverables", true);

    /**
     * <p>A <code>ProjectInfoType</code> array listing the info types of boolean type which have their values set either
     * with "true" or " false" when creating project.</p>
     */
    public static final ProjectInfoType[] TRUE_FALSE_VALUES = {APPROVAL_REQUIRED, PHASE_DEPENDENCIES_EDITABLE, 
                                                               MEMBER_PAYMENTS_ELIGIBLE, RELIABILITY_BONUS_ELIGIBLE,
                                                               POST_MORTEM_REQUIRED, SEND_WINNER_EMAILS, 
                                                               REQUIRES_OTHER_FIXES}; 

    /**
     * <p>A <code>ProjectInfoType</code> array listing the info types of boolean type which have their values set either
     * with "On" or "Off" when creating project.</p>
     */
    public static final ProjectInfoType[] ON_OFF_VALUES = {DIGITAL_RUN_FLAG, AUTOPILOT_OPTION, STATUS_NOTIFICATION, 
                                                           TIMELINE_NOTIFICATION}; 

    /**
     * <p>A <code>ProjectInfoType</code> array listing the info types of boolean type which have their values set either
     * with "Yes" or "No" when creating project.</p>
     */
    public static final ProjectInfoType[] YES_NO_VALUES = {PUBLIC, RATED}; 

    /**
     * <p>A <code>String</code> providing the value for {@link #CONFIDENTIALITY_TYPE} project property in case the
     * project does not require CCA.</p>
     */
    public static final String CONFIDENTIALITY_NO_CCA = "public"; 

    /**
     * <p>A <code>String</code> providing the value for {@link #CONFIDENTIALITY_TYPE} project property in case the
     * project does require CCA.</p>
     */
    public static final String CONFIDENTIALITY_CCA_REQUIRED = "standard_cca"; 

    /**
     * <p>A <code>long</code> providing the ID of this project info type.</p>
     */
    private long projectInfoTypeId;

    /**
     * <p>A <code>String</code> providing the name of this project info type.</p>
     */
    private String name;

    /**
     * <p>A <code>boolean</code> providing the .</p>
     */
    private boolean requiredOnCreation;

    /**
     * <p>Constructs new <code>ProjectInfoType</code> instance with specified ID and name.</p>
     *
     * @param projectInfoTypeId a <code>long</code> providing the ID of this project info type.
     * @param name a <code>String</code> providing the name of this project info type.
     * @param requiredOnCreation <code>true</code> if this property is always required to be set when project is
     *        created; <code>false</code> otherwise.
     */
    private ProjectInfoType(long projectInfoTypeId, String name, boolean requiredOnCreation) {
        this.projectInfoTypeId = projectInfoTypeId;
        this.name = name;
        this.requiredOnCreation = requiredOnCreation;
    }

    /**
     * <p>Gets the name of this project info type.</p>
     *
     * @return a <code>String</code> providing the name of this project info type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this project info type.</p>
     *
     * @return a <code>long</code> providing the ID of this project info type.
     */
    public long getProjectInfoTypeId() {
        return this.projectInfoTypeId;
    }

    /**
     * <p>Gets the flag indicating whether this property is required to be set on project creation or not.</p>
     *
     * @return <code>true</code> if this property is always required to be set when project is created; 
     *         <code>false</code> otherwise
     */
    public boolean getRequiredOnCreation() {
        return this.requiredOnCreation;
    }

    /**
     * <p>Gets the textual presentation of this project info type.</p>
     * 
     * @return a <code>String</code> providing the textual presentation of <code>true</code> value of this project info
     *         type or <code>null</code> if this project info type is not of boolean type.
     */
    public String getTrueValue() {
        for (int i = 0; i < TRUE_FALSE_VALUES.length; i++) {
            if (this == TRUE_FALSE_VALUES[i]) {
                return "true";
            }
        }
        for (int i = 0; i < ON_OFF_VALUES.length; i++) {
            if (this == ON_OFF_VALUES[i]) {
                return "On";
            }
        }
        for (int i = 0; i < YES_NO_VALUES.length; i++) {
            if (this == YES_NO_VALUES[i]) {
                return "Yes";
            }
        }
        if (this == CONFIDENTIALITY_TYPE) {
            return CONFIDENTIALITY_CCA_REQUIRED;
        }
        if (this == ELIGIBILITY) {
            return "TopCoder Private";
        }
        return null;
    }

    /**
     * <p>Gets the textual presentation of this project info type.</p>
     * 
     * @return a <code>String</code> providing the textual presentation of <code>false</code> value of this project info
     *         type or <code>null</code> if this project info type is not of boolean type.
     */
    public String getFalseValue() {
        for (int i = 0; i < TRUE_FALSE_VALUES.length; i++) {
            if (this == TRUE_FALSE_VALUES[i]) {
                return "false";
            }
        }
        for (int i = 0; i < ON_OFF_VALUES.length; i++) {
            if (this == ON_OFF_VALUES[i]) {
                return "Off";
            }
        }
        for (int i = 0; i < YES_NO_VALUES.length; i++) {
            if (this == YES_NO_VALUES[i]) {
                return "No";
            }
        }
        if (this == CONFIDENTIALITY_TYPE) {
            return CONFIDENTIALITY_NO_CCA;
        }
        if (this == ELIGIBILITY) {
            return "Open";
        }
        return null;
    }
}
