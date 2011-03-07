/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>A DTO for a single phase which may be associated with the project. Corresponds to <code>tcs_catalog.project_phase
 * </code> database table.</p>
 *
 * @author isv
 * @version 1.0
 */
public class Phase implements Serializable {

    /**
     * <p>A <code>PhaseStatus</code> providing the status of this phase.</p>
     */
    private PhaseStatus phaseStatus;

    /**
     * <p>A <code>PhaseType</code> providing the type of this phase.</p>
     */
    private PhaseType phaseType;

    /**
     * <p>A <code>long</code> providing the ID for this phase.</p>
     */
    private long phaseId;

    /**
     * <p>A <code>Long</code> providing the offset (in minutes) for fixed start time for this phase.</p>
     */
    private Long fixedStartTimeOffset;

    /**
     * <p>A <code>Long</code> providing the offset (in minutes) for scheduled start time for this phase.</p>
     */
    private Long scheduledStartTimeOffset;

    /**
     * <p>A <code>Long</code> providing the offset (in minutes) for scheduled end time for this phase.</p>
     */
    private Long scheduledEndTimeOffset;

    /**
     * <p>A <code>Long</code> providing the offset (in minutes) for actual start time for this phase.</p>
     */
    private Long actualStartTimeOffset;

    /**
     * <p>A <code>Long</code> providing the offset (in minutes) for actual end time for this phase.</p>
     */
    private Long actualEndTimeOffset;

    /**
     * <p>A <code>long</code> providing the duration (in milliseconds) for this phase.</p>
     */
    private long duration;

    /**
     * <p>A <code>Map</code> providing the criteria for phase.</p>
     */
    private Map<PhaseCriteriaType, String> criteria = new HashMap<PhaseCriteriaType, String>();

    /**
     * <p>A <code>Scorecard</code> providing the review scorecard which is used by the phase.</p>
     */
    private Scorecard reviewScorecard;

    /**
     * <p>Constructs new <code>Phase</code> instance. This implementation does nothing.</p>
     */
    public Phase() {
    }

    /**
     * <p>Gets the criteria for phase.</p>
     *
     * @return a <code>Map</code> providing the criteria for phase.
     */
    public Map getCriteria() {
        return this.criteria;
    }

    /**
     * <p>Adds specified phase criteria</p>
     *
     * @param criteriaType a <code>PhaseCriteriaType</code> providing the criteria type for the phase.
     * @param value a <code>String</code> providing the value for phase criteria.
     */
    public void addCriteria(PhaseCriteriaType criteriaType, String value) {
        this.criteria.put(criteriaType, value);
    }

    /**
     * <p>Gets the duration (in milliseconds) for this phase.</p>
     *
     * @return a <code>long</code> providing the duration (in milliseconds) for this phase.
     */
    public long getDuration() {
        return this.duration;
    }

    /**
     * <p>Sets the duration (in milliseconds) for this phase.</p>
     *
     * @param duration a <code>long</code> providing the duration (in milliseconds) for this phase.
     */
    public void setDuration(long duration) {
        this.duration = duration;
    }

    /**
     * <p>Gets the offset (in minutes) for actual end time for this phase.</p>
     *
     * @return a <code>Long</code> providing the offset (in minutes) for actual end time for this phase.
     */
    public Long getActualEndTimeOffset() {
        return this.actualEndTimeOffset;
    }

    /**
     * <p>Sets the offset (in minutes) for actual end time for this phase.</p>
     *
     * @param actualEndTimeOffset a <code>Long</code> providing the offset (in minutes) for actual end time for this
     * phase.
     */
    public void setActualEndTimeOffset(Long actualEndTimeOffset) {
        this.actualEndTimeOffset = actualEndTimeOffset;
    }

    /**
     * <p>Gets the offset (in minutes) for actual start time for this phase.</p>
     *
     * @return a <code>Long</code> providing the offset (in minutes) for actual start time for this phase.
     */
    public Long getActualStartTimeOffset() {
        return this.actualStartTimeOffset;
    }

    /**
     * <p>Sets the offset (in minutes) for actual start time for this phase.</p>
     *
     * @param actualStartTimeOffset a <code>Long</code> providing the offset (in minutes) for actual start time for this
     * phase.
     */
    public void setActualStartTimeOffset(Long actualStartTimeOffset) {
        this.actualStartTimeOffset = actualStartTimeOffset;
    }

    /**
     * <p>Gets the offset (in minutes) for scheduled end time for this phase.</p>
     *
     * @return a <code>Long</code> providing the offset (in minutes) for scheduled end time for this phase.
     */
    public Long getScheduledEndTimeOffset() {
        return this.scheduledEndTimeOffset;
    }

    /**
     * <p>Sets the offset (in minutes) for scheduled end time for this phase.</p>
     *
     * @param scheduledEndTimeOffset a <code>Long</code> providing the offset (in minutes) for scheduled end time for
     * this phase.
     */
    public void setScheduledEndTimeOffset(Long scheduledEndTimeOffset) {
        this.scheduledEndTimeOffset = scheduledEndTimeOffset;
    }

    /**
     * <p>Gets the offset (in minutes) for scheduled start time for this phase.</p>
     *
     * @return a <code>Long</code> providing the offset (in minutes) for scheduled start time for this phase.
     */
    public Long getScheduledStartTimeOffset() {
        return this.scheduledStartTimeOffset;
    }

    /**
     * <p>Sets the offset (in minutes) for scheduled start time for this phase.</p>
     *
     * @param scheduledStartTimeOffset a <code>Long</code> providing the offset (in minutes) for scheduled start time
     * for this phase.
     */
    public void setScheduledStartTimeOffset(Long scheduledStartTimeOffset) {
        this.scheduledStartTimeOffset = scheduledStartTimeOffset;
    }

    /**
     * <p>Gets the offset (in minutes) for fixed start time for this phase.</p>
     *
     * @return a <code>Long</code> providing the offset (in minutes) for fixed start time for this phase.
     */
    public Long getFixedStartTimeOffset() {
        return this.fixedStartTimeOffset;
    }

    /**
     * <p>Sets the offset (in minutes) for fixed start time for this phase.</p>
     *
     * @param fixedStartTimeOffset a <code>Long</code> providing the offset (in minutes) for fixed start time for this
     * phase.
     */
    public void setFixedStartTimeOffset(Long fixedStartTimeOffset) {
        this.fixedStartTimeOffset = fixedStartTimeOffset;
    }

    /**
     * <p>Gets the ID for this phase.</p>
     *
     * @return a <code>long</code> providing the ID for this phase.
     */
    public long getPhaseId() {
        return this.phaseId;
    }

    /**
     * <p>Sets the ID for this phase.</p>
     *
     * @param phaseId a <code>long</code> providing the ID for this phase.
     */
    public void setPhaseId(long phaseId) {
        this.phaseId = phaseId;
    }

    /**
     * <p>Gets the type of this phase.</p>
     *
     * @return a <code>PhaseType</code> providing the type of this phase.
     */
    public PhaseType getPhaseType() {
        return this.phaseType;
    }

    /**
     * <p>Sets the type of this phase.</p>
     *
     * @param phaseType a <code>PhaseType</code> providing the type of this phase.
     */
    public void setPhaseType(PhaseType phaseType) {
        this.phaseType = phaseType;
    }

    /**
     * <p>Gets the status of this phase.</p>
     *
     * @return a <code>PhaseStatus</code> providing the status of this phase.
     */
    public PhaseStatus getPhaseStatus() {
        return this.phaseStatus;
    }

    /**
     * <p>Sets the status of this phase.</p>
     *
     * @param phaseStatus a <code>PhaseStatus</code> providing the status of this phase.
     */
    public void setPhaseStatus(PhaseStatus phaseStatus) {
        this.phaseStatus = phaseStatus;
    }

    /**
     * <p>Checks if this phase is of scheduled status.</p>
     * 
     * @return <code>true</code> if this phase is scheduled; <code>false</code> otherwise.
     */
    public boolean isScheduled() {
        return this.phaseStatus == PhaseStatus.SCHEDULED;
    } 

    /**
     * <p>Checks if this phase is of open status.</p>
     * 
     * @return <code>true</code> if this phase is open; <code>false</code> otherwise.
     */
    public boolean isOpen() {
        return this.phaseStatus == PhaseStatus.OPEN;
    } 

    /**
     * <p>Checks if this phase is of closed status.</p>
     * 
     * @return <code>true</code> if this phase is closed; <code>false</code> otherwise.
     */
    public boolean isClosed() {
        return this.phaseStatus == PhaseStatus.CLOSED;
    } 

    /**
     * <p>Gets the review scorecard which is used by the phase.</p>
     *
     * @return a <code>Scorecard</code> providing the review scorecard which is used by the phase.
     */
    public Scorecard getReviewScorecard() {
        return this.reviewScorecard;
    }

    /**
     * <p>Sets the review scorecard which is used by the phase.</p>
     *
     * @param reviewScorecard a <code>Scorecard</code> providing the review scorecard which is used by the phase.
     */
    public void setReviewScorecard(Scorecard reviewScorecard) {
        this.reviewScorecard = reviewScorecard;
    }
}
