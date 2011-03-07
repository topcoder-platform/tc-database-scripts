/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for single submission to be generated. Corresponds to <code>tcs_catalog.submission</code> database table.
 * </p>
 * 
 * @author isv
 * @version 1.0
 */
public class Submission implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this submission.</p>
     */
    private long submissionId;

    /**
     * <p>A <code>Upload</code> providing the upload associated with this submission.</p>
     */
    private Upload upload;

    /**
     * <p>A <code>SubmissionStatus</code> providing the status of this submission.</p>
     */
    private SubmissionStatus status;

    /**
     * <p>A <code>SubmissionType</code> providing the type of this submission.</p>
     */
    private SubmissionType type;

    /**
     * <p>A <code>Double</code> providing the screening score for this submission.</p>
     */
    private Double screeningScore;

    /**
     * <p>A <code>Double</code> providing the initial score for this submission.</p>
     */
    private Double initialScore;

    /**
     * <p>A <code>Double</code> providing the final score for this submission.</p>
     */
    private Double finalScore;

    /**
     * <p>A <code>Integer</code> providing the placement for this submission.</p>
     */
    private Integer placement;

    /**
     * <p>A <code>ScreeningTask</code> providing the screening task associated with this submission.</p>
     */
    private ScreeningTask screeningTask;

    /**
     * <p>Constructs new <code>Submission</code> instance. This implementation does nothing.</p>
     */
    public Submission() {
    }

    /**
     * <p>Gets the placement for this submission.</p>
     *
     * @return a <code>Integer</code> providing the placement for this submission.
     */
    public Integer getPlacement() {
        return this.placement;
    }

    /**
     * <p>Sets the placement for this submission.</p>
     *
     * @param placement a <code>Integer</code> providing the placement for this submission.
     */
    public void setPlacement(Integer placement) {
        this.placement = placement;
    }

    /**
     * <p>Gets the final score for this submission.</p>
     *
     * @return a <code>Double</code> providing the final score for this submission.
     */
    public Double getFinalScore() {
        return this.finalScore;
    }

    /**
     * <p>Sets the final score for this submission.</p>
     *
     * @param finalScore a <code>Double</code> providing the final score for this submission.
     */
    public void setFinalScore(Double finalScore) {
        this.finalScore = finalScore;
    }

    /**
     * <p>Gets the initial score for this submission.</p>
     *
     * @return a <code>Double</code> providing the initial score for this submission.
     */
    public Double getInitialScore() {
        return this.initialScore;
    }

    /**
     * <p>Sets the initial score for this submission.</p>
     *
     * @param initialScore a <code>Double</code> providing the initial score for this submission.
     */
    public void setInitialScore(Double initialScore) {
        this.initialScore = initialScore;
    }

    /**
     * <p>Gets the screening score for this submission.</p>
     *
     * @return a <code>Double</code> providing the screening score for this submission.
     */
    public Double getScreeningScore() {
        return this.screeningScore;
    }

    /**
     * <p>Sets the screening score for this submission.</p>
     *
     * @param screeningScore a <code>Double</code> providing the screening score for this submission.
     */
    public void setScreeningScore(Double screeningScore) {
        this.screeningScore = screeningScore;
    }

    /**
     * <p>Gets the type of this submission.</p>
     *
     * @return a <code>SubmissionType</code> providing the type of this submission.
     */
    public SubmissionType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of this submission.</p>
     *
     * @param type a <code>SubmissionType</code> providing the type of this submission.
     */
    public void setType(SubmissionType type) {
        this.type = type;
    }

    /**
     * <p>Gets the status of this submission.</p>
     *
     * @return a <code>SubmissionStatus</code> providing the status of this submission.
     */
    public SubmissionStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of this submission.</p>
     *
     * @param status a <code>SubmissionStatus</code> providing the status of this submission.
     */
    public void setStatus(SubmissionStatus status) {
        this.status = status;
    }

    /**
     * <p>Gets the upload associated with this submission.</p>
     *
     * @return a <code>Upload</code> providing the upload associated with this submission.
     */
    public Upload getUpload() {
        return this.upload;
    }

    /**
     * <p>Sets the upload associated with this submission.</p>
     *
     * @param upload a <code>Upload</code> providing the upload associated with this submission.
     */
    public void setUpload(Upload upload) {
        this.upload = upload;
    }

    /**
     * <p>Gets the ID of this submission.</p>
     *
     * @return a <code>long</code> providing the ID of this submission.
     */
    public long getSubmissionId() {
        return this.submissionId;
    }

    /**
     * <p>Sets the ID of this submission.</p>
     *
     * @param submissionId a <code>long</code> providing the ID of this submission.
     */
    public void setSubmissionId(long submissionId) {
        this.submissionId = submissionId;
    }

    /**
     * <p>Gets the screening task associated with this submission.</p>
     *
     * @return a <code>ScreeningTask</code> providing the screening task associated with this submission.
     */
    public ScreeningTask getScreeningTask() {
        return this.screeningTask;
    }

    /**
     * <p>Sets the screening task associated with this submission.</p>
     *
     * @param screeningTask a <code>ScreeningTask</code> providing the screening task associated with this submission.
     */
    public void setScreeningTask(ScreeningTask screeningTask) {
        this.screeningTask = screeningTask;
    }
}
