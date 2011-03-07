/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for a single review item comment which may be associated with the single review item. Corresponds to 
 * <code>tcs_catalog.review_item_comment</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ReviewItemComment implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID for this review item comment.</p>
     */
    private long reviewItemCommentId;

    /**
     * <p>A <code>long</code> providing the ID for the resource associated with this comment.</p>
     */
    private long resourceId;

    /**
     * <p>A <code>long</code> providing the ID of review item which this comment belongs to.</p>
     */
    private long reviewItemId;

    /**
     * <p>A <code>CommentType</code> providing the type of the comment.</p>
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
     * <p>Constructs new <code>ReviewItemComment</code> instance. This implementation does nothing.</p>
     */
    public ReviewItemComment() {
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
     * <p>Gets the type of the comment.</p>
     *
     * @return a <code>CommentType</code> providing the type of the comment.
     */
    public CommentType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of the comment.</p>
     *
     * @param type a <code>CommentType</code> providing the type of the comment.
     */
    public void setType(CommentType type) {
        this.type = type;
    }

    /**
     * <p>Gets the ID of review item which this comment belongs to.</p>
     *
     * @return a <code>long</code> providing the ID of review item which this comment belongs to.
     */
    public long getReviewItemId() {
        return this.reviewItemId;
    }

    /**
     * <p>Sets the ID of review item which this comment belongs to.</p>
     *
     * @param reviewItemId a <code>long</code> providing the ID of review item which this comment belongs to.
     */
    public void setReviewItemId(long reviewItemId) {
        this.reviewItemId = reviewItemId;
    }

    /**
     * <p>Gets the ID for the resource associated with this comment.</p>
     *
     * @return a <code>long</code> providing the ID for the resource associated with this comment.
     */
    public long getResourceId() {
        return this.resourceId;
    }

    /**
     * <p>Sets the ID for the resource associated with this comment.</p>
     *
     * @param resourceId a <code>long</code> providing the ID for the resource associated with this comment.
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * <p>Gets the ID for this review item comment.</p>
     *
     * @return a <code>long</code> providing the ID for this review item comment.
     */
    public long getReviewItemCommentId() {
        return this.reviewItemCommentId;
    }

    /**
     * <p>Sets the ID for this review item comment.</p>
     *
     * @param reviewItemCommentId a <code>long</code> providing the ID for this review item comment.
     */
    public void setReviewItemCommentId(long reviewItemCommentId) {
        this.reviewItemCommentId = reviewItemCommentId;
    }
}
