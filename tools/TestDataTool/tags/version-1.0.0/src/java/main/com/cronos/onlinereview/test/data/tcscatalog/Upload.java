/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for single upload to be generated. Corresponds to <code>tcs_catalog.upload</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class Upload implements Serializable {

    /**
     * <p>A <code>long</code> providing the Id of this upload.</p>
     */
    private long uploadId;

    /**
     * <p>A <code>long</code> providing the ID of a project associated with upload.</p>
     */
    private long projectId;

    /**
     * <p>A <code>long</code> providing the ID of a resource associated with upload.</p>
     */
    private long resourceId;

    /**
     * <p>A <code>UploadStatus</code> providing the status of this upload.</p>
     */
    private UploadStatus status;

    /**
     * <p>A <code>UploadType</code> providing the type of this upload.</p>
     */
    private UploadType type;

    /**
     * <p>A <code>String</code> providing the parameter of this upload.</p>
     */
    private String parameter;

    /**
     * <p>A <code>Date</code> providing the timestamp for creation of this upload.</p>
     */
    private Date creationTimestamp;

    /**
     * <p>Constructs new <code>Upload</code> instance. This implementation does nothing.</p>
     */
    public Upload() {
    }

    /**
     * <p>Gets the Id of this upload.</p>
     *
     * @return a <code>long</code> providing the Id of this upload.
     */
    public long getUploadId() {
        return this.uploadId;
    }

    /**
     * <p>Sets the Id of this upload.</p>
     *
     * @param uploadId a <code>long</code> providing the Id of this upload.
     */
    public void setUploadId(long uploadId) {
        this.uploadId = uploadId;
    }

    /**
     * <p>Gets the parameter of this upload.</p>
     *
     * @return a <code>String</code> providing the parameter of this upload.
     */
    public String getParameter() {
        return this.parameter;
    }

    /**
     * <p>Sets the parameter of this upload.</p>
     *
     * @param parameter a <code>String</code> providing the parameter of this upload.
     */
    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    /**
     * <p>Gets the type of this upload.</p>
     *
     * @return a <code>UploadType</code> providing the type of this upload.
     */
    public UploadType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of this upload.</p>
     *
     * @param type a <code>UploadType</code> providing the type of this upload.
     */
    public void setType(UploadType type) {
        this.type = type;
    }

    /**
     * <p>Gets the status of this upload.</p>
     *
     * @return a <code>UploadStatus</code> providing the status of this upload.
     */
    public UploadStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of this upload.</p>
     *
     * @param status a <code>UploadStatus</code> providing the status of this upload.
     */
    public void setStatus(UploadStatus status) {
        this.status = status;
    }

    /**
     * <p>Gets the ID of a resource associated with upload.</p>
     *
     * @return a <code>long</code> providing the ID of a resource associated with upload.
     */
    public long getResourceId() {
        return this.resourceId;
    }

    /**
     * <p>Sets the ID of a resource associated with upload.</p>
     *
     * @param resourceId a <code>long</code> providing the ID of a resource associated with upload.
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * <p>Gets the ID of a project associated with upload.</p>
     *
     * @return a <code>long</code> providing the ID of a project associated with upload.
     */
    public long getProjectId() {
        return this.projectId;
    }

    /**
     * <p>Sets the ID of a project associated with upload.</p>
     *
     * @param projectId a <code>long</code> providing the ID of a project associated with upload.
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>Gets the timestamp for creation of this upload.</p>
     *
     * @return a <code>Date</code> providing the timestamp for creation of this upload.
     */
    public Date getCreationTimestamp() {
        return this.creationTimestamp;
    }

    /**
     * <p>Sets the timestamp for creation of this upload.</p>
     *
     * @param creationTimestamp a <code>Date</code> providing the timestamp for creation of this upload.
     */
    public void setCreationTimestamp(Date creationTimestamp) {
        this.creationTimestamp = creationTimestamp;
    }
}
