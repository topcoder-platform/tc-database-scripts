/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration of the resource info types. Corresponds to <code>tcs_catalog.resource_info_type_lu</code> database
 * table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum ResourceInfoType {

    EXTERNAL_REFERENCE_ID(1, "External Reference ID"),

    HANDLE(2, "Handle"),

    EMAIL(3, "Email"),

    RATING(4, "Rating"),

    RELIABILITY(5, "Reliability"),

    REGISTRATION_DATE(6, "Registration Date"),

    PAYMENT(7, "Payment"),

    PAYMENT_STATUS(8, "Payment Status"),

    SCREENING_SCORE(9, "Screening Score"),

    INITIAL_SCORE(10, "Initial Score"),

    FINAL_SCORE(11, "Final Score"),

    PLACEMENT(12, "Placement"),

    APPEALS_COMPLETED_EARLY(13, "Appeals Completed Early"),
    
    SVN_PERMISSION_ADDED(14, "SVN Permission Added");

    /**
     * <p>A <code>long</code> providing the ID of this resource info type.</p>
     */
    private long resourceInfoTypeId;

    /**
     * <p>A <code>String</code> providing the name of this resource info type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>ResourceInfoType</code> instance with specified ID and name.</p>
     *
     * @param resourceInfoTypeId a <code>long</code> providing the ID of this resource info type.
     * @param name a <code>String</code> providing the name of this resource info type.
     */
    private ResourceInfoType(long resourceInfoTypeId, String name) {
        this.resourceInfoTypeId = resourceInfoTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this resource info type.</p>
     *
     * @return a <code>String</code> providing the name of this resource info type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this resource info type.</p>
     *
     * @return a <code>long</code> providing the ID of this resource info type.
     */
    public long getResourceInfoTypeId() {
        return this.resourceInfoTypeId;
    }
}
