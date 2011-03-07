/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the scorecard types. Corresponds to <code>tcs_catalog.comment_type_Lu</code> database table.
 * </p>
 * 
 * @author isv
 * @version 1.0
 */
public enum CommentType {

    COMMENT(1, "Comment"),

    RECOMMENDED(2, "Recommended"),

    REQUIRED(3, "Required"),

    APPEAL(4, "Appeal"),

    APPEAL_RESPONSE(5, "Appeal Response"),

    AGGREATION_COMMENT(6, "Aggregation Comment"),

    AGGREGATION_REVIEW_COMMENT(7, "Aggregation Review Comment"),

    SUBMITTER_COMMENT(8, "Submitter Comment"),

    FINAL_FIX_COMMENT(9, "Final Fix Comment"),

    FINAL_REVIEW_COMMENT(10, "Final Review Comment"),

    MANAGER_COMMENT(11, "Manager Comment"),

    APPROVAL_REVIEW_COMMENT(12, "Approval Review Comment"),

    APPROVAL_REVIEW_COMMENT_OTHER_FIXES(13, "Approval Review Comment - Other Fixes"),

    SPECIFICATION_REVIEW_COMMENT(14, "Specification Review Comment");

    /**
     * <p>A <code>long</code> providing the ID of this comment type.</p>
     */
    private long commentTypeId;

    /**
     * <p>A <code>String</code> providing the name of this comment type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>CommentType</code> instance with specified ID and name.</p>
     *
     * @param commentTypeId a <code>long</code> providing the ID of this comment type.
     * @param name a <code>String</code> providing the name of this comment type.
     */
    private CommentType(long commentTypeId, String name) {
        this.commentTypeId = commentTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this comment type.</p>
     *
     * @return a <code>String</code> providing the name of this comment type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this comment type.</p>
     *
     * @return a <code>long</code> providing the ID of this comment type.
     */
    public long getCommentTypeId() {
        return this.commentTypeId;
    }
}
