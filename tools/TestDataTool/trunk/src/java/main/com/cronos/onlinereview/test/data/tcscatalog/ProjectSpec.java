/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for single project to be generated. Corresponds to <code>tcs_catalog.project_spec</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ProjectSpec implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this project specification.</p>
     */
    private long projectSpecId;

    /**
     * <p>A <code>long</code> providing the ID of a project.</p>
     */
    private long projectId;

    /**
     * <p>A <code>long</code> providing the version number of this project spec.</p>
     */
    private long version;

    /**
     * <p>A <code>String</code> providing the detailed requirements.</p>
     */
    private String detailedRequirements;

    /**
     * <p>A <code>String</code> providing the submission deliverables.</p>
     */
    private String submissionDeliverables;

    /**
     * <p>A <code>String</code> providing the environmentSetupInstructions.</p>
     */
    private String environmentSetupInstructions;

    /**
     * <p>A <code>String</code> providing the final submission guidelines.</p>
     */
    private String finalSubmissionGuidelines;

    /**
     * <p>A <code>String</code> providing the private description.</p>
     */
    private String privateDescription;


    /**
     *  <p>Constructs new <code>ProjectSpec</code> instance. This implementation does nothing.</p>
     */
    public ProjectSpec() {
    }

    /**
     * <p>Gets the private description.</p>
     *
     * @return a <code>String</code> providing the private description.
     */
    public String getPrivateDescription() {
        return this.privateDescription;
    }

    /**
     * <p>Sets the private description.</p>
     *
     * @param privateDescription a <code>String</code> providing the private description.
     */
    public void setPrivateDescription(String privateDescription) {
        this.privateDescription = privateDescription;
    }

    /**
     * <p>Gets the final submission guidelines.</p>
     *
     * @return a <code>String</code> providing the final submission guidelines.
     */
    public String getFinalSubmissionGuidelines() {
        return this.finalSubmissionGuidelines;
    }

    /**
     * <p>Sets the final submission guidelines.</p>
     *
     * @param finalSubmissionGuidelines a <code>String</code> providing the final submission guidelines.
     */
    public void setFinalSubmissionGuidelines(String finalSubmissionGuidelines) {
        this.finalSubmissionGuidelines = finalSubmissionGuidelines;
    }

    /**
     * <p>Gets the environmentSetupInstructions.</p>
     *
     * @return a <code>String</code> providing the environmentSetupInstructions.
     */
    public String getEnvironmentSetupInstructions() {
        return this.environmentSetupInstructions;
    }

    /**
     * <p>Sets the environmentSetupInstructions.</p>
     *
     * @param environmentSetupInstructions a <code>String</code> providing the environmentSetupInstructions.
     */
    public void setEnvironmentSetupInstructions(String environmentSetupInstructions) {
        this.environmentSetupInstructions = environmentSetupInstructions;
    }

    /**
     * <p>Gets the submission deliverables.</p>
     *
     * @return a <code>String</code> providing the submission deliverables.
     */
    public String getSubmissionDeliverables() {
        return this.submissionDeliverables;
    }

    /**
     * <p>Sets the submission deliverables.</p>
     *
     * @param submissionDeliverables a <code>String</code> providing the submission deliverables.
     */
    public void setSubmissionDeliverables(String submissionDeliverables) {
        this.submissionDeliverables = submissionDeliverables;
    }

    /**
     * <p>Gets the detailed requirements.</p>
     *
     * @return a <code>String</code> providing the detailed requirements.
     */
    public String getDetailedRequirements() {
        return this.detailedRequirements;
    }

    /**
     * <p>Sets the detailed requirements.</p>
     *
     * @param detailedRequirements a <code>String</code> providing the detailed requirements.
     */
    public void setDetailedRequirements(String detailedRequirements) {
        this.detailedRequirements = detailedRequirements;
    }

    /**
     * <p>Gets the version number of this project spec.</p>
     *
     * @return a <code>long</code> providing the version number of this project spec.
     */
    public long getVersion() {
        return this.version;
    }

    /**
     * <p>Sets the version number of this project spec.</p>
     *
     * @param version a <code>long</code> providing the version number of this project spec.
     */
    public void setVersion(long version) {
        this.version = version;
    }

    /**
     * <p>Gets the ID of a project.</p>
     *
     * @return a <code>long</code> providing the ID of a project.
     */
    public long getProjectId() {
        return this.projectId;
    }

    /**
     * <p>Sets the ID of a project.</p>
     *
     * @param projectId a <code>long</code> providing the ID of a project.
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>Gets the ID of this project specification.</p>
     *
     * @return a <code>long</code> providing the ID of this project specification.
     */
    public long getProjectSpecId() {
        return this.projectSpecId;
    }

    /**
     * <p>Sets the ID of this project specification.</p>
     *
     * @param projectSpecId a <code>long</code> providing the ID of this project specification.
     */
    public void setProjectSpecId(long projectSpecId) {
        this.projectSpecId = projectSpecId;
    }

}
