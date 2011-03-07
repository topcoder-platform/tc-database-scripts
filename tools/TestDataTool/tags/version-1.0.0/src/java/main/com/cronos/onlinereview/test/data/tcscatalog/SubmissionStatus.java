/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing submission statuses. Corresponds to <code>tcs_catalog.submission_status_lu</code> 
 * database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum SubmissionStatus {
    
    ACTIVE(1, "Active"),
    
    FAILED_SCREENING(2, "Failed Screening"),
    
    FAILED_REVIEW(3, "Failed Review"),
    
    COMPLETED_WITHOUT_WIN(4, "Completed Without Win"),
        
    DELETED(5, "Deleted");

    /**
     * <p>A <code>long</code> providing the ID of this submission status.</p>
     */
    private long submissionStatusId;

    /**
     * <p>A <code>String</code> providing the name of this submission status.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>SubmissionStatus</code> instance with specified ID and name.</p>
     *
     * @param submissionStatusId a <code>long</code> providing the ID of this submission status.
     * @param name a <code>String</code> providing the name of this submission status.
     */
    private SubmissionStatus(long submissionStatusId, String name) {
        this.submissionStatusId = submissionStatusId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this submission status.</p>
     *
     * @return a <code>String</code> providing the name of this submission status.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this submission status.</p>
     *
     * @return a <code>long</code> providing the ID of this submission status.
     */
    public long getSubmissionStatusId() {
        return this.submissionStatusId;
    }
}
