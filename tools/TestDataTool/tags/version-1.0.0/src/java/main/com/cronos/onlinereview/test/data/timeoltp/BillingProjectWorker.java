/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for a single billing account worker. Corresponds to <code>time_oltp.project_worker</code> table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class BillingProjectWorker implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of a project this worker is associated to.</p>
     */
    private long projectId;

    /**
     * <p>A <code>UserAccount</code> providing the details for user account associated with this worker.</p>
     */
    private UserAccount userAccount;

    /**
     * <p>A <code>double</code> providing the pay rate for this worker.</p>
     */
    private double payRate;

    /**
     * <p>A <code>double</code> providing the cost for this worker.</p>
     */
    private double cost;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this worker account is active or not.</p>
     */
    private boolean active;

    /**
     * <p>A <code>Date</code> providing the start date for this billing project.</p>
     */
    private Date startDate;

    /**
     * <p>A <code>Date</code> providing the end date for this billing project.</p>
     */
    private Date endDate;

    /**
     * <p>Constructs new <code>BillingProjectWorker</code> instance. This implementation does nothing.</p>
     */
    public BillingProjectWorker() {
    }

    /**
     * <p>Gets the flag indicating whether this worker account is active or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this worker account is active or not.
     */
    public boolean getActive() {
        return this.active;
    }

    /**
     * <p>Sets the flag indicating whether this worker account is active or not.</p>
     *
     * @param active a <code>boolean</code> providing the flag indicating whether this worker account is active or
     *               not.
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * <p>Gets the cost for this worker.</p>
     *
     * @return a <code>double</code> providing the cost for this worker.
     */
    public double getCost() {
        return this.cost;
    }

    /**
     * <p>Sets the cost for this worker.</p>
     *
     * @param cost a <code>double</code> providing the cost for this worker.
     */
    public void setCost(double cost) {
        this.cost = cost;
    }

    /**
     * <p>Gets the pay rate for this worker.</p>
     *
     * @return a <code>double</code> providing the pay rate for this worker.
     */
    public double getPayRate() {
        return this.payRate;
    }

    /**
     * <p>Sets the pay rate for this worker.</p>
     *
     * @param payRate a <code>double</code> providing the pay rate for this worker.
     */
    public void setPayRate(double payRate) {
        this.payRate = payRate;
    }

    /**
     * <p>Gets the ID of a project this worker is associated to.</p>
     *
     * @return a <code>long</code> providing the ID of a project this worker is associated to.
     */
    public long getProjectId() {
        return this.projectId;
    }

    /**
     * <p>Sets the ID of a project this worker is associated to.</p>
     *
     * @param projectId a <code>long</code> providing the ID of a project this worker is associated to.
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>Gets the details for user account associated with this worker.</p>
     *
     * @return a <code>UserAccount</code> providing the details for user account associated with this worker.
     */
    public UserAccount getUserAccount() {
        return this.userAccount;
    }

    /**
     * <p>Sets the details for user account associated with this worker.</p>
     *
     * @param userAccount a <code>UserAccount</code> providing the details for user account associated with this
     *                    worker.
     */
    public void setUserAccount(UserAccount userAccount) {
        this.userAccount = userAccount;
    }

    /**
     * <p>Gets the end date for this billing project.</p>
     *
     * @return a <code>Date</code> providing the end date for this billing project.
     */
    public Date getEndDate() {
        return this.endDate;
    }

    /**
     * <p>Sets the end date for this billing project.</p>
     *
     * @param endDate a <code>Date</code> providing the end date for this billing project.
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * <p>Gets the start date for this billing project.</p>
     *
     * @return a <code>Date</code> providing the start date for this billing project.
     */
    public Date getStartDate() {
        return this.startDate;
    }

    /**
     * <p>Sets the start date for this billing project.</p>
     *
     * @param startDate a <code>Date</code> providing the start date for this billing project.
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
}
