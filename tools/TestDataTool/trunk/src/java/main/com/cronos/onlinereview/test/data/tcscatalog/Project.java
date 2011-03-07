/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;
import java.util.List;

/**
 * <p>A DTO for single project to be generated. Corresponds to <code>tcs_catalog.project</code> and
 * <code>tcs_catalog.project_info</code> database tables.</p>
 *
 * @author isv
 * @version 1.0
 */
public class Project implements Serializable {

    /**
     * <p>A <code>Component</code> providing the details for the component associated with this project.</p>
     */
    private Component component;

    /**
     * <p>A <code>long</code> providing the ID for the project.</p>
     */
    private long projectId;

    /**
     * <p>A <code>Catalog</code> providing the catalog set for this project.</p>
     */
    private Catalog catalog;

    /**
     * <p>A <code>String</code> providing the project name.</p>
     */
    private String projectName;

    /**
     * <p>A <code>String</code> providing the project version.</p>
     */
    private String projectVersion;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the Auto_pilot is turned on or off for this
     * project.</p>
     */
    private boolean autoPilotOption;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the status notification is turned on or off for
     * this project.</p>
     */
    private boolean statusNotificationOption;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the timeline notification is turned on or off for
     * this project.</p>
     */
    private boolean timelineNotificationOption;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this project is public or not.</p>
     */
    private boolean visible;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this project is rated or not.</p>
     */
    private boolean rated;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this project is part of <code>Digital Run</code>
     * or not.</p>
     */
    private boolean digitalRunEnabled;

    /**
     * <p>A <code>Double</code> providing the Digital Run points set for this project.</p>
     */
    private Double digitalRunPoints;

    /**
     * <p>A <code>Phase[]</code> providing the phases set for this project.</p>
     */
    private Phase[] phases;

    /**
     * <p>A <code>List</code> providing the resources set for the phase.</p>
     */
    private List<Resource> resources;

    /**
     * <p>A <code>ProjectCategory</code> providing the category of this project.</p>
     */
    private ProjectCategory projectCategory;

    /**
     * <p>A <code>ProjectStatus</code> providing the status of this project.</p>
     */
    private ProjectStatus projectStatus;

    /**
     * <p>A <code>long</code> providing the ID of a forum.</p>
     */
    private long forumId;

    /**
     * <p>A <code>Double</code> providing the price for this project if it is a component.</p>
     */
    private Double price;

    /**
     * <p>A <code>long</code> providing the ID of direct project.</p>
     */
    private long tcDirectProjectId;

    /**
     * <p>A <code>boolean</code> providing the flag indicating if CCA required for this project or not.</p>
     */
    private boolean ccaRequired;

    /**
     * <p>A <code>String</code> providing the SVN module for this project.</p>
     */
    private String svnModule;

    /**
     * <p>A <code>String</code> providing the notes for this project.</p>
     */
    private String notes;

    /**
     * <p>A <code>Double</code> providing the admin fee for this project.</p>
     */
    private Double adminFee;

    /**
     * <p>A <code>Double</code> providing the review cost for this project.</p>
     */
    private Double reviewCost;

    /**
     * <p>A <code>Double</code> providing the specification review cost for this project.</p>
     */
    private Double specReviewCost;

    /**
     * <p>A <code>Double</code> providing the first place cost for this project.</p>
     */
    private Double firstPlaceCost;

    /**
     * <p>A <code>Double</code> providing the second place cost for this project.</p>
     */
    private Double secondPlaceCost;

    /**
     * <p>A <code>Double</code> providing the reliability bonus cost for this project.</p>
     */
    private Double reliabilityBonusCost;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this project affects reliability ratings or
     * not.</p>
     */
    private boolean reliabilityBonusEligible;

    /**
     * <p>A <code>Double</code> providing the milestone bonus cost for this project.</p>
     */
    private Double milestoneBonusCost;

    /**
     * <p>A <code>String</code> providing the cost lever for this project.</p>
     */
    private String costLevel;

    /**
     * <p>A <code>String</code> providing the confidentiality type for this project.</p>
     */
    private String confidentialityType;

    /**
     * <p>A <code>boolean</code> providing the flag indicating if approval is required for this project.</p>
     */
    private boolean approvalRequired;

    /**
     * <p>A <code>boolean</code> providing the flag indicating if post-mortem is required for this project.</p>
     */
    private boolean postMortemRequired;

    /**
     * <p>A <code>boolean</code> providing the flag indicating if sending winner emails is required for this
     * project.</p>
     */
    private boolean sendWinnerEmails;

    /**
     * <p>A <code>boolean</code> providing the flag indicating if this project is eligible for member payments.</p>
     */
    private boolean memberPaymentsEligible;

    /**
     * <p>A <code>boolean</code> providing the flag indicating if tracking late deliverables is required for this
     * project.</p>
     */
    private boolean trackLateDeliverables;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the phase dependencies are editable for project
     * or not.</p>
     */
    private boolean phaseDependenciesEditable;

    /**
     * <p>A <code>Long</code> providing the Id of a billing account associated with this project.</p>
     */
    private Long billingProjectId;

    /**
     * <p>A <code>ProjectSpec</code> providing the project spec.</p>
     */
    private ProjectSpec projectSpec;

    /**
     * <p>A <code>ContestSale</code> providing the details for contest sale for this project.</p>
     */
    private ContestSale contestSale;

    /**
     * <p>A <code>Long</code> providing the ID of a winning user.</p>
     */
    private Long winnerUserId;

    /**
     * <p>A <code>Long</code> providing the ID of runner-up user..</p>
     */
    private Long runnerUpUserId;

    /**
     * <p>Constructs new <code>Project</code> instance. This implementation does nothing.</p>
     */
    public Project() {
    }

    /**
     * <p>Gets the price for this project if it is a component.</p>
     *
     * @return a <code>Double</code> providing the price for this project if it is a component.
     */
    public Double getPrice() {
        return this.price;
    }

    /**
     * <p>Sets the price for this project if it is a component.</p>
     *
     * @param price a <code>Double</code> providing the price for this project if it is a component.
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * <p>Gets the ID of a forum.</p>
     *
     * @return a <code>long</code> providing the ID of a forum.
     */
    public long getForumId() {
        return this.forumId;
    }

    /**
     * <p>Sets the ID of a forum.</p>
     *
     * @param forumId a <code>long</code> providing the ID of a forum.
     */
    public void setForumId(long forumId) {
        this.forumId = forumId;
    }

    /**
     * <p>Gets the status of this project.</p>
     *
     * @return a <code>ProjectStatus</code> providing the status of this project.
     */
    public ProjectStatus getProjectStatus() {
        return this.projectStatus;
    }

    /**
     * <p>Sets the status of this project.</p>
     *
     * @param projectStatus a <code>ProjectStatus</code> providing the status of this project.
     */
    public void setProjectStatus(ProjectStatus projectStatus) {
        this.projectStatus = projectStatus;
    }

    /**
     * <p>Gets the category of this project.</p>
     *
     * @return a <code>ProjectCategory</code> providing the category of this project.
     */
    public ProjectCategory getProjectCategory() {
        return this.projectCategory;
    }

    /**
     * <p>Sets the category of this project.</p>
     *
     * @param projectCategory a <code>ProjectCategory</code> providing the category of this project.
     */
    public void setProjectCategory(ProjectCategory projectCategory) {
        this.projectCategory = projectCategory;
    }

    /**
     * <p>Gets the resources set for the phase.</p>
     *
     * @return a <code>List</code> providing the resources set for the phase.
     */
    public List<Resource> getResources() {
        return this.resources;
    }

    /**
     * <p>Sets the resources set for the phase.</p>
     *
     * @param resources a <code>List</code> providing the resources set for the phase.
     */
    public void setResources(List<Resource> resources) {
        this.resources = resources;
    }

    /**
     * <p>Gets the phases set for this project.</p>
     *
     * @return a <code>Phase[]</code> providing the phases set for this project.
     */
    public Phase[] getPhases() {
        return this.phases;
    }

    /**
     * <p>Sets the phases set for this project.</p>
     *
     * @param phases a <code>Phase[]</code> providing the phases set for this project.
     */
    public void setPhases(Phase[] phases) {
        this.phases = phases;
    }

    /**
     * <p>Gets the Digital Run points set for this project.</p>
     *
     * @return a <code>Double</code> providing the Digital Run points set for this project.
     */
    public Double getDigitalRunPoints() {
        return this.digitalRunPoints;
    }

    /**
     * <p>Sets the Digital Run points set for this project.</p>
     *
     * @param digitalRunPoints a <code>Double</code> providing the Digital Run points set for this project.
     */
    public void setDigitalRunPoints(Double digitalRunPoints) {
        this.digitalRunPoints = digitalRunPoints;
    }

    /**
     * <p>Gets the flag indicating whether this project is part of <code>Digital Run</code> or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this project is part of
     *         <code>Digital Run</code> or not.
     */
    public boolean isDigitalRunEnabled() {
        return this.digitalRunEnabled;
    }

    /**
     * <p>Sets the flag indicating whether this project is part of c.</p>
     *
     * @param digitalRunEnabled a <code>boolean</code> providing the flag indicating whether this project is part of
     *        <code>Digital Run</code> or not.
     */
    public void setDigitalRunEnabled(boolean digitalRunEnabled) {
        this.digitalRunEnabled = digitalRunEnabled;
    }

    /**
     * <p>Gets the flag indicating whether this project is rated or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this project is rated or not.
     */
    public boolean isRated() {
        return this.rated;
    }

    /**
     * <p>Sets the flag indicating whether this project is rated or not.</p>
     *
     * @param rated a <code>boolean</code> providing the flag indicating whether this project is rated or not.
     */
    public void setRated(boolean rated) {
        this.rated = rated;
    }

    /**
     * <p>Gets the flag indicating whether this project is public or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this project is public or not.
     */
    public boolean isVisible() {
        return this.visible;
    }

    /**
     * <p>Sets the flag indicating whether this project is public or not.</p>
     *
     * @param visible a <code>boolean</code> providing the flag indicating whether this project is public or not.
     */
    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    /**
     * <p>Gets the flag indicating whether the timeline notification is turned on or off for this project.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the timeline notification is turned on or
     *         off for this project.
     */
    public boolean isTimelineNotificationOption() {
        return this.timelineNotificationOption;
    }

    /**
     * <p>Sets the flag indicating whether the timeline notification is turned on or off for this project.</p>
     *
     * @param timelineNotificationOption a <code>boolean</code> providing the flag indicating whether the timeline
     * notification is turned on or off for this project.
     */
    public void setTimelineNotificationOption(boolean timelineNotificationOption) {
        this.timelineNotificationOption = timelineNotificationOption;
    }

    /**
     * <p>Gets the flag indicating whether the status notification is turned on or off for this project.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the status notification is turned on or off
     *         for this project.
     */
    public boolean isStatusNotificationOption() {
        return this.statusNotificationOption;
    }

    /**
     * <p>Sets the flag indicating whether the status notification is turned on or off for this project.</p>
     *
     * @param statusNotificationOption a <code>boolean</code> providing the flag indicating whether the status
     * notification is turned on or off for this project.
     */
    public void setStatusNotificationOption(boolean statusNotificationOption) {
        this.statusNotificationOption = statusNotificationOption;
    }


    /**
     * <p>Gets the flag indicating whether the Auto_pilot is turned on or off for this project.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the Auto_pilot is turned on or off for this
     *         project.
     */
    public boolean isAutoPilotOption() {
        return this.autoPilotOption;
    }

    /**
     * <p>Sets the flag indicating whether the Auto_pilot is turned on or off for this project.</p>
     *
     * @param autoPilotOption a <code>boolean</code> providing the flag indicating whether the Auto_pilot is turned on
     * or off for this project.
     */
    public void setAutoPilotOption(boolean autoPilotOption) {
        this.autoPilotOption = autoPilotOption;
    }

    /**
     * <p>Gets the project version.</p>
     *
     * @return a <code>String</code> providing the project version.
     */
    public String getProjectVersion() {
        return this.projectVersion;
    }

    /**
     * <p>Sets the project version.</p>
     *
     * @param projectVersion a <code>String</code> providing the project version.
     */
    public void setProjectVersion(String projectVersion) {
        this.projectVersion = projectVersion;
    }

    /**
     * <p>Gets the project name.</p>
     *
     * @return a <code>String</code> providing the project name.
     */
    public String getProjectName() {
        return this.projectName;
    }

    /**
     * <p>Sets the project name.</p>
     *
     * @param projectName a <code>String</code> providing the project name.
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * <p>Gets the catalog set for this project.</p>
     *
     * @return a <code>Catalog</code> providing the catalog set for this project.
     */
    public Catalog getCatalog() {
        return this.catalog;
    }

    /**
     * <p>Sets the catalog set for this project.</p>
     *
     * @param catalog a <code>Catalog</code> providing the catalog set for this project.
     */
    public void setCatalog(Catalog catalog) {
        this.catalog = catalog;
    }

    /**
     * <p>Gets the ID for the project.</p>
     *
     * @return a <code>long</code> providing the ID for the project.
     */
    public long getProjectId() {
        return this.projectId;
    }

    /**
     * <p>Sets the ID for the project.</p>
     *
     * @param projectId a <code>long</code> providing the ID for the project.
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>Gets the details for the component associated with this project.</p>
     *
     * @return a <code>Component</code> providing the details for the component associated with this project.
     */
    public Component getComponent() {
        return this.component;
    }

    /**
     * <p>Sets the details for the component associated with this project.</p>
     *
     * @param component a <code>Component</code> providing the details for the component associated with this project.
     */
    public void setComponent(Component component) {
        this.component = component;
    }

    /**
     * <p>Gets the ID of direct project.</p>
     *
     * @return a <code>long</code> providing the ID of direct project.
     */
    public long getTcDirectProjectId() {
        return this.tcDirectProjectId;
    }

    /**
     * <p>Sets the ID of direct project.</p>
     *
     * @param tcDirectProjectId a <code>long</code> providing the ID of direct project.
     */
    public void setTcDirectProjectId(long tcDirectProjectId) {
        this.tcDirectProjectId = tcDirectProjectId;
    }

    /**
     * <p>Gets the flag indicating if CCA required for this project or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating if CCA required for this project or not.
     */
    public boolean getCcaRequired() {
        return this.ccaRequired;
    }

    /**
     * <p>Sets the flag indicating if CCA required for this project or not.</p>
     *
     * @param ccaRequired a <code>boolean</code> providing the flag indicating if CCA required for this project or not.
     */
    public void setCcaRequired(boolean ccaRequired) {
        this.ccaRequired = ccaRequired;
    }

    /**
     * <p>Gets the SVN module for this project.</p>
     *
     * @return a <code>String</code> providing the SVN module for this project.
     */
    public String getSvnModule() {
        return this.svnModule;
    }

    /**
     * <p>Sets the SVN module for this project.</p>
     *
     * @param svnModule a <code>String</code> providing the SVN module for this project.
     */
    public void setSvnModule(String svnModule) {
        this.svnModule = svnModule;
    }

    /**
     * <p>Gets the notes for this project.</p>
     *
     * @return a <code>String</code> providing the notes for this project.
     */
    public String getNotes() {
        return this.notes;
    }

    /**
     * <p>Sets the notes for this project.</p>
     *
     * @param notes a <code>String</code> providing the notes for this project.
     */
    public void setNotes(String notes) {
        this.notes = notes;
    }
    /**
     * <p>Gets the flag indicating if tracking late deliverables is required for this project.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating if tracking late deliverables is required for this
     *         project.
     */
    public boolean getTrackLateDeliverables() {
        return this.trackLateDeliverables;
    }

    /**
     * <p>Sets the flag indicating if tracking late deliverables is required for this project.</p>
     *
     * @param trackLateDeliverables a <code>boolean</code> providing the flag indicating if tracking late deliverables
     *                              is required for this project.
     */
    public void setTrackLateDeliverables(boolean trackLateDeliverables) {
        this.trackLateDeliverables = trackLateDeliverables;
    }

    /**
     * <p>Gets the flag indicating if this project is eligible for member payments.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating if this project is eligible for member payments.
     */
    public boolean getMemberPaymentsEligible() {
        return this.memberPaymentsEligible;
    }

    /**
     * <p>Sets the flag indicating if this project is eligible for member payments.</p>
     *
     * @param memberPaymentsEligible a <code>boolean</code> providing the flag indicating if this project is eligible
     *                               for member payments.
     */
    public void setMemberPaymentsEligible(boolean memberPaymentsEligible) {
        this.memberPaymentsEligible = memberPaymentsEligible;
    }

    /**
     * <p>Gets the flag indicating if sending winner emails is required for this project.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating if sending winner emails is required for this
     *         project.
     */
    public boolean getSendWinnerEmails() {
        return this.sendWinnerEmails;
    }

    /**
     * <p>Sets the flag indicating if sending winner emails is required for this project.</p>
     *
     * @param sendWinnerEmails a <code>boolean</code> providing the flag indicating if sending winner emails is required
     *                         for this project.
     */
    public void setSendWinnerEmails(boolean sendWinnerEmails) {
        this.sendWinnerEmails = sendWinnerEmails;
    }

    /**
     * <p>Gets the flag indicating if post-mortem is required for this project.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating if post-mortem is required for this project.
     */
    public boolean isPostMortemRequired() {
        return this.postMortemRequired;
    }

    /**
     * <p>Sets the flag indicating if post-mortem is required for this project.</p>
     *
     * @param postMortemRequired a <code>boolean</code> providing the flag indicating if post-mortem is required for
     *                           this project.
     */
    public void setPostMortemRequired(boolean postMortemRequired) {
        this.postMortemRequired = postMortemRequired;
    }

    /**
     * <p>Gets the flag indicating if approval is required for this project.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating if approval is required for this project.
     */
    public boolean isApprovalRequired() {
        return this.approvalRequired;
    }

    /**
     * <p>Sets the flag indicating if approval is required for this project.</p>
     *
     * @param approvalRequired a <code>boolean</code> providing the flag indicating if approval is required for this
     *                         project.
     */
    public void setApprovalRequired(boolean approvalRequired) {
        this.approvalRequired = approvalRequired;
    }

    /**
     * <p>Gets the Id of a billing account associated with this project.</p>
     *
     * @return a <code>Long</code> providing the Id of a billing account associated with this project.
     */
    public Long getBillingProjectId() {
        return this.billingProjectId;
    }

    /**
     * <p>Sets the Id of a billing account associated with this project.</p>
     *
     * @param billingProjectId a <code>Long</code> providing the Id of a billing account associated with this project.
     */
    public void setBillingProjectId(Long billingProjectId) {
        this.billingProjectId = billingProjectId;
    }

    /**
     * <p>Gets the confidentiality type for this project.</p>
     *
     * @return a <code>String</code> providing the confidentiality type for this project.
     */
    public String getConfidentialityType() {
        return this.confidentialityType;
    }

    /**
     * <p>Sets the confidentiality type for this project.</p>
     *
     * @param confidentialityType a <code>String</code> providing the confidentiality type for this project.
     */
    public void setConfidentialityType(String confidentialityType) {
        this.confidentialityType = confidentialityType;
    }

    /**
     * <p>Gets the cost lever for this project.</p>
     *
     * @return a <code>String</code> providing the cost lever for this project.
     */
    public String getCostLevel() {
        return this.costLevel;
    }

    /**
     * <p>Sets the cost lever for this project.</p>
     *
     * @param costLevel a <code>String</code> providing the cost lever for this project.
     */
    public void setCostLevel(String costLevel) {
        this.costLevel = costLevel;
    }

    /**
     * <p>Gets the milestone bonus cost for this project.</p>
     *
     * @return a <code>Double</code> providing the milestone bonus cost for this project.
     */
    public Double getMilestoneBonusCost() {
        return this.milestoneBonusCost;
    }

    /**
     * <p>Sets the milestone bonus cost for this project.</p>
     *
     * @param milestoneBonusCost a <code>Double</code> providing the milestone bonus cost for this project.
     */
    public void setMilestoneBonusCost(Double milestoneBonusCost) {
        this.milestoneBonusCost = milestoneBonusCost;
    }

    /**
     * <p>Gets the flag indicating whether this project affects reliability ratings or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this project affects reliability ratings or
     *         not.
     */
    public boolean isReliabilityBonusEligible() {
        return this.reliabilityBonusEligible;
    }

    /**
     * <p>Sets the flag indicating whether this project affects reliability ratings or not.</p>
     *
     * @param reliabilityBonusEligible a <code>boolean</code> providing the flag indicating whether this project affects
     *                                 reliability ratings or not.
     */
    public void setReliabilityBonusEligible(boolean reliabilityBonusEligible) {
        this.reliabilityBonusEligible = reliabilityBonusEligible;
    }

    /**
     * <p>Gets the reliability bonus cost for this project.</p>
     *
     * @return a <code>Double</code> providing the reliability bonus cost for this project.
     */
    public Double getReliabilityBonusCost() {
        return this.reliabilityBonusCost;
    }

    /**
     * <p>Sets the reliability bonus cost for this project.</p>
     *
     * @param reliabilityBonusCost a <code>Double</code> providing the reliability bonus cost for this project.
     */
    public void setReliabilityBonusCost(Double reliabilityBonusCost) {
        this.reliabilityBonusCost = reliabilityBonusCost;
    }

    /**
     * <p>Gets the second place cost for this project.</p>
     *
     * @return a <code>Double</code> providing the second place cost for this project.
     */
    public Double getSecondPlaceCost() {
        return this.secondPlaceCost;
    }

    /**
     * <p>Sets the second place cost for this project.</p>
     *
     * @param secondPlaceCost a <code>Double</code> providing the second place cost for this project.
     */
    public void setSecondPlaceCost(Double secondPlaceCost) {
        this.secondPlaceCost = secondPlaceCost;
    }

    /**
     * <p>Gets the first place cost for this project.</p>
     *
     * @return a <code>Double</code> providing the first place cost for this project.
     */
    public Double getFirstPlaceCost() {
        return this.firstPlaceCost;
    }

    /**
     * <p>Sets the first place cost for this project.</p>
     *
     * @param firstPlaceCost a <code>Double</code> providing the first place cost for this project.
     */
    public void setFirstPlaceCost(Double firstPlaceCost) {
        this.firstPlaceCost = firstPlaceCost;
    }

    /**
     * <p>Gets the specification review cost for this project.</p>
     *
     * @return a <code>Double</code> providing the specification review cost for this project.
     */
    public Double getSpecReviewCost() {
        return this.specReviewCost;
    }

    /**
     * <p>Sets the specification review cost for this project.</p>
     *
     * @param specReviewCost a <code>Double</code> providing the specification review cost for this project.
     */
    public void setSpecReviewCost(Double specReviewCost) {
        this.specReviewCost = specReviewCost;
    }

    /**
     * <p>Gets the review cost for this project.</p>
     *
     * @return a <code>Double</code> providing the review cost for this project.
     */
    public Double getReviewCost() {
        return this.reviewCost;
    }

    /**
     * <p>Sets the review cost for this project.</p>
     *
     * @param reviewCost a <code>Double</code> providing the review cost for this project.
     */
    public void setReviewCost(Double reviewCost) {
        this.reviewCost = reviewCost;
    }

    /**
     * <p>Gets the admin fee for this project.</p>
     *
     * @return a <code>Double</code> providing the admin fee for this project.
     */
    public Double getAdminFee() {
        return this.adminFee;
    }

    /**
     * <p>Sets the admin fee for this project.</p>
     *
     * @param adminFee a <code>Double</code> providing the admin fee for this project.
     */
    public void setAdminFee(Double adminFee) {
        this.adminFee = adminFee;
    }

    /**
     * <p>Gets the project spec.</p>
     *
     * @return a <code>ProjectSpec</code> providing the project spec.
     */
    public ProjectSpec getProjectSpec() {
        return this.projectSpec;
    }

    /**
     * <p>Sets the project spec.</p>
     *
     * @param projectSpec a <code>ProjectSpec</code> providing the project spec.
     */
    public void setProjectSpec(ProjectSpec projectSpec) {
        this.projectSpec = projectSpec;
    }

    /**
     * <p>Gets the flag indicating whether the phase dependencies are editable for project or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the phase dependencies are editable for
     *         project or not.
     */
    public boolean getPhaseDependenciesEditable() {
        return this.phaseDependenciesEditable;
    }

    /**
     * <p>Sets the flag indicating whether the phase dependencies are editable for project or not.</p>
     *
     * @param phaseDependenciesEditable a <code>boolean</code> providing the flag indicating whether the phase
     *                                  dependencies are editable for project or not.
     */
    public void setPhaseDependenciesEditable(boolean phaseDependenciesEditable) {
        this.phaseDependenciesEditable = phaseDependenciesEditable;
    }

    /**
     * <p>Gets the details for contest sale for this project.</p>
     *
     * @return a <code>ContestSale</code> providing the details for contest sale for this project.
     */
    public ContestSale getContestSale() {
        return this.contestSale;
    }

    /**
     * <p>Sets the details for contest sale for this project.</p>
     *
     * @param contestSale a <code>ContestSale</code> providing the details for contest sale for this project.
     */
    public void setContestSale(ContestSale contestSale) {
        this.contestSale = contestSale;
    }

    /**
     * <p>Gets the ID of runner-up user..</p>
     *
     * @return a <code>Long</code> providing the ID of runner-up user..
     */
    public Long getRunnerUpUserId() {
        return this.runnerUpUserId;
    }

    /**
     * <p>Sets the ID of runner-up user..</p>
     *
     * @param runnerUpUserId a <code>Long</code> providing the ID of runner-up user..
     */
    public void setRunnerUpUserId(Long runnerUpUserId) {
        this.runnerUpUserId = runnerUpUserId;
    }

    /**
     * <p>Gets the ID of a winning user.</p>
     *
     * @return a <code>Long</code> providing the ID of a winning user.
     */
    public Long getWinnerUserId() {
        return this.winnerUserId;
    }

    /**
     * <p>Sets the ID of a winning user.</p>
     *
     * @param winnerUserId a <code>Long</code> providing the ID of a winning user.
     */
    public void setWinnerUserId(Long winnerUserId) {
        this.winnerUserId = winnerUserId;
    }
}
