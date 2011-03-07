/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for a single review comment which may be associated with the single review. Corresponds to 
 * <code>tcs_catalog.review_comment</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ReviewComment implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this review comment.</p>
     */
    private long reviewCommentId;

    /**
     * <p>A <code>long</code> providing the ID of review associated with this comment.</p>
     */
    private long reviewId;

    /**
     * <p>A <code>long</code> providing the ID of a resource associated with this comment.</p>
     */
    private long resourceId;

    /**
     * <p>A <code>CommentType</code> providing the type of this comment.</p>
     */
    private CommentType type;

    /**
     * <p>A <code>String</code> providing the content of this comment.</p>
     */
    private String content;

    /**
     * <p>A <code>String</code> providing the extra info for this comment.</p>
     */
    private String extraInfo;

    /**
     * <p>A <code>int</code> providing the sorting order for this comment.</p>
     */
    private int sortOrder;

    /**
     * <p>Constructs new <code>ReviewComment</code> instance. This implementation does nothing.</p>
     */
    public ReviewComment() {
    }

    /**
     * <p>Gets the sorting order for this comment.</p>
     *
     * @return a <code>int</code> providing the sorting order for this comment.
     */
    public int getSortOrder() {
        return this.sortOrder;
    }

    /**
     * <p>Sets the sorting order for this comment.</p>
     *
     * @param sortOrder a <code>int</code> providing the sorting order for this comment.
     */
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    /**
     * <p>Gets the extra info for this comment.</p>
     *
     * @return a <code>String</code> providing the extra info for this comment.
     */
    public String getExtraInfo() {
        return this.extraInfo;
    }

    /**
     * <p>Sets the extra info for this comment.</p>
     *
     * @param extraInfo a <code>String</code> providing the extra info for this comment.
     */
    public void setExtraInfo(String extraInfo) {
        this.extraInfo = extraInfo;
    }

    /**
     * <p>Gets the content of this comment.</p>
     *
     * @return a <code>String</code> providing the content of this comment.
     */
    public String getContent() {
        return this.content;
    }

    /**
     * <p>Sets the content of this comment.</p>
     *
     * @param content a <code>String</code> providing the content of this comment.
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * <p>Gets the type of this comment.</p>
     *
     * @return a <code>CommentType</code> providing the type of this comment.
     */
    public CommentType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of this comment.</p>
     *
     * @param type a <code>CommentType</code> providing the type of this comment.
     */
    public void setType(CommentType type) {
        this.type = type;
    }

    /**
     * <p>Gets the ID of a resource associated with this comment.</p>
     *
     * @return a <code>long</code> providing the ID of a resource associated with this comment.
     */
    public long getResourceId() {
        return this.resourceId;
    }

    /**
     * <p>Sets the ID of a resource associated with this comment.</p>
     *
     * @param resourceId a <code>long</code> providing the ID of a resource associated with this comment.
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * <p>Gets the ID of review associated with this comment.</p>
     *
     * @return a <code>long</code> providing the ID of review associated with this comment.
     */
    public long getReviewId() {
        return this.reviewId;
    }

    /**
     * <p>Sets the ID of review associated with this comment.</p>
     *
     * @param reviewId a <code>long</code> providing the ID of review associated with this comment.
     */
    public void setReviewId(long reviewId) {
        this.reviewId = reviewId;
    }

    /**
     * <p>Gets the ID of this review comment.</p>
     *
     * @return a <code>long</code> providing the ID of this review comment.
     */
    public long getReviewCommentId() {
        return this.reviewCommentId;
    }

    /**
     * <p>Sets the ID of this review comment.</p>
     *
     * @param reviewCommentId a <code>long</code> providing the ID of this review comment.
     */
    public void setReviewCommentId(long reviewCommentId) {
        this.reviewCommentId = reviewCommentId;
    }
}
