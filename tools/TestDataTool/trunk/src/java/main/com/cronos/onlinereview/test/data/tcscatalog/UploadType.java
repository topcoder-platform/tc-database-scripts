/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing upload types. Corresponds to <code>tcs_catalog.upload_type_lu</code> database table.
 * </p>
 * 
 * @author isv
 * @version 1.0
 */
public enum UploadType {
    
    SUBMISSION(1, "Submission"),
        
    TEST_CASE(2, "Test Case"),
    
    FINAL_FIX(3, "Final Fix"),
    
    REVIEW_DOCUMENT(4, "Review Document");

    /**
     * <p>A <code>long</code> providing the ID of this upload type.</p>
     */
    private long uploadTypeId;

    /**
     * <p>A <code>String</code> providing the name of this upload type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>UploadType</code> instance with specified ID and name.</p>
     *
     * @param uploadTypeId a <code>long</code> providing the ID of this upload type.
     * @param name a <code>String</code> providing the name of this upload type.
     */
    private UploadType(long uploadTypeId, String name) {
        this.uploadTypeId = uploadTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this upload type.</p>
     *
     * @return a <code>String</code> providing the name of this upload type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this upload type.</p>
     *
     * @return a <code>long</code> providing the ID of this upload type.
     */
    public long getUploadTypeId() {
        return this.uploadTypeId;
    }
}
