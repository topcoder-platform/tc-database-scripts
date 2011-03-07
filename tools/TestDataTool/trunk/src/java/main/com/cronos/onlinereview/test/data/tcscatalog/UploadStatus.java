/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing upload statuses. Corresponds to <code>tcs_catalog.upload_status_lu</code> database 
 * table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum UploadStatus {
    
    ACTIVE(1, "Active"),
        
    DELETED(2, "Deleted");

    /**
     * <p>A <code>long</code> providing the ID of this upload status.</p>
     */
    private long uploadStatusId;

    /**
     * <p>A <code>String</code> providing the name of this upload status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>UploadStatus</code> instance with specified ID and name.</p>
     *
     * @param uploadStatusId a <code>long</code> providing the ID of this upload status.
     * @param name a <code>String</code> providing the name of this upload status.
     */
    private UploadStatus(long uploadStatusId, String name) {
        this.uploadStatusId = uploadStatusId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this upload status.</p>
     *
     * @return a <code>String</code> providing the name of this upload status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this upload status.</p>
     *
     * @return a <code>long</code> providing the ID of this upload status.
     */
    public long getUploadStatusId() {
        return this.uploadStatusId;
    }
}
