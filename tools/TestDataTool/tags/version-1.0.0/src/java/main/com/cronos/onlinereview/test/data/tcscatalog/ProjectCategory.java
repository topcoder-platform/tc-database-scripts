/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over the project categories. Corresponds to <code>tcs_catalog.project_category_lu</code> database
 * table.</p>
 *
 * @author isv
 * @version 1.0
 */
public enum ProjectCategory {
    
    DESIGN(1, "Design", ProjectType.COMPONENT, true, new long[] {4, 5, 6}, 39, true),

    DEVELOPMENT(2, "Development", ProjectType.COMPONENT, true, new long[] {1, 2, 3}, 38, true),

    SPECIFICATION(6, "Specification", ProjectType.APPLICATION, false, new long[] {16, 17, 18}, 43, true),

    ARCHITECTURE(7, "Architecture", ProjectType.APPLICATION, true, new long[] {10, 11, 12}, 41, true),

    TEST_SUITES(13, "Test Suites", ProjectType.APPLICATION, true, new long[] {19, 20, 21}, 44, true),

    ASSEMBLY(14, "Assembly Competition", ProjectType.APPLICATION, true, new long[] {7, 8, 9}, 40, true),
    
    UI_PROTOTYPES(19, "UI Prototypes", ProjectType.STUDIO, true, new long[] {22, 23, 24}, 45, true),

    CONCEPTUALIZATION(23, "Conceptualization", ProjectType.APPLICATION, false, new long[] {13, 14, 15}, 42, true),

    RIA_BUILD(24, "RIA Build", ProjectType.APPLICATION, true, new long[] {25, 26, 27}, 46, true),

    RIA_COMPONENT(25, "RIA Component", ProjectType.APPLICATION, true, new long[] {28, 29, 30}, 47, false),

    TEST_SCENARIOS(26, "Test Scenarios", ProjectType.APPLICATION, true, new long[] {31, 32, 33}, 48, false),

    COPILOT_POSTING(29, "Copilot Posting", ProjectType.APPLICATION, false, new long[] {60, 61, 62}, 0, false),

    CONTENT_CREATION(35, "Content Creation", ProjectType.APPLICATION, false, new long[] {63, 64, 65}, 50, false);

    /**
     * <p>A <code>long</code> providing the ID of this project category.</p>
     */
    private long projectCategoryId;

    /**
     * <p>A <code>String</code> providing the name of this project category.</p>
     */
    private String name;

    /**
     * <p>A <code>ProjectType</code> providing the type of the project this category belongs to.</p>
     */
    private ProjectType projectType;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the projects of this category are required the
     * list of technologies to be set or not.</p>
     */
    private boolean technologyRequired;

    /**
     * <p>A <code>long</code> providing the list of IDs for records in review_resp table mapped to this category.</p>
     */
    private long[] reviewRespIds;

    /**
     * <p>A <code>long</code> providing the ID for record in review_resp table mapped to this category for spec
     * review.</p>
     */
    private long specReviewRespId;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the user ratings for this category are supported
     * or not.</p>
     */
    private boolean rated;

    /**
     * <p>Constructs new <code>ProjectCategory</code> instance with specified ID and name.</p>
     *
     * @param projectCategoryId a <code>long</code> providing the ID of this project category.
     * @param name a <code>String</code> providing the name of this project category.
     * @param projectType a <code>ProjectType</code> specifying the type of this project category.
     * @param technologyRequired <code>true</code> if projects of this category are required the list of technologies to
     * @param reviewRespIds a <code>long</code> array providing the list of IDs for records in review_resp table mapped
     * @param specReviewRespId a <code>long</code> providing the ID for record in review_resp table mapped to this
     * @param rated <code>true</code> if user ratings for this project category are support; 
     *        <code>false</code> otherwise.
     */
    private ProjectCategory(long projectCategoryId, String name, ProjectType projectType, boolean technologyRequired,
                            long[] reviewRespIds, long specReviewRespId, boolean rated) {
        this.projectCategoryId = projectCategoryId;
        this.name = name;
        this.projectType = projectType;
        this.technologyRequired = technologyRequired;
        this.reviewRespIds = reviewRespIds;
        this.specReviewRespId = specReviewRespId;
        this.rated = rated;
    }

    /**
     * <p>Gets the name of this project category.</p>
     *
     * @return a <code>String</code> providing the name of this project category.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this project category.</p>
     *
     * @return a <code>long</code> providing the ID of this project category.
     */
    public long getProjectCategoryId() {
        return this.projectCategoryId;
    }
    
    /**
     * <p>Gets the type of the project this category belongs to.</p>
     *
     * @return a <code>ProjectType</code> providing the type of the project this category belongs to.
     */
    public ProjectType getProjectType() {
        return this.projectType;
    }

    /**
     * <p>Gets the flag indicating whether the projects of this category are required the list of technologies to be set
     * or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the projects of this category are required
     *         the list of technologies to be ste or not.
     */
    public boolean getTechnologyRequired() {
        return this.technologyRequired;
    }

    /**
     * <p>Gets the list of IDs for records in review_resp table mapped to this category.</p>
     *
     * @return a <code>long</code> providing the list of IDs for records in review_resp table mapped to this category.
     */
    public long[] getReviewRespIds() {
        return this.reviewRespIds;
    }

    /**
     * <p>Gets the ID for record in review_resp table mapped to this category for spec review.</p>
     *
     * @return a <code>long</code> providing the ID for record in review_resp table mapped to this category for spec
     *         review.
     */
    public long getSpecReviewRespId() {
        return this.specReviewRespId;
    }

    /**
     * <p>Gets the flag indicating whether the user ratings for this category are supported or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the user ratings for this category are
     *         supported or not.
     */
    public boolean getRated() {
        return this.rated;
    }
}
