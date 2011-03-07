/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.generator.project;

import com.cronos.onlinereview.test.data.User;
import com.cronos.onlinereview.test.data.corporateoltp.TcDirectProject;
import com.cronos.onlinereview.test.data.generator.IdGenerator;
import com.cronos.onlinereview.test.data.tcscatalog.Catalog;
import com.cronos.onlinereview.test.data.tcscatalog.CommentType;
import com.cronos.onlinereview.test.data.tcscatalog.Component;
import com.cronos.onlinereview.test.data.tcscatalog.ComponentVersion;
import com.cronos.onlinereview.test.data.tcscatalog.ContestSale;
import com.cronos.onlinereview.test.data.tcscatalog.CostLevel;
import com.cronos.onlinereview.test.data.tcscatalog.Phase;
import com.cronos.onlinereview.test.data.tcscatalog.PhaseCriteriaType;
import com.cronos.onlinereview.test.data.tcscatalog.PhaseStatus;
import com.cronos.onlinereview.test.data.tcscatalog.PhaseType;
import com.cronos.onlinereview.test.data.tcscatalog.Project;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectCategory;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectInfoType;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectSpec;
import com.cronos.onlinereview.test.data.tcscatalog.ProjectStatus;
import com.cronos.onlinereview.test.data.tcscatalog.Resource;
import com.cronos.onlinereview.test.data.tcscatalog.ResourceRole;
import com.cronos.onlinereview.test.data.tcscatalog.Review;
import com.cronos.onlinereview.test.data.tcscatalog.ReviewComment;
import com.cronos.onlinereview.test.data.tcscatalog.ReviewItem;
import com.cronos.onlinereview.test.data.tcscatalog.ReviewItemComment;
import com.cronos.onlinereview.test.data.tcscatalog.SaleStatus;
import com.cronos.onlinereview.test.data.tcscatalog.SaleType;
import com.cronos.onlinereview.test.data.tcscatalog.Scorecard;
import com.cronos.onlinereview.test.data.tcscatalog.ScreeningStatus;
import com.cronos.onlinereview.test.data.tcscatalog.ScreeningTask;
import com.cronos.onlinereview.test.data.tcscatalog.Submission;
import com.cronos.onlinereview.test.data.tcscatalog.SubmissionStatus;
import com.cronos.onlinereview.test.data.tcscatalog.SubmissionType;
import com.cronos.onlinereview.test.data.tcscatalog.TechnologyType;
import com.cronos.onlinereview.test.data.tcscatalog.Upload;
import com.cronos.onlinereview.test.data.tcscatalog.UploadStatus;
import com.cronos.onlinereview.test.data.tcscatalog.UploadType;
import com.cronos.onlinereview.test.data.timeoltp.BillingProject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * <p>Generator for single project data.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ProjectDataGenerator {

    /**
     * <p>A <code>Random</code> to be used for generating random numbers.</p>
     */
    private final Random random = new Random();

    /**
     * <p>A <code>ProjectGeneratorConfig</code> providing the parameters to be used for generating the test data for 
     * project.</p>
     */
    private final ProjectGeneratorConfig config;

    /**
     * <p>Constructs new <code>ProjectDataGenerator</code> instance with specified configuration for single project to
     * be generated.</p>
     * 
     * @param config a <code>ProjectGeneratorConfig</code> providing the parameters to be used for generating the test
     *        data for project.
     */
    public ProjectDataGenerator(ProjectGeneratorConfig config) {
        this.config = config;
    }

    /**
     * <p>Generates a single project based on configuration data passed at construction.</p>
     * 
     * @return a <code>Project</code> providing the data for generated project. 
     */
    public Project generateProject() {
        long projectId = this.config.getProjectIdGenerator().getNextId();
        TcDirectProject tcDirectProject = this.config.getTcDirectProject();
        ProjectCategory projectCategory = this.config.getProjectCategory();
        ProjectStatus projectStatus = this.config.getProjectStatus();
        Catalog catalog = this.config.getCatalog();
        
        // Basic project data
        Project project = new Project();
        project.setProjectId(projectId);
        if (tcDirectProject != null) {
            project.setTcDirectProjectId(tcDirectProject.getTcDirectProjectId());
        }
        project.setCatalog(catalog);
        project.setProjectCategory(projectCategory);
        project.setProjectStatus(projectStatus);
        if (tcDirectProject != null) {
            project.setProjectName(tcDirectProject.getName() + " " + projectCategory.getName() + " Contest "
                                   + this.config.getProjectCountGenerator().getNextId());
        } else {
            project.setProjectName(projectCategory.getName() + " Contest " 
                                   + this.config.getProjectCountGenerator().getNextId());
        }
        project.setProjectVersion("1.0");
        project.setSvnModule("");
        project.setNotes("");
        
        // Project info flag properties 
        ProjectInfoType[] flagsToBeSet = this.config.getFlagsToBeSet();
        for (int i = 0; i < flagsToBeSet.length; i++) {
            ProjectInfoType projectInfoType = flagsToBeSet[i];
            if (ProjectInfoType.CONFIDENTIALITY_TYPE == projectInfoType) {
                project.setConfidentialityType(projectInfoType.getTrueValue());
                project.setCcaRequired(true);
            } else if (ProjectInfoType.RATED == projectInfoType) {
                project.setRated(true);
            } else if (ProjectInfoType.PUBLIC == projectInfoType) {
                project.setVisible(true);
            } else if (ProjectInfoType.AUTOPILOT_OPTION == projectInfoType) {
                project.setAutoPilotOption(true);
            } else if (ProjectInfoType.TIMELINE_NOTIFICATION == projectInfoType) {
                project.setTimelineNotificationOption(true);
            } else if (ProjectInfoType.STATUS_NOTIFICATION == projectInfoType) {
                project.setStatusNotificationOption(true);
            } else if (ProjectInfoType.DIGITAL_RUN_FLAG == projectInfoType) {
                project.setDigitalRunEnabled(true);
            } else if (ProjectInfoType.PHASE_DEPENDENCIES_EDITABLE == projectInfoType) {
                project.setPhaseDependenciesEditable(true);
            } else if (ProjectInfoType.RELIABILITY_BONUS_ELIGIBLE == projectInfoType) {
                project.setReliabilityBonusEligible(true);
            } else if (ProjectInfoType.APPROVAL_REQUIRED == projectInfoType) {
                project.setApprovalRequired(true);
            } else if (ProjectInfoType.POST_MORTEM_REQUIRED == projectInfoType) {
                project.setPostMortemRequired(true);
            } else if (ProjectInfoType.SEND_WINNER_EMAILS == projectInfoType) {
                project.setSendWinnerEmails(true);
            } else if (ProjectInfoType.MEMBER_PAYMENTS_ELIGIBLE == projectInfoType) {
                project.setMemberPaymentsEligible(true);
            } else if (ProjectInfoType.TRACK_LATE_DELIVERABLES == projectInfoType) {
                project.setTrackLateDeliverables(true);
            }
        }
        ProjectInfoType[] flagsToBeUnSet = this.config.getFlagsToBeUnSet();
        for (int i = 0; i < flagsToBeUnSet.length; i++) {
            ProjectInfoType projectInfoType = flagsToBeUnSet[i];
            if (ProjectInfoType.CONFIDENTIALITY_TYPE == projectInfoType) {
                project.setConfidentialityType(projectInfoType.getFalseValue());
                project.setCcaRequired(false);
            } else if (ProjectInfoType.RATED == projectInfoType) {
                project.setRated(false);
            } else if (ProjectInfoType.PUBLIC == projectInfoType) {
                project.setVisible(false);
            } else if (ProjectInfoType.AUTOPILOT_OPTION == projectInfoType) {
                project.setAutoPilotOption(false);
            } else if (ProjectInfoType.TIMELINE_NOTIFICATION == projectInfoType) {
                project.setTimelineNotificationOption(false);
            } else if (ProjectInfoType.STATUS_NOTIFICATION == projectInfoType) {
                project.setStatusNotificationOption(false);
            } else if (ProjectInfoType.DIGITAL_RUN_FLAG == projectInfoType) {
                project.setDigitalRunEnabled(false);
            } else if (ProjectInfoType.PHASE_DEPENDENCIES_EDITABLE == projectInfoType) {
                project.setPhaseDependenciesEditable(false);
            } else if (ProjectInfoType.RELIABILITY_BONUS_ELIGIBLE == projectInfoType) {
                project.setReliabilityBonusEligible(false);
            } else if (ProjectInfoType.APPROVAL_REQUIRED == projectInfoType) {
                project.setApprovalRequired(false);
            } else if (ProjectInfoType.POST_MORTEM_REQUIRED == projectInfoType) {
                project.setPostMortemRequired(false);
            } else if (ProjectInfoType.SEND_WINNER_EMAILS == projectInfoType) {
                project.setSendWinnerEmails(false);
            } else if (ProjectInfoType.MEMBER_PAYMENTS_ELIGIBLE == projectInfoType) {
                project.setMemberPaymentsEligible(false);
            } else if (ProjectInfoType.TRACK_LATE_DELIVERABLES == projectInfoType) {
                project.setTrackLateDeliverables(false);
            }
        }

        // Billing account
        BillingProject billingProject = this.config.getBillingProject();
        if (billingProject != null) {
            project.setBillingProjectId(billingProject.getBillingProjectId());
        }

        // Cost
        CostLevel costLevel = this.config.getCostLevel();
        if (costLevel != null) {
            project.setCostLevel(costLevel.getCode());
            project.setAdminFee(costLevel.getAdminFee());
            project.setReviewCost(costLevel.getReviewCost());
            project.setSpecReviewCost(costLevel.getSpecReviewFee());
            project.setFirstPlaceCost(costLevel.getFirstPlaceCost());
            project.setSecondPlaceCost(costLevel.getSecondPlaceCost());
            if (project.isReliabilityBonusEligible()) {
                project.setReliabilityBonusCost(costLevel.getReliabilityBonus());
            }
            if (project.isDigitalRunEnabled()) {
                project.setDigitalRunPoints(costLevel.getDigitalRunPoints());
            }
            project.setMilestoneBonusCost(0D);
            project.setPrice(costLevel.getFirstPlaceCost());

            // Contest sale
            if ((projectStatus != ProjectStatus.DELETED) && (projectStatus != ProjectStatus.INACTIVE)) {
                double salePrice = project.getAdminFee() + project.getFirstPlaceCost() + project.getSecondPlaceCost() 
                                     + project.getReviewCost() + project.getSpecReviewCost() 
                                     + project.getMilestoneBonusCost();
                if (project.isReliabilityBonusEligible()) {
                    salePrice += project.getReliabilityBonusCost();
                }
                if (project.isDigitalRunEnabled()) {
                    salePrice += project.getDigitalRunPoints();
                }
                
                ContestSale contestSale = new ContestSale();
                contestSale.setPrice(salePrice);
                contestSale.setStatus(SaleStatus.PAID);
                contestSale.setType(SaleType.TC_PURCHASE_ORDER);
                contestSale.setContestId(projectId);
                contestSale.setContestSaleId(this.config.getContestSaleIdGenerator().getNextId());
                contestSale.setPaypalOrderId(billingProject.getPoBoxNumber());
                contestSale.setSaleReferenceId(billingProject.getPoBoxNumber());
                
                project.setContestSale(contestSale);
            }
        }

        // Forum ID
        Long forumId = this.config.getForumId();
        if (forumId != null) {
            project.setForumId(forumId);
        }

        // Project specification
        ProjectSpec projectSpec = new ProjectSpec();
        projectSpec.setProjectSpecId(this.config.getProjectSpecIdGenerator().getNextId());
        projectSpec.setProjectId(projectId);
        projectSpec.setVersion(1);
        projectSpec.setDetailedRequirements("Detailed requirements for " + project.getProjectName());
        projectSpec.setSubmissionDeliverables("");
        projectSpec.setEnvironmentSetupInstructions("");
        projectSpec.setFinalSubmissionGuidelines("Final submission guidelines for " + project.getProjectName());
        projectSpec.setPrivateDescription("");
        project.setProjectSpec(projectSpec);
                        
        // Component version
        List<ComponentVersion> componentVersions = new ArrayList<ComponentVersion>();
        ComponentVersion version = new ComponentVersion();
        version.setComments("Comments for version #1");
        version.setPhaseId(projectCategory.getProjectCategoryId() + 111);
        version.setPrice(project.getPrice());
        version.setSuspended(false);
        version.setVersionId(this.config.getComponentVersionIdGenerator().getNextId());
        version.setVersionNumber(1);
        version.setVersionText("1.0");
        componentVersions.add(version);
        
        // Technologies
        TechnologyType[] allTechnologyTypes = TechnologyType.values();
        if (projectCategory.getTechnologyRequired()) {
            int technologiesCount = getRandomInt(1, 5);
            List<TechnologyType> technologyTypes = getRandomItems(allTechnologyTypes, technologiesCount); 
            version.setTechnologies(technologyTypes.toArray(new TechnologyType[technologyTypes.size()]));
        }

        // Component
        Component component = new Component();
        component.setComponentId(this.config.getComponentIdGenerator().getNextId());
        component.setComponentName(project.getProjectName());
        component.setCurrentVersionId(version.getVersionNumber());
        component.setDescription("Description for " + component.getComponentName());
        component.setFunctionalDesc("Functional description for " + component.getComponentName());
        component.setRootCategoryId(catalog.getRootCategoryId());
        component.setShortDesc("Short description for " + component.getComponentName());
        if (projectStatus == ProjectStatus.DELETED) {
            component.setStatusId(0);
        } else {
            component.setStatusId(1);
        }
        component.setVersions(componentVersions);
        component.setVisible(project.isVisible());
        project.setComponent(component);
        
        // Project phases
        PhaseType currentOpenPhaseType = this.config.getCurrentPhaseType();
        IdGenerator phaseIdGenerator = this.config.getPhaseIdGenerator();
        List<Phase> phases = new ArrayList<Phase>();
        
        Phase specSubmissionPhase = null;
        if (projectCategory.getSpecReviewRespId() > 0) {
            specSubmissionPhase = createPhase(project, PhaseType.SPECIFICATION_SUBMISSION, currentOpenPhaseType,
                                              phases, phaseIdGenerator.getNextId(), 24);
        }

        Phase specReviewPhase = null;
        if ((projectCategory.getSpecReviewRespId() > 0)) {
            specReviewPhase = createPhase(project, PhaseType.SPECIFICATION_REVIEW, currentOpenPhaseType, phases,
                                          phaseIdGenerator.getNextId(), 24);
        }

        Phase registrationPhase = createPhase(project, PhaseType.REGISTRATION, currentOpenPhaseType, phases,
                                              phaseIdGenerator.getNextId(), 48);
        registrationPhase.setFixedStartTimeOffset(registrationPhase.getScheduledStartTimeOffset());
        
        Phase submissionPhase = createPhase(project, PhaseType.SUBMISSION, currentOpenPhaseType, phases,
                                            phaseIdGenerator.getNextId(), 120);
        Phase screeningPhase = createPhase(project, PhaseType.SCREENING, currentOpenPhaseType, phases,
                                           phaseIdGenerator.getNextId(), 24);
        Phase reviewPhase = createPhase(project, PhaseType.REVIEW, currentOpenPhaseType, phases,
                                        phaseIdGenerator.getNextId(), 48);
        Phase appealsPhase = createPhase(project, PhaseType.APPEALS, currentOpenPhaseType, phases,
                                         phaseIdGenerator.getNextId(), 24);
        Phase appealsResponsePhase = createPhase(project, PhaseType.APPEALS_RESPONSE, currentOpenPhaseType,
                                                 phases, phaseIdGenerator.getNextId(), 12);
        Phase aggregationPhase = createPhase(project, PhaseType.AGGREGATION, currentOpenPhaseType, phases,
                                             phaseIdGenerator.getNextId(), 12);
        Phase aggregationReviewPhase = createPhase(project, PhaseType.AGGREGATION_REVIEW, currentOpenPhaseType,
                                                   phases, phaseIdGenerator.getNextId(), 6);
        Phase finalFixPhase = createPhase(project, PhaseType.FINAL_FIX, currentOpenPhaseType, phases,
                                          phaseIdGenerator.getNextId(), 24);
        Phase finalReviewPhase = createPhase(project, PhaseType.FINAL_REVIEW, currentOpenPhaseType, phases,
                                             phaseIdGenerator.getNextId(), 24);
        Phase approvalPhase = createPhase(project, PhaseType.APPROVAL, currentOpenPhaseType, phases,
                                          phaseIdGenerator.getNextId(), 120);
        project.setPhases(phases.toArray(new Phase[phases.size()]));

        // Project resources
        List<Resource> resources = new ArrayList<Resource>();
        project.setResources(resources);
        IdGenerator resourceIdGenerator = this.config.getResourceIdGenerator();

        // Managers
        User[] managerUsers = this.config.getManagers();
        if (managerUsers != null) {
            for (int i = 0; i < managerUsers.length; i++) {
                User manager = managerUsers[i];
                createResource(manager, ResourceRole.MANAGER, resourceIdGenerator.getNextId(), null, resources);
            }
        }
        
        // Specification Submitters
        List<Resource> specificationSubmitters = new ArrayList<Resource>();
        if ((specSubmissionPhase != null) && !(specSubmissionPhase.isScheduled())) {
            User[] specificationSubmitterUsers = this.config.getSpecificationSubmitters();
            if (specificationSubmitterUsers != null) {
                for (int i = 0; i < specificationSubmitterUsers.length; i++) {
                    User specificationSubmitterUser = specificationSubmitterUsers[i];
                    Resource specSubmitter = createResource(specificationSubmitterUser, 
                                                            ResourceRole.SPECIFICATION_SUBMITTER, 
                                                            resourceIdGenerator.getNextId(), null, resources);
                    specificationSubmitters.add(specSubmitter);
                    if (specSubmissionPhase.isOpen() || specSubmissionPhase.isClosed()) {
                        Upload upload = new Upload();
                        upload.setUploadId(this.config.getUploadIdGenerator().getNextId());
                        upload.setProjectId(projectId);
                        upload.setResourceId(specSubmitter.getResourceId());
                        upload.setStatus(UploadStatus.ACTIVE);
                        upload.setType(UploadType.SUBMISSION);
                        upload.setParameter(projectId + "_" + specSubmitter.getResourceId() + "_" + upload.getUploadId()
                                            + ".zip");
                        upload.setCreationTimestamp(specSubmitter.getRegistrationDate());
                        
                        Submission specSubmission = new Submission();
                        specSubmission.setSubmissionId(this.config.getSubmissionIdGenerator().getNextId());
                        specSubmission.setStatus(SubmissionStatus.ACTIVE);
                        specSubmission.setType(SubmissionType.SPECIFICATION_SUBMISSION);
                        specSubmission.setUpload(upload);

                        specSubmitter.setSubmissions(new Submission[] {specSubmission});
                    }
                }
            }

            // Specification Reviewer
            User specificationReviewerUser = this.config.getSpecificationReviewer();
            if (specificationReviewerUser != null) {
                Resource specReviewer = createResource(specificationReviewerUser,
                                                       ResourceRole.SPECIFICATION_REVIEWER,
                                                       resourceIdGenerator.getNextId(), specReviewPhase, resources);
                String[] sql = new String[1];
                sql[0] = "INSERT INTO rboard_application (user_id, project_id, phase_id, review_resp_id, primary_ind, " 
                         + "create_date, modify_date) VALUES (" + specificationReviewerUser.getUserId() + ", " 
                         + projectId + ", " + (1000 + 111 + projectCategory.getProjectCategoryId()) + ", " 
                         + projectCategory.getSpecReviewRespId() + ", 0, CURRENT, CURRENT);";
                specReviewer.setSql(sql);
                
                if (specReviewPhase.isOpen() || specReviewPhase.isClosed()) {
                    List<Review> specificationReviews = new ArrayList<Review>();
                    for (Resource specificationSubmitter : specificationSubmitters) {
                        Submission[] specificationSubmissions = specificationSubmitter.getSubmissions();
                        if (specificationSubmissions != null) {
                            for (Submission specificationSubmission : specificationSubmissions) {
                                int score = getRandomInt(3, 4);
                                Review specReview = new Review();
                                specReview.setReviewId(this.config.getReviewIdGenerator().getNextId());
                                specReview.setResourceId(specReviewer.getResourceId());
                                specReview.setSubmissionId(specificationSubmission.getSubmissionId());
                                specReview.setScorecardId(specReviewPhase.getReviewScorecard().getScorecardId());
                                specReview.setCommitted(specReviewPhase.isClosed());
                                if (specReviewPhase.isClosed()) {
                                    specReview.setInitialScore(score / 4D * 100);
                                    specReview.setScore(specReview.getInitialScore());
                                }
                                specificationReviews.add(specReview);

                                ReviewComment reviewComment = new ReviewComment();
                                reviewComment.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
                                reviewComment.setReviewId(specReview.getReviewId());
                                reviewComment.setResourceId(specReviewer.getResourceId());
                                reviewComment.setContent("");
                                reviewComment.setExtraInfo("Approved");
                                reviewComment.setType(CommentType.SPECIFICATION_REVIEW_COMMENT);
                                reviewComment.setSortOrder(0);
                                specReview.setComments(new ReviewComment[] {reviewComment});

                                ReviewItem reviewItem = new ReviewItem();
                                reviewItem.setReviewItemId(this.config.getReviewItemIdGenerator().getNextId());
                                reviewItem.setReviewId(specReview.getReviewId());
                                reviewItem.setAnswer(score + "/4");
                                reviewItem.setScorecardQuestionId(
                                    specReviewPhase.getReviewScorecard().getScorecardQuestionId());
                                reviewItem.setSortOrder(0);
                                specReview.setItems(new ReviewItem[] {reviewItem});
                                
                                ReviewItemComment reviewItemComment = new ReviewItemComment();
                                reviewItemComment.setReviewItemCommentId(
                                    this.config.getReviewItemCommentIdGenerator().getNextId());
                                reviewItemComment.setResourceId(specReviewer.getResourceId());
                                reviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                                reviewItemComment.setType(CommentType.COMMENT);
                                reviewItemComment.setContent("Ok");
                                reviewItemComment.setSortOrder(0);
                                reviewItem.setComments(new ReviewItemComment[] {reviewItemComment});
                            }
                        }
                    }
                    specReviewer.setReviews(specificationReviews.toArray(new Review[specificationReviews.size()]));
                }
            }
        }

        // Submitters
        List<Resource> contestSubmitters = new ArrayList<Resource>();
        User[] submitterUsers = this.config.getSubmitters();
        if ((submitterUsers != null) && !(registrationPhase.isScheduled()) 
            && (projectStatus != ProjectStatus.CANCELLED_ZERO_REGISTRATIONS)) {
            for (int i = 0; i < submitterUsers.length; i++) {
                User submitterUser = submitterUsers[i];
                Resource submitter = createResource(submitterUser, ResourceRole.SUBMITTER, 
                                                   resourceIdGenerator.getNextId(), null, resources);
                boolean isReliabilityAvailable = getRandomInt(0, 1) == 1;
                if (isReliabilityAvailable) {
                    submitter.setReliability(getRandomInt(0, 100));
                }
                if (projectCategory.getRated()) {
                    if (submitter.getReliability() != null) {
                        submitter.setRating(getRandomInt(100, 3000));
                    }
                }
                submitter.setAppealsCompletedEarly(false);
                
                List<String> sql = new ArrayList<String>();
                sql.add("INSERT INTO component_inquiry (component_inquiry_id, component_id, user_id, comment, " +
                        "agreed_to_terms, rating, phase, tc_user_id, version, create_time, project_id) " +
                        "VALUES (" + this.config.getCompInquiryIdGenerator().getNextId() + ", " + version.getVersionId() 
                        + ", " + submitterUser.getUserId() + ", null, 1, " 
                        + (submitter.getRating() == null ? 0 : submitter.getRating()) + ", " 
                        + (projectCategory.getProjectCategoryId() + 111) + ", " + submitterUser.getUserId() + ", 0, "
                        + "CURRENT, " + projectId + ");");
                sql.add("INSERT INTO project_result (user_id, project_id, old_rating, new_rating, raw_score, " +
                        "final_score, payment, placed, rating_ind, valid_submission_ind, create_date, modify_date, " +
                        "passed_review_ind, point_adjustment, rating_order) " +
                        "VALUES (" + submitterUser.getUserId() + ", " + projectId + ", " + submitter.getRating() 
                        + ", null, null, null, null, null, 0, 0, CURRENT, CURRENT, null, null, null);");
                sql.add("UPDATE user_rating SET rating = " + (submitter.getRating() == null ? 0 : submitter.getRating()) 
                        + " WHERE user_id = " + submitterUser.getUserId() + " AND phase_id = " 
                        + (projectCategory.getProjectCategoryId() + 111) + ";");
                submitter.setSql(sql.toArray(new String[sql.size()]));
                contestSubmitters.add(submitter);
                
                // Submitter submissions
                if ((submissionPhase.isOpen() || submissionPhase.isClosed()) 
                    && (projectStatus != ProjectStatus.CANCELLED_ZERO_SUBMISSIONS)) {
                    Upload upload = new Upload();
                    upload.setUploadId(this.config.getUploadIdGenerator().getNextId());
                    upload.setProjectId(projectId);
                    upload.setResourceId(submitter.getResourceId());
                    upload.setStatus(UploadStatus.ACTIVE);
                    upload.setType(UploadType.SUBMISSION);
                    upload.setParameter(projectId + "_" + submitter.getResourceId() + "_" + upload.getUploadId()
                                        + ".zip");
                    upload.setCreationTimestamp(submitter.getRegistrationDate());

                    ScreeningTask screeningTask = new ScreeningTask();
                    screeningTask.setScreeningTaskId(this.config.getScreeningTaskIdGenerator().getNextId());
                    screeningTask.setStatus(ScreeningStatus.PENDING);
                    screeningTask.setUploadId(upload.getUploadId());

                    Submission contestSubmission = new Submission();
                    contestSubmission.setSubmissionId(this.config.getSubmissionIdGenerator().getNextId());
                    contestSubmission.setStatus(SubmissionStatus.ACTIVE);
                    contestSubmission.setType(SubmissionType.CONTEST_SUBMISSION);
                    contestSubmission.setUpload(upload);
                    contestSubmission.setScreeningTask(screeningTask);

                    submitter.setSubmissions(new Submission[]{contestSubmission});
                }
            }
        }
        
        List<Resource> allReviewers = new ArrayList<Resource>(); 
        
        // Primary Reviewer - screener, reviewer, aggregator, final reviewer
        long[] reviewRespIds = projectCategory.getReviewRespIds();
        User primaryReviewerUser = this.config.getPrimaryReviewer();
        if ((primaryReviewerUser != null) 
            && (!registrationPhase.isScheduled() || reviewPhase.isOpen() || reviewPhase.isClosed())) {
            
            // Primary Screener
            Resource primaryScreener = createResource(primaryReviewerUser, ResourceRole.PRIMARY_SCREENER, 
                                                      resourceIdGenerator.getNextId(), screeningPhase, resources);
            if (screeningPhase.isOpen() || screeningPhase.isClosed()) {
                List<Review> screeningReviews = new ArrayList<Review>();
                for (Resource contestSubmitter : contestSubmitters) {
                    Submission[] contestSubmissions = contestSubmitter.getSubmissions();
                    if (contestSubmissions != null) {
                        for (Submission contestSubmission : contestSubmissions) {
                            int score;
                            if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                                score = 1;
                            } else {
                                score = getRandomInt(3, 4);
                            }
                            
                            Review screeningReview = new Review();
                            screeningReview.setReviewId(this.config.getReviewIdGenerator().getNextId());
                            screeningReview.setResourceId(primaryScreener.getResourceId());
                            screeningReview.setSubmissionId(contestSubmission.getSubmissionId());
                            screeningReview.setScorecardId(screeningPhase.getReviewScorecard().getScorecardId());
                            screeningReview.setCommitted(screeningPhase.isClosed());
                            if (screeningPhase.isClosed()) {
                                screeningReview.setInitialScore(score / 4D * 100);
                                screeningReview.setScore(screeningReview.getInitialScore());
                                contestSubmission.setScreeningScore(screeningReview.getInitialScore());
                                if (screeningReview.getScore() 
                                    < screeningPhase.getReviewScorecard().getMinScore()) {
                                    contestSubmission.setStatus(SubmissionStatus.FAILED_SCREENING);
                                } else {
                                    addResourceSql(contestSubmitter, 
                                                   "UPDATE project_result SET rating_ind = 1, valid_submission_ind = 1 "
                                                   + "WHERE user_id = " + contestSubmitter.getUser().getUserId()
                                                   + " AND project_id = " + projectId + ";");
                                }
                            }
                            screeningReviews.add(screeningReview);

                            ReviewItem reviewItem = new ReviewItem();
                            reviewItem.setReviewItemId(this.config.getReviewItemIdGenerator().getNextId());
                            reviewItem.setReviewId(screeningReview.getReviewId());
                            reviewItem.setAnswer(score + "/4");
                            reviewItem.setScorecardQuestionId(
                                screeningPhase.getReviewScorecard().getScorecardQuestionId());
                            reviewItem.setSortOrder(0);
                            screeningReview.setItems(new ReviewItem[]{reviewItem});
                                
                            ReviewItemComment reviewItemComment = new ReviewItemComment();
                            reviewItemComment.setReviewItemCommentId(
                                this.config.getReviewItemCommentIdGenerator().getNextId());
                            reviewItemComment.setResourceId(primaryScreener.getResourceId());
                            reviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                            if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                                reviewItemComment.setContent("Misses some deliverables");
                                reviewItemComment.setType(CommentType.REQUIRED);
                            } else {
                                reviewItemComment.setContent("Ok");
                                reviewItemComment.setType(CommentType.COMMENT);
                            }
                            reviewItemComment.setSortOrder(0);
                            reviewItem.setComments(new ReviewItemComment[] {reviewItemComment});
                        }
                    }
                }
                primaryScreener.setReviews(screeningReviews.toArray(new Review[screeningReviews.size()]));
            }

            // Primary Reviewer
            Resource primaryReviewer;
            String[] sql = new String[1];
            if (projectCategory == ProjectCategory.DEVELOPMENT) {
                primaryReviewer = createResource(primaryReviewerUser, ResourceRole.FAILURE_REVIEWER, 
                                                         resourceIdGenerator.getNextId(), reviewPhase, resources);
                sql[0] = "INSERT INTO rboard_application (user_id, project_id, phase_id, review_resp_id, primary_ind, " 
                         + "create_date, modify_date) VALUES (" + primaryReviewerUser.getUserId() + ", " 
                         + projectId + ", " + (111 + projectCategory.getProjectCategoryId()) 
                         + ", " + reviewRespIds[1] + ", 1, CURRENT, CURRENT);";
            } else {
                primaryReviewer = createResource(primaryReviewerUser, ResourceRole.REVIEWER, 
                                                         resourceIdGenerator.getNextId(), reviewPhase, resources);
                sql[0] = "INSERT INTO rboard_application (user_id, project_id, phase_id, review_resp_id, primary_ind, " 
                         + "create_date, modify_date) VALUES (" + primaryReviewerUser.getUserId() + ", " 
                         + projectId + ", " + (111 + projectCategory.getProjectCategoryId()) 
                         + ", " + reviewRespIds[0] + ", 1, CURRENT, CURRENT);";
            }
            primaryReviewer.setSql(sql);
            if (reviewPhase.isOpen() || reviewPhase.isClosed()) {
                generateReviews(projectStatus, reviewPhase, contestSubmitters, primaryReviewer, projectCategory,
                                projectId);
            }
            allReviewers.add(primaryReviewer);
        }

        // Reviewers
        User[] reviewerUsers = this.config.getReviewers();
        if ((reviewerUsers != null) 
            && (!registrationPhase.isScheduled() || !reviewPhase.isScheduled())) {
            for (int i = 0; i < reviewerUsers.length && (i + 1) < reviewRespIds.length; i++) {
                User reviewerUser = reviewerUsers[i];
                Resource reviewer;
                String[] sql = new String[1];
                if (projectCategory == ProjectCategory.DEVELOPMENT) {
                    reviewer = createResource(reviewerUser, ResourceRole.REVIEWER, resourceIdGenerator.getNextId(),
                                              reviewPhase, resources);
                    sql[0] = "INSERT INTO rboard_application (user_id, project_id, phase_id, review_resp_id, "
                             + "primary_ind, create_date, modify_date) VALUES (" + reviewerUser.getUserId() + ", " 
                             + projectId + ", " + (111 + projectCategory.getProjectCategoryId()) 
                             + ", " + reviewRespIds[i == 0 ? 0 : 2] + ", 0, CURRENT, CURRENT);";
                } else {
                    reviewer = createResource(reviewerUser, ResourceRole.REVIEWER, resourceIdGenerator.getNextId(),
                                              reviewPhase, resources);
                    sql[0] = "INSERT INTO rboard_application (user_id, project_id, phase_id, review_resp_id, "
                             + "primary_ind, create_date, modify_date) VALUES (" + reviewerUser.getUserId() + ", " 
                             + projectId + ", " + (111 + projectCategory.getProjectCategoryId()) 
                             + ", " + reviewRespIds[i + 1] + ", 0, CURRENT, CURRENT);";
                }
                reviewer.setSql(sql);
                if (reviewPhase.isOpen() || reviewPhase.isClosed()) {
                    generateReviews(projectStatus, reviewPhase, contestSubmitters, reviewer, projectCategory, projectId);
                }
                allReviewers.add(reviewer);
            }
        }
        
        // Update submission states if reviews were finished and completed
        if (reviewPhase.isClosed()) {
            for (Resource contestSubmitter : contestSubmitters) {
                Submission[] contestSubmissions = contestSubmitter.getSubmissions();
                if (contestSubmissions != null) {
                    for (Submission contestSubmission : contestSubmissions) {
                        double submissionScore = 0;
                        int reviewsCount = 0;
                        for (Resource reviewer : allReviewers) {
                            Review[] reviews = reviewer.getReviews();
                            for (Review review : reviews) {
                                if (review.getSubmissionId() == contestSubmission.getSubmissionId()) {
                                    submissionScore += review.getInitialScore();
                                    reviewsCount++;
                                }
                            }
                        }
                        contestSubmission.setInitialScore(submissionScore / reviewsCount);
                        addResourceSql(contestSubmitter,
                                       "UPDATE project_result SET raw_score = " + contestSubmission.getInitialScore()    
                                       + "WHERE user_id = " + contestSubmitter.getUser().getUserId()
                                       + " AND project_id = " + projectId + ";");
                    }
                }
            }
        }
        
        // Update submission states if appeals were responded, determine winners
        Submission winningSubmission = null;
        Resource winningSubmitter = null;
        
        if (appealsResponsePhase.isClosed()) {
            List<Submission> allPassingSubmissions = new ArrayList<Submission>();
            for (Resource contestSubmitter : contestSubmitters) {
                Submission[] contestSubmissions = contestSubmitter.getSubmissions();
                if (contestSubmissions != null) {
                    for (Submission contestSubmission : contestSubmissions) {
                        double submissionScore = 0;
                        int reviewsCount = 0;
                        for (Resource reviewer : allReviewers) {
                            Review[] reviews = reviewer.getReviews();
                            for (Review review : reviews) {
                                if (review.getSubmissionId() == contestSubmission.getSubmissionId()) {
                                    submissionScore += review.getScore();
                                    reviewsCount++;
                                }
                            }
                        }
                        contestSubmission.setFinalScore(submissionScore / reviewsCount);
                        boolean failedToPassReview 
                            = contestSubmission.getFinalScore() < reviewPhase.getReviewScorecard().getMinScore();
                        addResourceSql(contestSubmitter,
                                       "UPDATE project_result SET final_score = " + contestSubmission.getFinalScore()    
                                       + ", passed_review_ind = " + (failedToPassReview ? 0 : 1) 
                                       + " WHERE user_id = " + contestSubmitter.getUser().getUserId()
                                       + " AND project_id = " + projectId + ";");
                        if (failedToPassReview) {
                            contestSubmission.setStatus(SubmissionStatus.FAILED_REVIEW);
                        } else {
                            allPassingSubmissions.add(contestSubmission);
                        }
                    }
                }
            }
            // Sort submissions to determine placements
            Collections.sort(allPassingSubmissions, new Comparator<Submission>() {
                public int compare(Submission o1, Submission o2) {
                    Double finalScore1 = o1.getFinalScore() == null ? 0 : o1.getFinalScore(); 
                    Double finalScore2 = o2.getFinalScore() == null ? 0 : o2.getFinalScore();
                    return ((!finalScore1.equals(finalScore2))
                            ? finalScore2.compareTo(finalScore1)
                            : o1.getUpload().getCreationTimestamp().compareTo(o2.getUpload().getCreationTimestamp()));
                }
            });
            
            for (int i = 0; i < allPassingSubmissions.size(); i++) {
                int placement = i + 1;
                Submission contestSubmission = allPassingSubmissions.get(i);
                contestSubmission.setPlacement(placement);
                long submitterResourceId = contestSubmission.getUpload().getResourceId();
                for (Resource contestSubmitter : contestSubmitters) {
                    if (contestSubmitter.getResourceId() == submitterResourceId) {
                        if (placement == 1) {
                            winningSubmission = contestSubmission;
                            winningSubmitter = contestSubmitter;
                            
                            contestSubmitter.setPayment(project.getFirstPlaceCost());
                            contestSubmitter.setPaymentStatus("No");
                            project.setWinnerUserId(contestSubmitter.getUser().getUserId());
                            addResourceSql(contestSubmitter,
                                           "UPDATE project_result SET placed = 1, payment = " 
                                           + contestSubmitter.getPayment() 
                                           + " WHERE user_id = " + contestSubmitter.getUser().getUserId()
                                           + " AND project_id = " + projectId + ";");
                        } else if (placement == 2) {
                            contestSubmitter.setPayment(project.getSecondPlaceCost());
                            contestSubmitter.setPaymentStatus("No");
                            project.setRunnerUpUserId(contestSubmitter.getUser().getUserId());
                            addResourceSql(contestSubmitter,
                                           "UPDATE project_result SET placed = 2, payment = " 
                                           + contestSubmitter.getPayment() 
                                           + " WHERE user_id = " + contestSubmitter.getUser().getUserId()
                                           + " AND project_id = " + projectId + ";");
                        } else {
                            addResourceSql(contestSubmitter,
                                           "UPDATE project_result SET placed = " + placement 
                                           + "WHERE user_id = " + contestSubmitter.getUser().getUserId()
                                           + " AND project_id = " + projectId + ";");
                        }
                    }
                }
            }
        }

        // Aggregator
        Resource aggregator = null;
        if (!registrationPhase.isScheduled()) {
            aggregator = createResource(primaryReviewerUser, ResourceRole.AGGREGATOR,
                                                 resourceIdGenerator.getNextId(), aggregationPhase, resources);
        }
        Review aggregation = null;
        if ((aggregator != null) && (winningSubmission != null) 
            && (aggregationPhase.isOpen() || aggregationPhase.isClosed())) {
            aggregation = new Review();
            aggregation.setReviewId(this.config.getReviewIdGenerator().getNextId());
            aggregation.setResourceId(aggregator.getResourceId());
            aggregation.setSubmissionId(winningSubmission.getSubmissionId());
            aggregation.setScorecardId(reviewPhase.getReviewScorecard().getScorecardId());
            aggregation.setCommitted(reviewPhase.isClosed());
            
            // Aggregation Review comments from remaining reviewers and winning submitters
            List<ReviewComment> reviewComments = new ArrayList<ReviewComment>();
            int reviewCommentSortIndex = 0;
            for (Resource reviewer : allReviewers) {
                if (reviewer.getUser().getUserId() != aggregator.getUser().getUserId()) {
                    ReviewComment reviewComment = new ReviewComment();
                    reviewComment.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
                    reviewComment.setReviewId(aggregation.getReviewId());
                    reviewComment.setResourceId(reviewer.getResourceId());
                    reviewComment.setContent("");
                    reviewComment.setType(CommentType.AGGREGATION_REVIEW_COMMENT);
                    reviewComment.setSortOrder(reviewCommentSortIndex++);
                    if (aggregationReviewPhase.isClosed()) {
                        reviewComment.setExtraInfo("Approved");
                    }
                    reviewComments.add(reviewComment);
                }
            }
            ReviewComment submitterAggregationComment = new ReviewComment();
            submitterAggregationComment.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
            submitterAggregationComment.setReviewId(aggregation.getReviewId());
            submitterAggregationComment.setResourceId(winningSubmitter.getResourceId());
            submitterAggregationComment.setContent("");
            submitterAggregationComment.setType(CommentType.SUBMITTER_COMMENT);
            submitterAggregationComment.setSortOrder(reviewCommentSortIndex++);
            if (aggregationReviewPhase.isClosed()) {
                submitterAggregationComment.setExtraInfo("Approved");
            }
            reviewComments.add(submitterAggregationComment);
            
            aggregation.setComments(reviewComments.toArray(new ReviewComment[reviewComments.size()]));
            
            // Review items from review scorecards for winning submission
            List<ReviewItem> reviewItems = new ArrayList<ReviewItem>();
            for (Resource reviewer : allReviewers) {
                Review[] reviews = reviewer.getReviews();
                int reviewItemSortingIndex = 0;
                for (Review review : reviews) {
                    if (review.getSubmissionId() == winningSubmission.getSubmissionId()) {
                        ReviewItem[] originalReviewItems = review.getItems();
                        for (ReviewItem originalReviewItem : originalReviewItems) {
                            ReviewItem reviewItem = new ReviewItem();
                            reviewItem.setReviewItemId(this.config.getReviewItemIdGenerator().getNextId());
                            reviewItem.setReviewId(aggregation.getReviewId());
                            reviewItem.setAnswer(originalReviewItem.getAnswer());
                            reviewItem.setScorecardQuestionId(originalReviewItem.getScorecardQuestionId());
                            reviewItem.setSortOrder(reviewItemSortingIndex++);
                            reviewItems.add(reviewItem);

                            List<ReviewItemComment> reviewItemComments = new ArrayList<ReviewItemComment>();
                            ReviewItemComment[] originalReviewItemComments = originalReviewItem.getComments();
                            for (ReviewItemComment originalReviewItemComment : originalReviewItemComments) {
                                ReviewItemComment reviewItemComment = new ReviewItemComment();
                                reviewItemComment.setReviewItemCommentId(
                                    this.config.getReviewItemCommentIdGenerator().getNextId());
                                reviewItemComment.setResourceId(originalReviewItemComment.getResourceId());
                                reviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                                reviewItemComment.setContent(originalReviewItemComment.getContent());
                                reviewItemComment.setType(originalReviewItemComment.getType());
                                reviewItemComment.setExtraInfo("Accept");
                                reviewItemComment.setSortOrder(0);
                                reviewItemComments.add(reviewItemComment);
                            }
                            
                            // Aggregation comments from Aggregator
                            ReviewItemComment aggregatorReviewItemComment = new ReviewItemComment();
                            aggregatorReviewItemComment.setReviewItemCommentId(
                                this.config.getReviewItemCommentIdGenerator().getNextId());
                            aggregatorReviewItemComment.setResourceId(aggregator.getResourceId());
                            aggregatorReviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                            aggregatorReviewItemComment.setContent("");
                            aggregatorReviewItemComment.setType(CommentType.AGGREATION_COMMENT);
                            aggregatorReviewItemComment.setSortOrder(1);
                            reviewItemComments.add(aggregatorReviewItemComment);

                            reviewItem.setComments(
                                reviewItemComments.toArray(new ReviewItemComment[reviewItemComments.size()]));
                        
                        }
                    }
                }
            }
            
            aggregation.setItems(reviewItems.toArray(new ReviewItem[reviewItems.size()]));
            aggregator.setReviews(new Review[] {aggregation});
        }
        
        // Final Fix
        Upload finalFixUpload = null;
        if (winningSubmitter != null) {
            if ((finalFixPhase.isOpen() || finalFixPhase.isClosed()) 
                && (projectStatus != ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE)) {
                finalFixUpload = new Upload();
                finalFixUpload.setUploadId(this.config.getUploadIdGenerator().getNextId());
                finalFixUpload.setProjectId(projectId);
                finalFixUpload.setResourceId(winningSubmitter.getResourceId());
                finalFixUpload.setType(UploadType.FINAL_FIX);
                finalFixUpload.setStatus(UploadStatus.ACTIVE);
                finalFixUpload.setParameter(projectId + "_" + winningSubmitter.getResourceId() + "_" 
                                            + finalFixUpload.getUploadId() + "_final_fix.zip");
                finalFixUpload.setCreationTimestamp(new Date());
                addResourceUpload(winningSubmitter, finalFixUpload);
            }
        }

        // Final Reviewer
        Resource finalReviewer = null;
        if (!registrationPhase.isScheduled()) {
            finalReviewer = createResource(primaryReviewerUser, ResourceRole.FINAL_REVIEWER,
                                                    resourceIdGenerator.getNextId(), finalReviewPhase, resources);
        }
        if ((finalReviewer != null) && (winningSubmission != null) 
            && (finalFixPhase.isOpen() || finalFixPhase.isClosed())) {
            List<ReviewItemComment> aggregationReviewItemComments = new ArrayList<ReviewItemComment>();
            ReviewItem[] aggregationReviewItems = aggregation.getItems();
            for (ReviewItem aggregationReviewItem : aggregationReviewItems) {
                ReviewItemComment[] comments = aggregationReviewItem.getComments();
                for (ReviewItemComment comment : comments) {
                    if (comment.getType() == CommentType.AGGREATION_COMMENT) {
                        aggregationReviewItemComments.add(comment);
                    }
                }
            }

            Review finalReview = new Review();
            finalReview.setReviewId(this.config.getReviewIdGenerator().getNextId());
            finalReview.setResourceId(finalReviewer.getResourceId());
            finalReview.setSubmissionId(winningSubmission.getSubmissionId());
            finalReview.setScorecardId(reviewPhase.getReviewScorecard().getScorecardId());
            finalReview.setCommitted(finalReviewPhase.isClosed());
            
            // Aggregation Review comments from remaining reviewers and winning submitters
            List<ReviewComment> reviewComments = new ArrayList<ReviewComment>();
            int reviewCommentSortIndex = 0;
            for (Resource reviewer : allReviewers) {
                if (reviewer.getUser().getUserId() != aggregator.getUser().getUserId()) {
                    ReviewComment reviewComment = new ReviewComment();
                    reviewComment.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
                    reviewComment.setReviewId(finalReview.getReviewId());
                    reviewComment.setResourceId(reviewer.getResourceId());
                    reviewComment.setContent("");
                    reviewComment.setType(CommentType.AGGREGATION_REVIEW_COMMENT);
                    reviewComment.setSortOrder(reviewCommentSortIndex++);
                    reviewComments.add(reviewComment);
                }
            }
            ReviewComment submitterAggregationComment = new ReviewComment();
            submitterAggregationComment.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
            submitterAggregationComment.setReviewId(finalReview.getReviewId());
            submitterAggregationComment.setResourceId(winningSubmitter.getResourceId());
            submitterAggregationComment.setContent("");
            submitterAggregationComment.setType(CommentType.SUBMITTER_COMMENT);
            submitterAggregationComment.setSortOrder(reviewCommentSortIndex++);
            reviewComments.add(submitterAggregationComment);
            
            if (finalReviewPhase.isClosed()) {
                ReviewComment finalReviewerComment = new ReviewComment();
                finalReviewerComment.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
                finalReviewerComment.setReviewId(finalReview.getReviewId());
                finalReviewerComment.setResourceId(finalReviewer.getResourceId());
                finalReviewerComment.setContent("");
                finalReviewerComment.setExtraInfo("Approved");
                finalReviewerComment.setType(CommentType.FINAL_REVIEW_COMMENT);
                finalReviewerComment.setSortOrder(reviewCommentSortIndex++);
                reviewComments.add(finalReviewerComment);
            }
            
            finalReview.setComments(reviewComments.toArray(new ReviewComment[reviewComments.size()]));
            
            // Review items from review scorecards for winning submission
            List<ReviewItem> reviewItems = new ArrayList<ReviewItem>();
            for (Resource reviewer : allReviewers) {
                Review[] reviews = reviewer.getReviews();
                int reviewItemSortingIndex = 0;
                for (Review review : reviews) {
                    if (review.getSubmissionId() == winningSubmission.getSubmissionId()) {
                        ReviewItem[] originalReviewItems = review.getItems();
                        int index = 0;
                        for (ReviewItem originalReviewItem : originalReviewItems) {
                            ReviewItem reviewItem = new ReviewItem();
                            reviewItem.setReviewItemId(this.config.getReviewItemIdGenerator().getNextId());
                            reviewItem.setReviewId(finalReview.getReviewId());
                            reviewItem.setAnswer(originalReviewItem.getAnswer());
                            reviewItem.setScorecardQuestionId(originalReviewItem.getScorecardQuestionId());
                            reviewItem.setSortOrder(reviewItemSortingIndex++);
                            reviewItems.add(reviewItem);
                            
                            int sortIndex = 0;
                            List<ReviewItemComment> reviewItemComments = new ArrayList<ReviewItemComment>();
                            ReviewItemComment[] originalReviewItemComments = originalReviewItem.getComments();
                            for (ReviewItemComment originalReviewItemComment : originalReviewItemComments) {
                                ReviewItemComment reviewItemComment = new ReviewItemComment();
                                reviewItemComment.setReviewItemCommentId(
                                    this.config.getReviewItemCommentIdGenerator().getNextId());
                                reviewItemComment.setResourceId(originalReviewItemComment.getResourceId());
                                reviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                                reviewItemComment.setType(originalReviewItemComment.getType());
                                reviewItemComment.setContent(originalReviewItemComment.getContent());
                                reviewItemComment.setSortOrder(sortIndex++);
                                reviewItemComments.add(reviewItemComment);
                                if (finalReviewPhase.isClosed()) {
                                    reviewItemComment.setExtraInfo("Fixed");
                                }
                            }
                            ReviewItemComment aggregationReviewItemComment = aggregationReviewItemComments.get(index++);
                            ReviewItemComment reviewItemComment = new ReviewItemComment();
                            reviewItemComment.setReviewItemCommentId(
                                this.config.getReviewItemCommentIdGenerator().getNextId());
                            reviewItemComment.setResourceId(aggregationReviewItemComment.getResourceId());
                            reviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                            reviewItemComment.setType(aggregationReviewItemComment.getType());
                            reviewItemComment.setContent(aggregationReviewItemComment.getContent());
                            reviewItemComment.setSortOrder(sortIndex++);
                            reviewItemComments.add(reviewItemComment);

                            if (finalReviewPhase.isClosed()) {
                                ReviewItemComment finalReviewItemComment = new ReviewItemComment();
                                finalReviewItemComment.setReviewItemCommentId(
                                    this.config.getReviewItemCommentIdGenerator().getNextId());
                                finalReviewItemComment.setResourceId(finalReviewer.getResourceId());
                                finalReviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                                finalReviewItemComment.setType(CommentType.FINAL_REVIEW_COMMENT);
                                finalReviewItemComment.setContent("");
                                finalReviewItemComment.setSortOrder(sortIndex++);
                                reviewItemComments.add(finalReviewItemComment);
                            }

                            reviewItem.setComments(
                                reviewItemComments.toArray(new ReviewItemComment[reviewItemComments.size()]));
                        }
                    }
                }
            }
            finalReview.setItems(reviewItems.toArray(new ReviewItem[reviewItems.size()]));
            finalReviewer.setReviews(new Review[]{finalReview});
        }
        
        // Approver
        Resource approver = createResource(this.config.getApprover(), ResourceRole.APPROVER,
                                           resourceIdGenerator.getNextId(), null, resources);
        if ((winningSubmission != null) && (approvalPhase.isOpen() || approvalPhase.isClosed())) {
            Review approval = new Review();
            approval.setReviewId(this.config.getReviewIdGenerator().getNextId());
            approval.setResourceId(approver.getResourceId());
            approval.setSubmissionId(winningSubmission.getSubmissionId());
            approval.setScorecardId(approvalPhase.getReviewScorecard().getScorecardId());
            approval.setCommitted(approvalPhase.isClosed());
            if (approvalPhase.isClosed()) {
                approval.setInitialScore(100D);
                approval.setScore(approval.getInitialScore());
            }
            
            ReviewComment approvalComment = new ReviewComment();
            approvalComment.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
            approvalComment.setReviewId(approval.getReviewId());
            approvalComment.setResourceId(approver.getResourceId());
            approvalComment.setContent("");
            approvalComment.setExtraInfo("Approved");
            approvalComment.setType(CommentType.APPROVAL_REVIEW_COMMENT);
            approvalComment.setSortOrder(0);
            
            ReviewComment approvalCommentOtherFixes = new ReviewComment();
            approvalCommentOtherFixes.setReviewCommentId(this.config.getReviewCommentIdGenerator().getNextId());
            approvalCommentOtherFixes.setReviewId(approval.getReviewId());
            approvalCommentOtherFixes.setResourceId(approver.getResourceId());
            approvalCommentOtherFixes.setContent("");
            approvalCommentOtherFixes.setExtraInfo("");
            approvalCommentOtherFixes.setType(CommentType.APPROVAL_REVIEW_COMMENT_OTHER_FIXES);
            approvalCommentOtherFixes.setSortOrder(1);

            approval.setComments(new ReviewComment[] {approvalComment, approvalCommentOtherFixes}); 

            ReviewItem reviewItem = new ReviewItem();
            reviewItem.setReviewItemId(this.config.getReviewItemIdGenerator().getNextId());
            reviewItem.setReviewId(approval.getReviewId());
            reviewItem.setAnswer("4/4");
            reviewItem.setScorecardQuestionId(approvalPhase.getReviewScorecard().getScorecardQuestionId());
            reviewItem.setSortOrder(0);
            approval.setItems(new ReviewItem[]{reviewItem});
                        
            ReviewItemComment reviewItemComment = new ReviewItemComment();
            reviewItemComment.setReviewItemCommentId(
                this.config.getReviewItemCommentIdGenerator().getNextId());
            reviewItemComment.setResourceId(approver.getResourceId());
            reviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
            reviewItemComment.setContent("Ok");
            reviewItemComment.setType(CommentType.COMMENT);
            reviewItemComment.setSortOrder(0);
            reviewItem.setComments(new ReviewItemComment[] {reviewItemComment});
            
            approver.setReviews(new Review[] {approval});
        }

        return project;
    }

    /**
     * <p>Generates the reviews for contest submissions from specified project of specified status.</p>
     *
     * @param projectStatus a <code>ProjectStatus</code> providing the status of the project. 
     * @param reviewPhase a <code>Phase</code> providing the review phase. 
     * @param contestSubmitters a <code>List</code> of submitters for contest. 
     * @param reviewerResource a <code>Resource</code> representing the reviewer. 
     * @param projectCategory a <code>ProjectCategory</code> providing the project category. 
     * @param projectId a <code>long</code> providing the project ID.
     */
    private void generateReviews(ProjectStatus projectStatus, Phase reviewPhase, List<Resource> contestSubmitters,
                                 Resource reviewerResource, ProjectCategory projectCategory, long projectId) {
        List<Review> reviews = new ArrayList<Review>();
        for (Resource contestSubmitter : contestSubmitters) {
            Submission[] contestSubmissions = contestSubmitter.getSubmissions();
            if (contestSubmissions != null) {
                for (Submission contestSubmission : contestSubmissions) {
                    int score;
                    if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                        score = 1;
                    } else {
                        score = getRandomInt(3, 4);
                    }
                    
                    Review review = new Review();
                    review.setReviewId(this.config.getReviewIdGenerator().getNextId());
                    review.setResourceId(reviewerResource.getResourceId());
                    review.setSubmissionId(contestSubmission.getSubmissionId());
                    review.setScorecardId(reviewPhase.getReviewScorecard().getScorecardId());
                    review.setCommitted(reviewPhase.isClosed());
                    if (reviewPhase.isClosed()) {
                        review.setInitialScore(score / 4D * 100);
                        review.setScore(review.getInitialScore());
                    }
                    reviews.add(review);

                    ReviewItem reviewItem = new ReviewItem();
                    reviewItem.setReviewItemId(this.config.getReviewItemIdGenerator().getNextId());
                    reviewItem.setReviewId(review.getReviewId());
                    reviewItem.setAnswer(score + "/4");
                    reviewItem.setScorecardQuestionId(
                        reviewPhase.getReviewScorecard().getScorecardQuestionId());
                    reviewItem.setSortOrder(0);
                    review.setItems(new ReviewItem[]{reviewItem});
                        
                    ReviewItemComment reviewItemComment = new ReviewItemComment();
                    reviewItemComment.setReviewItemCommentId(
                        this.config.getReviewItemCommentIdGenerator().getNextId());
                    reviewItemComment.setResourceId(reviewerResource.getResourceId());
                    reviewItemComment.setReviewItemId(reviewItem.getReviewItemId());
                    if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                        reviewItemComment.setContent("Misses some requirements");
                        reviewItemComment.setType(CommentType.REQUIRED);
                    } else {
                        reviewItemComment.setContent("Ok");
                        reviewItemComment.setType(CommentType.COMMENT);
                    }
                    reviewItemComment.setSortOrder(0);
                    reviewItem.setComments(new ReviewItemComment[] {reviewItemComment});
                }
            }
        }
        reviewerResource.setReviews(reviews.toArray(new Review[reviews.size()]));
        
        // For development reviewers add test case upload in case the reviews are done
        if ((projectCategory == ProjectCategory.DEVELOPMENT) && (reviewPhase.isClosed())) {
            Upload testCaseUpload = new Upload();
            testCaseUpload.setUploadId(this.config.getUploadIdGenerator().getNextId());
            testCaseUpload.setProjectId(projectId);
            testCaseUpload.setResourceId(reviewerResource.getResourceId());
            testCaseUpload.setStatus(UploadStatus.ACTIVE);
            testCaseUpload.setType(UploadType.TEST_CASE);
            testCaseUpload.setParameter(projectId + "_" + reviewerResource.getResourceId() + "_" 
                                        + testCaseUpload.getUploadId() + "_testcase.zip");
            testCaseUpload.setCreationTimestamp(new Date());
            addResourceUpload(reviewerResource, testCaseUpload);
        }
    }

    /**
     * <p>Generates a random value in specified range (inclusive).</p>
     * 
     * @param min an <code>int</code> providing the minimum range value. 
     * @param max an <code>int</code> providing the maximum range value.
     * @return an <code>int</code> providing the generated value.
     */
    private int getRandomInt(int min, int max) {
        int result;
        do {
            result = this.random.nextInt(max + 1);
        } while ((result < min) || (result > max));
        return result;
    }

    /**
     * <p>Marks specified phase as scheduled.</p>
     *
     * @param phase a <code>Phase</code> to be set with <code>Scheduled</code> status.  
     * @param phases a <code>Phase</code> list listing the project phases. 
     */
    private void schedule(Phase phase, List<Phase> phases) {
        Phase prevPhase = null;
        for (Phase p : phases) {
            if (p.getPhaseType().getOrdinal() < phase.getPhaseType().getOrdinal()) {
                prevPhase = p;
            }
        }
        phase.setPhaseStatus(PhaseStatus.SCHEDULED);
        if (prevPhase == null) {
            phase.setScheduledStartTimeOffset(12 * 60L);
        } else {
            if (phase.getPhaseType().getStartsWhenDependencyStarts()) {
                phase.setScheduledStartTimeOffset(prevPhase.getScheduledStartTimeOffset());
            } else {
                phase.setScheduledStartTimeOffset(prevPhase.getScheduledEndTimeOffset());
            }
        }
        phase.setScheduledEndTimeOffset(phase.getScheduledStartTimeOffset() + phase.getDuration() / 1000 / 60);
        phase.setActualStartTimeOffset(null);
        phase.setActualEndTimeOffset(null);
        if (phase.getPhaseType() == PhaseType.SPECIFICATION_SUBMISSION) {
            phase.setFixedStartTimeOffset(phase.getScheduledStartTimeOffset());
        } else {
            phase.setFixedStartTimeOffset(null);
        }
    }

    /**
     * <p>Marks specified phase as open.</p>
     *
     * @param phase a <code>Phase</code> to be set with <code>Open</code> status.  
     * @param phases a <code>Phase</code> list listing the project phases. 
     */
    private void open(Phase phase, List<Phase> phases) {
        Phase prevPhase = null;
        for (Phase p : phases) {
            if (p.getPhaseType().getOrdinal() < phase.getPhaseType().getOrdinal()) {
                prevPhase = p;
            }
        }
        phase.setPhaseStatus(PhaseStatus.OPEN);
        if (prevPhase == null) {
            phase.setScheduledStartTimeOffset(12 * 60L * (-1));
        } else {
            if (phase.getPhaseType().getStartsWhenDependencyStarts()) {
                phase.setScheduledStartTimeOffset(prevPhase.getActualStartTimeOffset());
            } else {
                phase.setScheduledStartTimeOffset(prevPhase.getActualEndTimeOffset());
            }
        }
        phase.setScheduledEndTimeOffset(phase.getScheduledStartTimeOffset() + phase.getDuration() / 1000 / 60);
        phase.setActualStartTimeOffset(phase.getScheduledStartTimeOffset());
        phase.setActualEndTimeOffset(null);
        if (phase.getPhaseType() == PhaseType.SPECIFICATION_SUBMISSION) {
            phase.setFixedStartTimeOffset(phase.getScheduledStartTimeOffset());
        } else {
            phase.setFixedStartTimeOffset(null);
        }
    }

    /**
     * <p>Marks specified phase as closed.</p>
     *
     * @param phase a <code>Phase</code> to be set with <code>Closed</code> status.  
     * @param phases a <code>Phase</code> list listing the project phases. 
     */
    private void close(Phase phase, List<Phase> phases) {
        Phase prevPhase = null;
        for (Phase p : phases) {
            if (p.getPhaseType().getOrdinal() < phase.getPhaseType().getOrdinal()) {
                prevPhase = p;
            }
        }
        phase.setPhaseStatus(PhaseStatus.CLOSED);
        if (prevPhase == null) {
            phase.setScheduledStartTimeOffset(40 * 24 * 60L * (-1));
        } else {
            if (phase.getPhaseType().getStartsWhenDependencyStarts()) {
                phase.setScheduledStartTimeOffset(prevPhase.getActualStartTimeOffset());
            } else {
                phase.setScheduledStartTimeOffset(prevPhase.getActualEndTimeOffset());
            }
        }
        phase.setScheduledEndTimeOffset(phase.getScheduledStartTimeOffset() + phase.getDuration() / 1000 / 60);
        phase.setActualStartTimeOffset(phase.getScheduledStartTimeOffset());
        phase.setActualEndTimeOffset(phase.getScheduledEndTimeOffset());
        if (phase.getPhaseType() == PhaseType.SPECIFICATION_SUBMISSION) {
            phase.setFixedStartTimeOffset(phase.getScheduledStartTimeOffset());
        } else {
            phase.setFixedStartTimeOffset(null);
        }
    }

    /**
     * <p>Creates new fully-initialized phase of specified type for specified project.</p>
     *
     * @param project a <code>Project</code> providing the details for target project. 
     * @param phaseType a <code>PhaseType</code> referencing the type of phase.
     * @param currentOpenPhaseType a <code>PhaseType</code> referencing the type of phase which is to be opened.
     * @param phases a <code>List</code> collecting the phases.
     * @param phaseId a <code>long</code> providing the ID of a phase.
     * @param duration a <code>long</code> providing the duration of a phase in hours.
     * @return a <code>Phase</code> of specified type for specified project.
     */
    private Phase createPhase(Project project, PhaseType phaseType, PhaseType currentOpenPhaseType,
                              List<Phase> phases, long phaseId, long duration) {
        Phase phase = new Phase();
        phases.add(phase);

        phase.setPhaseType(phaseType);
        phase.setPhaseId(phaseId);
        phase.setDuration(duration * 60 * 60 * 1000L);

        ProjectStatus projectStatus = project.getProjectStatus();
        if (projectStatus == ProjectStatus.ACTIVE) {
            if (currentOpenPhaseType == null) {
                schedule(phase, phases);
            } else if (currentOpenPhaseType.getPhaseTypeId() == phaseType.getPhaseTypeId()) {
                open(phase, phases);
            } else if (currentOpenPhaseType.getOrdinal() < phaseType.getOrdinal()) {
                schedule(phase, phases);
            } else {
                close(phase, phases);
            }
        }

        if (phaseType == PhaseType.SPECIFICATION_SUBMISSION) {
            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.SPECIFICATION_REVIEW) {
            phase.addCriteria(PhaseCriteriaType.SCORECARD_ID, 
                              String.valueOf(Scorecard.DEFAULT_SPEC_REVIEW_SCORECARD.getScorecardId()));
            phase.addCriteria(PhaseCriteriaType.REVIEWER_NUMBER, "1");
            phase.setReviewScorecard(Scorecard.DEFAULT_SPEC_REVIEW_SCORECARD);

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.REGISTRATION) {
            phase.addCriteria(PhaseCriteriaType.REGISTRATION_NUMBER, "0");
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.SUBMISSION) {
            phase.addCriteria(PhaseCriteriaType.SUBMISSION_NUMBER, "0");
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "Yes");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.SCREENING) {
            if (project.getProjectCategory() == ProjectCategory.DESIGN) {
                phase.setReviewScorecard(Scorecard.DEFAULT_DESIGN_SCREENING_SCORECARD);
            } else if (project.getProjectCategory() == ProjectCategory.DEVELOPMENT) {
                phase.setReviewScorecard(Scorecard.DEFAULT_DEVELOPMENT_SCREENING_SCORECARD);
            } else if (project.getProjectCategory() == ProjectCategory.SPECIFICATION) {
                phase.setReviewScorecard(Scorecard.DEFAULT_APPLICATION_SCREENING_SCORECARD);
            } else if (project.getProjectCategory() == ProjectCategory.COPILOT_POSTING) {
                phase.setReviewScorecard(Scorecard.DEFAULT_COPILOT_SELECTION_SCREENING_SCORECARD);
            } else {
                phase.setReviewScorecard(Scorecard.DEFAULT_DESIGN_SCREENING_SCORECARD);
            }
            phase.addCriteria(PhaseCriteriaType.SCORECARD_ID,
                              String.valueOf(phase.getReviewScorecard().getScorecardId()));
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.REVIEW) {
            if (project.getProjectCategory() == ProjectCategory.DESIGN) {
                phase.setReviewScorecard(Scorecard.DEFAULT_DESIGN_REVIEW_SCORECARD);
            } else if (project.getProjectCategory() == ProjectCategory.DEVELOPMENT) {
                phase.setReviewScorecard(Scorecard.DEFAULT_DEVELOPMENT_REVIEW_SCORECARD);
            } else if (project.getProjectCategory() == ProjectCategory.SPECIFICATION) {
                phase.setReviewScorecard(Scorecard.DEFAULT_APPLICATION_REVIEW_SCORECARD);
            } else if (project.getProjectCategory() == ProjectCategory.COPILOT_POSTING) {
                phase.setReviewScorecard(Scorecard.DEFAULT_COPILOT_SELECTION_REVIEW_SCORECARD);
            } else {
                phase.setReviewScorecard(Scorecard.DEFAULT_DESIGN_REVIEW_SCORECARD);
            }
            phase.addCriteria(PhaseCriteriaType.SCORECARD_ID,
                              String.valueOf(phase.getReviewScorecard().getScorecardId()));
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");
            phase.addCriteria(PhaseCriteriaType.REVIEWER_NUMBER, "3");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.APPEALS) {
            phase.addCriteria(PhaseCriteriaType.VIEW_RESPONSE_DURING_APPEALS, "No");
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.APPEALS_RESPONSE) {
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.AGGREGATION) {
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.AGGREGATION_REVIEW) {
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                close(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.FINAL_FIX) {
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                open(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.FINAL_REVIEW) {
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.APPROVAL) {
            phase.setReviewScorecard(Scorecard.DEFAULT_APPROVAL_SCORECARD);
            phase.addCriteria(PhaseCriteriaType.SCORECARD_ID,
                              String.valueOf(Scorecard.DEFAULT_APPROVAL_SCORECARD.getScorecardId()));
            phase.addCriteria(PhaseCriteriaType.REVIEWER_NUMBER, "1");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                close(phase, phases);
            }
        } else if (phaseType == PhaseType.POST_MORTEM) {
            phase.setReviewScorecard(Scorecard.DEFAULT_POST_MORTEM_SCORECARD);
            phase.addCriteria(PhaseCriteriaType.SCORECARD_ID,
                              String.valueOf(Scorecard.DEFAULT_POST_MORTEM_SCORECARD.getScorecardId()));
            phase.addCriteria(PhaseCriteriaType.MANUAL_SCREENING, "No");

            if (projectStatus == ProjectStatus.ACTIVE) {
            } else if (projectStatus == ProjectStatus.INACTIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.DELETED) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_CLIENT_REQUEST) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_REQUIREMENTS_INFEASIBLE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_WINNER_UNRESPONSIVE) {
                schedule(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_REGISTRATIONS) {
                open(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_ZERO_SUBMISSIONS) {
                open(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_SCREENING) {
                open(phase, phases);
            } else if (projectStatus == ProjectStatus.CANCELLED_FAILED_REVIEW) {
                open(phase, phases);
            } else if (projectStatus == ProjectStatus.COMPLETED) {
                schedule(phase, phases);
            }
        }

        return phase;
    }

    /**
     * <p>Creates new resource with basic data like external reference ID, handle, payment status and registration date.
     * </p>
     *
     * @param user a <code>User</code> referencing the user account to be associated with resource. 
     * @param role a <code>ResourceRole</code> referencing the role to be assigned to resource. 
     * @param resourceId a <code>long</code> providing the ID for the resource.
     * @param phase a <code>Phase</code> referencing the phase to associate the resource to.  
     * @param resources a <code>List</code> to collect the created resource to. 
     * @return a <code>Resource</code> providing the basic data for resource. 
     */
    private Resource createResource(User user, ResourceRole role, long resourceId, Phase phase,
                                    List<Resource> resources) {
        Resource resource = new Resource();
        resources.add(resource);
        resource.setResourceId(resourceId);
        resource.setRole(role);
        resource.setUser(user);
        resource.setPhase(phase);
        resource.setPaymentStatus("N/A");
        if (phase != null) {
            resource.setRegistrationDate(new Date(System.currentTimeMillis() 
                                                  + (phase.getScheduledStartTimeOffset() 
                                                     + resources.size()) * 60 * 1000));
        } else {
            resource.setRegistrationDate(new Date(System.currentTimeMillis() + resources.size() * 60 * 1000));
        }
        return resource;
    }


    /**
     * <p>Gets the random item from the specified items.</p>
     * 
     * @param items a <code>Object</code> array to select item from. 
     * @return an <code>Object</code> selected randomly from specified list.
     */
    private <T> T getRandomItem(T[] items) {
        return items[getRandomInt(0, items.length - 1)];
    }
    
    /**
     * <p>Gets the specified number of random items from the specified items.</p>
     * 
     * @param items a <code>User</code> array to select items from.
     * @param itemCount an <code>int</code> providing the number of items to select.
     * @return an <code>Object</code> array selected randomly from specified list.
     */
    private <T> List<T> getRandomItems(T[] items, int itemCount) {
        List<T> result = new ArrayList<T>();
        List<T> remainingItems = new ArrayList<T>(Arrays.asList(items));
        for (int i = 0; i < itemCount && !remainingItems.isEmpty(); i++) {
            T item = getRandomItem((T[]) remainingItems.toArray());
            result.add(item);
            remainingItems.remove(item);
        }
        return result;
    }

    /**
     * <p>Adds specified SQL statement to list of sql statements for specified resource.</p>
     * 
     * @param resource a <code>Resource</code> providing the details for the resource. 
     * @param s a <code>String</code> providing the SQL statement to be added.
     */
    private void addResourceSql(Resource resource, String s) {
        String[] sql = resource.getSql();
        if (sql == null) {
            resource.setSql(new String[]{s});
        } else {
            List<String> newSql = new ArrayList<String>(Arrays.asList(sql));
            newSql.add(s);
            resource.setSql(newSql.toArray(new String[newSql.size()]));
        }
    }

    /**
     * <p>Adds specified upload to list of uploads for specified resource.</p>
     * 
     * @param resource a <code>Resource</code> providing the details for the resource. 
     * @param upload a <code>String</code> providing the SQL statement to be added.
     */
    private void addResourceUpload(Resource resource, Upload upload) {
        Upload[] uploads = resource.getUploads();
        if (uploads == null) {
            resource.setUploads(new Upload[]{upload});
        } else {
            List<Upload> newUploads = new ArrayList<Upload>(Arrays.asList(uploads));
            newUploads.add(upload);
            resource.setUploads(newUploads.toArray(new Upload[newUploads.size()]));
        }
    }
}
