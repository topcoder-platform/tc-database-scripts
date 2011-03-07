/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import com.cronos.onlinereview.test.data.TopCoderUser;
import com.cronos.onlinereview.test.data.User;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for a single resource which may be associated with the project's phase. Corresponds to 
 * <code>tcs_catalog.resource</code> and <code>tcs_catalog.resource_info</code> database tables.</p>
 *
 * @author isv
 * @version 1.0
 */
public class Resource implements Serializable {

    /**
     * <p>A <code>ResourceRole</code> providing the resource role.</p>
     */
    private ResourceRole role;

    /**
     * <p>A <code>Phase</code> providing the phase which resource is associated to.</p>
     */
    private Phase phase;

    /**
     * <p>A <code>User</code> providing the details for the user account associated with this resource.</p>
     */
    private User user;

    /**
     * <p>A <code>TopCoderUser</code> providing the details for user.</p>
     */
    private TopCoderUser topCoderUser;

    /**
     * <p>A <code>Integer</code> providing the rating for this resource.</p>
     */
    private Integer rating;

    /**
     * <p>A <code>Integer</code> providing the reliability for this resource.</p>
     */
    private Integer reliability;

    /**
     * <p>A <code>Double</code> providing the payment for this resource.</p>
     */
    private Double payment;

    /**
     * <p>A <code>String</code> providing the status of payment for this resource.</p>
     */
    private String paymentStatus;

    /**
     * <p>A <code>Double</code> providing the screening score for this resource.</p>
     */
    private Double screeningScore;

    /**
     * <p>A <code>Double</code> providing the initial score for this resource.</p>
     */
    private Double initialScore;

    /**
     * <p>A <code>Double</code> providing the final score for this resource.</p>
     */
    private Double finalScore;

    /**
     * <p>A <code>Integer</code> providing the placement for this resource.</p>
     */
    private Integer placement;

    /**
     * <p>A <code>Boolean</code> providing the flag indicating whether this resource completed appeals early or
     * not.</p>
     */
    private Boolean appealsCompletedEarly;

    /**
     * <p>A <code>String[]</code> providing the SQL statements.</p>
     */
    private String[] sql;

    /**
     * <p>A <code>Date</code> providing the registration date for resource.</p>
     */
    private Date registrationDate;

    /**
     * <p>A <code>Submission[]</code> providing the submissions associated with this resource.</p>
     */
    private Submission[] submissions;

    /**
     * <p>A <code>Upload[]</code> providing the uploads associated with this resource.</p>
     */
    private Upload[] uploads;

    /**
     * <p>A <code>Review[]</code> providing the reviews associated with this resource.</p>
     */
    private Review[] reviews;

    /**
     * <p>Constructs new <code>Resource</code> instance. This implementation does nothing.</p>
     */
    public Resource() {
    }

    /**
     * <p>Gets the flag indicating whether this resource completed appeals early or not.</p>
     *
     * @return a <code>Boolean</code> providing the flag indicating whether this resource completed appeals early or
     *         not.
     */
    public Boolean isAppealsCompletedEarly() {
        return this.appealsCompletedEarly;
    }

    /**
     * <p>Sets the flag indicating whether this resource completed appeals early or not.</p>
     *
     * @param appealsCompletedEarly a <code>Boolean</code> providing the flag indicating whether this resource completed
     * appeals early or not.
     */
    public void setAppealsCompletedEarly(Boolean appealsCompletedEarly) {
        this.appealsCompletedEarly = appealsCompletedEarly;
    }

    /**
     * <p>Gets the placement for this resource.</p>
     *
     * @return a <code>Integer</code> providing the placement for this resource.
     */
    public Integer getPlacement() {
        return this.placement;
    }

    /**
     * <p>Sets the placement for this resource.</p>
     *
     * @param placement a <code>Integer</code> providing the placement for this resource.
     */
    public void setPlacement(Integer placement) {
        this.placement = placement;
    }

    /**
     * <p>Gets the final score for this resource.</p>
     *
     * @return a <code>Double</code> providing the final score for this resource.
     */
    public Double getFinalScore() {
        return this.finalScore;
    }

    /**
     * <p>Sets the final score for this resource.</p>
     *
     * @param finalScore a <code>Double</code> providing the final score for this resource.
     */
    public void setFinalScore(Double finalScore) {
        this.finalScore = finalScore;
    }

    /**
     * <p>Gets the initial score for this resource.</p>
     *
     * @return a <code>Double</code> providing the initial score for this resource.
     */
    public Double getInitialScore() {
        return this.initialScore;
    }

    /**
     * <p>Sets the initial score for this resource.</p>
     *
     * @param initialScore a <code>Double</code> providing the initial score for this resource.
     */
    public void setInitialScore(Double initialScore) {
        this.initialScore = initialScore;
    }

    /**
     * <p>Gets the screening score for this resource.</p>
     *
     * @return a <code>Double</code> providing the screening score for this resource.
     */
    public Double getScreeningScore() {
        return this.screeningScore;
    }

    /**
     * <p>Sets the screening score for this resource.</p>
     *
     * @param screeningScore a <code>Double</code> providing the screening score for this resource.
     */
    public void setScreeningScore(Double screeningScore) {
        this.screeningScore = screeningScore;
    }

    /**
     * <p>Gets the status of payment for this resource.</p>
     *
     * @return a <code>String</code> providing the status of payment for this resource.
     */
    public String getPaymentStatus() {
        return this.paymentStatus;
    }

    /**
     * <p>Sets the status of payment for this resource.</p>
     *
     * @param paymentStatus a <code>String</code> providing the status of payment for this resource.
     */
    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    /**
     * <p>Gets the payment for this resource.</p>
     *
     * @return a <code>Double</code> providing the payment for this resource.
     */
    public Double getPayment() {
        return this.payment;
    }

    /**
     * <p>Sets the payment for this resource.</p>
     *
     * @param payment a <code>Double</code> providing the payment for this resource.
     */
    public void setPayment(Double payment) {
        this.payment = payment;
    }

    /**
     * <p>Gets the reliability for this resource.</p>
     *
     * @return a <code>Integer</code> providing the reliability for this resource.
     */
    public Integer getReliability() {
        return this.reliability;
    }

    /**
     * <p>Sets the reliability for this resource.</p>
     *
     * @param reliability a <code>Integer</code> providing the reliability for this resource.
     */
    public void setReliability(Integer reliability) {
        this.reliability = reliability;
    }


    /**
     * <p>Gets the rating for this resource.</p>
     *
     * @return a <code>Integer</code> providing the rating for this resource.
     */
    public Integer getRating() {
        return this.rating;
    }

    /**
     * <p>Sets the rating for this resource.</p>
     *
     * @param rating a <code>Integer</code> providing the rating for this resource.
     */
    public void setRating(Integer rating) {
        this.rating = rating;
    }

    /**
     * <p>Gets the details for the user account associated with this resource.</p>
     *
     * @return a <code>User</code> providing the details for the user account associated with this resource.
     */
    public User getUser() {
        return this.user;
    }

    /**
     * <p>Sets the details for the user account associated with this resource.</p>
     *
     * @param user a <code>User</code> providing the details for the user account associated with this resource.
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * <p>Gets the phase which resource is associated to.</p>
     *
     * @return a <code>Phase</code> providing the phase which resource is associated to.
     */
    public Phase getPhase() {
        return this.phase;
    }

    /**
     * <p>Sets the phase which resource is associated to.</p>
     *
     * @param phase a <code>Phase</code> providing the phase which resource is associated to.
     */
    public void setPhase(Phase phase) {
        this.phase = phase;
    }

    /**
     * <p>A <code>long</code> providing the resourceId.</p>
     */
    private long resourceId;

    /**
     * <p>Gets the resourceId.</p>
     *
     * @return a <code>long</code> providing the resourceId.
     */
    public long getResourceId() {
        return this.resourceId;
    }

    /**
     * <p>Sets the resourceId.</p>
     *
     * @param resourceId a <code>long</code> providing the resourceId.
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * <p>Gets the resource role.</p>
     *
     * @return a <code>ResourceRole</code> providing the resource role.
     */
    public ResourceRole getRole() {
        return this.role;
    }

    /**
     * <p>Sets the resource role.</p>
     *
     * @param role a <code>ResourceRole</code> providing the resource role.
     */
    public void setRole(ResourceRole role) {
        this.role = role;
    }

    /**
     * <p>Gets the details for user.</p>
     *
     * @return a <code>TopCoderUser</code> providing the details for user.
     */
    public TopCoderUser getTopCoderUser() {
        return this.topCoderUser;
    }

    /**
     * <p>Sets the details for user.</p>
     *
     * @param topCoderUser a <code>TopCoderUser</code> providing the details for user.
     */
    public void setTopCoderUser(TopCoderUser topCoderUser) {
        this.topCoderUser = topCoderUser;
    }

    /**
     * <p>Gets the registration date for resource.</p>
     *
     * @return a <code>Date</code> providing the registration date for resource.
     */
    public Date getRegistrationDate() {
        return this.registrationDate;
    }

    /**
     * <p>Sets the registration date for resource.</p>
     *
     * @param registrationDate a <code>Date</code> providing the registration date for resource.
     */
    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    /**
     * <p>Gets the uploads associated with this resource.</p>
     *
     * @return a <code>Upload[]</code> providing the uploads associated with this resource.
     */
    public Upload[] getUploads() {
        return this.uploads;
    }

    /**
     * <p>Sets the uploads associated with this resource.</p>
     *
     * @param uploads a <code>Upload[]</code> providing the uploads associated with this resource.
     */
    public void setUploads(Upload[] uploads) {
        this.uploads = uploads;
    }

    /**
     * <p>Gets the submissions associated with this resource.</p>
     *
     * @return a <code>Submission[]</code> providing the submissions associated with this resource.
     */
    public Submission[] getSubmissions() {
        return this.submissions;
    }

    /**
     * <p>Sets the submissions associated with this resource.</p>
     *
     * @param submissions a <code>Submission[]</code> providing the submissions associated with this resource.
     */
    public void setSubmissions(Submission[] submissions) {
        this.submissions = submissions;
    }

    /**
     * <p>Gets the SQL statements.</p>
     *
     * @return a <code>String[]</code> providing the SQL statements.
     */
    public String[] getSql() {
        return this.sql;
    }

    /**
     * <p>Sets the SQL statements.</p>
     *
     * @param sql a <code>String[]</code> providing the SQL statements.
     */
    public void setSql(String[] sql) {
        this.sql = sql;
    }

    /**
     * <p>Gets the reviews associated with this resource.</p>
     *
     * @return a <code>Review[]</code> providing the reviews associated with this resource.
     */
    public Review[] getReviews() {
        return this.reviews;
    }

    /**
     * <p>Sets the reviews associated with this resource.</p>
     *
     * @param reviews a <code>Review[]</code> providing the reviews associated with this resource.
     */
    public void setReviews(Review[] reviews) {
        this.reviews = reviews;
    }
}
