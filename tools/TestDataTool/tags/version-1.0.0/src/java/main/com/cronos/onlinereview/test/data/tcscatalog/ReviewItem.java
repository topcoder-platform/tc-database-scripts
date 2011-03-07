/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for a single review item which may be associated with the single review. Corresponds to 
 * <code>tcs_catalog.review_item</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ReviewItem implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this review item.</p>
     */
    private long reviewItemId;

    /**
     * <p>A <code>long</code> providing the ID for the review associated with this review item.</p>
     */
    private long reviewId;

    /**
     * <p>A <code>long</code> providing the ID for scorecard question corresponding to this review item.</p>
     */
    private long scorecardQuestionId;

    /**
     * <p>A <code>Long</code> providing the ID for the document upload associated with this review item.</p>
     */
    private Long uploadId;

    /**
     * <p>A <code>String</code> providing the answer for this review item..</p>
     */
    private String answer;

    /**
     * <p>A <code>int</code> providing the sorting order for this review item.</p>
     */
    private int sortOrder;

    /**
     * <p>A <code>ReviewItemComment[]</code> providing the review item comments.</p>
     */
    private ReviewItemComment[] comments;

    /**
     * <p>Constructs new <code>ReviewItem</code> instance. This implementation does nothing.</p>
     */
    public ReviewItem() {
    }

    /**
     * <p>Gets the sorting order for this review item.</p>
     *
     * @return a <code>int</code> providing the sorting order for this review item.
     */
    public int getSortOrder() {
        return this.sortOrder;
    }

    /**
     * <p>Sets the sorting order for this review item.</p>
     *
     * @param sortOrder a <code>int</code> providing the sorting order for this review item.
     */
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * <p>Gets the answer for this review item..</p>
     *
     * @return a <code>String</code> providing the answer for this review item..
     */
    public String getAnswer() {
        return this.answer;
    }

    /**
     * <p>Sets the answer for this review item..</p>
     *
     * @param answer a <code>String</code> providing the answer for this review item..
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * <p>Gets the ID for the document upload associated with this review item.</p>
     *
     * @return a <code>Long</code> providing the ID for the document upload associated with this review item.
     */
    public Long getUploadId() {
        return this.uploadId;
    }

    /**
     * <p>Sets the ID for the document upload associated with this review item.</p>
     *
     * @param uploadId a <code>Long</code> providing the ID for the document upload associated with this review item.
     */
    public void setUploadId(Long uploadId) {
        this.uploadId = uploadId;
    }

    /**
     * <p>Gets the ID for scorecard question corresponding to this review item.</p>
     *
     * @return a <code>long</code> providing the ID for scorecard question corresponding to this review item.
     */
    public long getScorecardQuestionId() {
        return this.scorecardQuestionId;
    }

    /**
     * <p>Sets the ID for scorecard question corresponding to this review item.</p>
     *
     * @param scorecardQuestionId a <code>long</code> providing the ID for scorecard question corresponding to this
     *                            review item.
     */
    public void setScorecardQuestionId(long scorecardQuestionId) {
        this.scorecardQuestionId = scorecardQuestionId;
    }

    /**
     * <p>Gets the ID for the review associated with this review item.</p>
     *
     * @return a <code>long</code> providing the ID for the review associated with this review item.
     */
    public long getReviewId() {
        return this.reviewId;
    }

    /**
     * <p>Sets the ID for the review associated with this review item.</p>
     *
     * @param reviewId a <code>long</code> providing the ID for the review associated with this review item.
     */
    public void setReviewId(long reviewId) {
        this.reviewId = reviewId;
    }

    /**
     * <p>Gets the ID of this review item.</p>
     *
     * @return a <code>long</code> providing the ID of this review item.
     */
    public long getReviewItemId() {
        return this.reviewItemId;
    }

    /**
     * <p>Sets the ID of this review item.</p>
     *
     * @param reviewItemId a <code>long</code> providing the ID of this review item.
     */
    public void setReviewItemId(long reviewItemId) {
        this.reviewItemId = reviewItemId;
    }

    /**
     * <p>Gets the review item comments.</p>
     *
     * @return a <code>ReviewItemComment[]</code> providing the review item comments.
     */
    public ReviewItemComment[] getComments() {
        return this.comments;
    }

    /**
     * <p>Sets the review item comments.</p>
     *
     * @param comments a <code>ReviewItemComment[]</code> providing the review item comments.
     */
    public void setComments(ReviewItemComment[] comments) {
        this.comments = comments;
    }
}
