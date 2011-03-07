/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for a single review which may be associated with the project's resource. Corresponds to 
 * <code>tcs_catalog.review</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class Review implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this review.</p>
     */
    private long reviewId;

    /**
     * <p>A <code>long</code> providing the ID of a resource who is the author of the review.</p>
     */
    private long resourceId;

    /**
     * <p>A <code>long</code> providing the ID of a submission associated with this review..</p>
     */
    private long submissionId;

    /**
     * <p>A <code>long</code> providing the ID of a scorecard.</p>
     */
    private long scorecardId;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this review is committed or not.</p>
     */
    private boolean committed;

    /**
     * <p>A <code>Double</code> providing the initial review score.</p>
     */
    private Double initialScore;

    /**
     * <p>A <code>Double</code> providing the final review score.</p>
     */
    private Double score;

    /**
     * <p>A <code>ReviewComment[]</code> providing the comments associated with the review.</p>
     */
    private ReviewComment[] comments;

    /**
     * <p>A <code>ReviewItem[]</code> providing the review items associated with this review.</p>
     */
    private ReviewItem[] items;

    /**
     * <p>Constructs new <code>Review</code> instance. This implementation does nothing.</p>
     */
    public Review() {
    }

    /**
     * <p>Gets the final review score.</p>
     *
     * @return a <code>Double</code> providing the final review score.
     */
    public Double getScore() {
        return this.score;
    }

    /**
     * <p>Sets the final review score.</p>
     *
     * @param score a <code>Double</code> providing the final review score.
     */
    public void setScore(Double score) {
        this.score = score;
    }

    /**
     * <p>Gets the initial review score.</p>
     *
     * @return a <code>Double</code> providing the initial review score.
     */
    public Double getInitialScore() {
        return this.initialScore;
    }

    /**
     * <p>Sets the initial review score.</p>
     *
     * @param initialScore a <code>Double</code> providing the initial review score.
     */
    public void setInitialScore(Double initialScore) {
        this.initialScore = initialScore;
    }

    /**
     * <p>Gets the flag indicating whether this review is committed or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this review is committed or not.
     */
    public boolean getCommitted() {
        return this.committed;
    }

    /**
     * <p>Sets the flag indicating whether this review is committed or not.</p>
     *
     * @param committed a <code>boolean</code> providing the flag indicating whether this review is committed or not.
     */
    public void setCommitted(boolean committed) {
        this.committed = committed;
    }

    /**
     * <p>Gets the ID of a scorecard.</p>
     *
     * @return a <code>long</code> providing the ID of a scorecard.
     */
    public long getScorecardId() {
        return this.scorecardId;
    }

    /**
     * <p>Sets the ID of a scorecard.</p>
     *
     * @param scorecardId a <code>long</code> providing the ID of a scorecard.
     */
    public void setScorecardId(long scorecardId) {
        this.scorecardId = scorecardId;
    }

    /**
     * <p>Gets the ID of a submission associated with this review..</p>
     *
     * @return a <code>long</code> providing the ID of a submission associated with this review..
     */
    public long getSubmissionId() {
        return this.submissionId;
    }

    /**
     * <p>Sets the ID of a submission associated with this review..</p>
     *
     * @param submissionId a <code>long</code> providing the ID of a submission associated with this review..
     */
    public void setSubmissionId(long submissionId) {
        this.submissionId = submissionId;
    }

    /**
     * <p>Gets the ID of a resource who is the author of the review.</p>
     *
     * @return a <code>long</code> providing the ID of a resource who is the author of the review.
     */
    public long getResourceId() {
        return this.resourceId;
    }

    /**
     * <p>Sets the ID of a resource who is the author of the review.</p>
     *
     * @param resourceId a <code>long</code> providing the ID of a resource who is the author of the review.
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * <p>Gets the ID of this review.</p>
     *
     * @return a <code>long</code> providing the ID of this review.
     */
    public long getReviewId() {
        return this.reviewId;
    }

    /**
     * <p>Sets the ID of this review.</p>
     *
     * @param reviewId a <code>long</code> providing the ID of this review.
     */
    public void setReviewId(long reviewId) {
        this.reviewId = reviewId;
    }

    /**
     * <p>Gets the comments associated with the review.</p>
     *
     * @return a <code>ReviewComment[]</code> providing the comments associated with the review.
     */
    public ReviewComment[] getComments() {
        return this.comments;
    }

    /**
     * <p>Sets the comments associated with the review.</p>
     *
     * @param comments a <code>ReviewComment[]</code> providing the comments associated with the review.
     */
    public void setComments(ReviewComment[] comments) {
        this.comments = comments;
    }

    /**
     * <p>Gets the review items associated with this review.</p>
     *
     * @return a <code>ReviewItem[]</code> providing the review items associated with this review.
     */
    public ReviewItem[] getItems() {
        return this.items;
    }

    /**
     * <p>Sets the review items associated with this review.</p>
     *
     * @param items a <code>ReviewItem[]</code> providing the review items associated with this review.
     */
    public void setItems(ReviewItem[] items) {
        this.items = items;
    }
}
