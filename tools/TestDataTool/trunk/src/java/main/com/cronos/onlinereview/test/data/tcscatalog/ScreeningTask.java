/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for a single screening task which may be associated with a single submission. Corresponds to 
 * <code>tcs_catalog.screening_task</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ScreeningTask implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this screening task.</p>
     */
    private long screeningTaskId;

    /**
     * <p>A <code>Long</code> providing the ID of associated upload.</p>
     */
    private long uploadId;

    /**
     * <p>A <code>ScreeningStatus</code> providing the status of this screening task.</p>
     */
    private ScreeningStatus status;

    /**
     * <p>A <code>Long</code> providing the ID of a screener associated with this task.</p>
     */
    private Long screenerId;

    /**
     * <p>A <code>Date</code> providing the start timestamp for this task.</p>
     */
    private Date startTimestamp;

    /**
     * <p>Constructs new <code>ScreeningTask</code> instance. This implementation does nothing.</p>
     */
    public ScreeningTask() {
    }

    /**
     * <p>Gets the start timestamp for this task.</p>
     *
     * @return a <code>Date</code> providing the start timestamp for this task.
     */
    public Date getStartTimestamp() {
        return this.startTimestamp;
    }

    /**
     * <p>Sets the start timestamp for this task.</p>
     *
     * @param startTimestamp a <code>Date</code> providing the start timestamp for this task.
     */
    public void setStartTimestamp(Date startTimestamp) {
        this.startTimestamp = startTimestamp;
    }

    /**
     * <p>Gets the ID of a screener associated with this task.</p>
     *
     * @return a <code>Long</code> providing the ID of a screener associated with this task.
     */
    public Long getScreenerId() {
        return this.screenerId;
    }

    /**
     * <p>Sets the ID of a screener associated with this task.</p>
     *
     * @param screenerId a <code>Long</code> providing the ID of a screener associated with this task.
     */
    public void setScreenerId(Long screenerId) {
        this.screenerId = screenerId;
    }

    /**
     * <p>Gets the status of this screening task.</p>
     *
     * @return a <code>ScreeningStatus</code> providing the status of this screening task.
     */
    public ScreeningStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of this screening task.</p>
     *
     * @param status a <code>ScreeningStatus</code> providing the status of this screening task.
     */
    public void setStatus(ScreeningStatus status) {
        this.status = status;
    }

    /**
     * <p>Gets the ID of associated upload.</p>
     *
     * @return a <code>Long</code> providing the ID of associated upload.
     */
    public long getUploadId() {
        return this.uploadId;
    }

    /**
     * <p>Sets the ID of associated upload.</p>
     *
     * @param uploadId a <code>Long</code> providing the ID of associated upload.
     */
    public void setUploadId(long uploadId) {
        this.uploadId = uploadId;
    }

    /**
     * <p>Gets the ID of this screening task.</p>
     *
     * @return a <code>long</code> providing the ID of this screening task.
     */
    public long getScreeningTaskId() {
        return this.screeningTaskId;
    }

    /**
     * <p>Sets the ID of this screening task.</p>
     *
     * @param screeningTaskId a <code>long</code> providing the ID of this screening task.
     */
    public void setScreeningTaskId(long screeningTaskId) {
        this.screeningTaskId = screeningTaskId;
    }
}
