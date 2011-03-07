/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for a single billing account. Corresponds to <code>time_oltp.project</code> table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class BillingProject implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this billing project.</p>
     */
    private long billingProjectId;

    /**
     * <p>A <code>long</code> providing the ID of a company associated with this billing project.</p>
     */
    private long companyId;

    /**
     * <p>A <code>String</code> providing the name of this billing project.</p>
     */
    private String name;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the project is active or not.</p>
     */
    private boolean active;

    /**
     * <p>A <code>double</code> providing the sales tax set for this billing project.</p>
     */
    private double salesTax;

    /**
     * <p>A <code>String</code> providing the PO box number associated with this billing project.</p>
     */
    private String poBoxNumber;

    /**
     * <p>A <code>long</code> providing the ID for payment terms set for this project.</p>
     */
    private long paymentTermsId;

    /**
     * <p>A <code>String</code> providing the description of this billing project.</p>
     */
    private String description;

    /**
     * <p>A <code>Date</code> providing the start date for this billing project.</p>
     */
    private Date startDate;

    /**
     * <p>A <code>Date</code> providing the end date for this billing project.</p>
     */
    private Date endDate;

    /**
     * <p>A <code>BillingProjectStatus</code> providing the status of this billing project.</p>
     */
    private BillingProjectStatus status;

    /**
     * <p>A <code>long</code> providing the ID for the client account associated with this billing project.</p>
     */
    private long clientId;

    /**
     * <p>A <code>Long</code> providing the ID of a parent project for this billing project.</p>
     */
    private Long parentProjectId;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this billing project is deleted or not.</p>
     */
    private boolean deleted;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the manual prize setting is required for this
     * billing project or not.</p>
     */
    private boolean manualPrizeSetting;

    /**
     * <p>A <code>double</code> providing the budget for this billing project.</p>
     */
    private double budget;

    /**
     * <p>Constructs new <code>BillingProject</code> instance. This implementation does nothing.</p>
     */
    public BillingProject() {
    }

    /**
     * <p>Gets the budget for this billing project.</p>
     *
     * @return a <code>double</code> providing the budget for this billing project.
     */
    public double getBudget() {
        return this.budget;
    }

    /**
     * <p>Sets the budget for this billing project.</p>
     *
     * @param budget a <code>double</code> providing the budget for this billing project.
     */
    public void setBudget(double budget) {
        this.budget = budget;
    }

    /**
     * <p>Gets the flag indicating whether the manual prize setting is required for this billing project or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the manual prize setting is required for
     *         this billing project or not.
     */
    public boolean getManualPrizeSetting() {
        return this.manualPrizeSetting;
    }

    /**
     * <p>Sets the flag indicating whether the manual prize setting is required for this billing project or not.</p>
     *
     * @param manualPrizeSetting a <code>boolean</code> providing the flag indicating whether the manual prize setting
     *                           is required for this billing project or not.
     */
    public void setManualPrizeSetting(boolean manualPrizeSetting) {
        this.manualPrizeSetting = manualPrizeSetting;
    }

    /**
     * <p>Gets the flag indicating whether this billing project is deleted or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this billing project is deleted or not.
     */
    public boolean getDeleted() {
        return this.deleted;
    }

    /**
     * <p>Sets the flag indicating whether this billing project is deleted or not.</p>
     *
     * @param deleted a <code>boolean</code> providing the flag indicating whether this billing project is deleted or
     *                not.
     */
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    /**
     * <p>Gets the ID of a parent project for this billing project.</p>
     *
     * @return a <code>Long</code> providing the ID of a parent project for this billing project.
     */
    public Long getParentProjectId() {
        return this.parentProjectId;
    }

    /**
     * <p>Sets the ID of a parent project for this billing project.</p>
     *
     * @param parentProjectId a <code>Long</code> providing the ID of a parent project for this billing project.
     */
    public void setParentProjectId(Long parentProjectId) {
        this.parentProjectId = parentProjectId;
    }

    /**
     * <p>Gets the ID for the client account associated with this billing project.</p>
     *
     * @return a <code>long</code> providing the ID for the client account associated with this billing project.
     */
    public long getClientId() {
        return this.clientId;
    }

    /**
     * <p>Sets the ID for the client account associated with this billing project.</p>
     *
     * @param clientId a <code>long</code> providing the ID for the client account associated with this billing
     *                 project.
     */
    public void setClientId(long clientId) {
        this.clientId = clientId;
    }

    /**
     * <p>Gets the status of this billing project.</p>
     *
     * @return a <code>BillingProjectStatus</code> providing the status of this billing project.
     */
    public BillingProjectStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of this billing project.</p>
     *
     * @param status a <code>BillingProjectStatus</code> providing the status of this billing project.
     */
    public void setStatus(BillingProjectStatus status) {
        this.status = status;
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

    /**
     * <p>Gets the description of this billing project.</p>
     *
     * @return a <code>String</code> providing the description of this billing project.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this billing project.</p>
     *
     * @param description a <code>String</code> providing the description of this billing project.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the ID for payment terms set for this project.</p>
     *
     * @return a <code>long</code> providing the ID for payment terms set for this project.
     */
    public long getPaymentTermsId() {
        return this.paymentTermsId;
    }

    /**
     * <p>Sets the ID for payment terms set for this project.</p>
     *
     * @param paymentTermsId a <code>long</code> providing the ID for payment terms set for this project.
     */
    public void setPaymentTermsId(long paymentTermsId) {
        this.paymentTermsId = paymentTermsId;
    }

    /**
     * <p>Gets the PO box number associated with this billing project.</p>
     *
     * @return a <code>String</code> providing the PO box number associated with this billing project.
     */
    public String getPoBoxNumber() {
        return this.poBoxNumber;
    }

    /**
     * <p>Sets the PO box number associated with this billing project.</p>
     *
     * @param poBoxNumber a <code>String</code> providing the PO box number associated with this billing project.
     */
    public void setPoBoxNumber(String poBoxNumber) {
        this.poBoxNumber = poBoxNumber;
    }

    /**
     * <p>Gets the sales tax set for this billing project.</p>
     *
     * @return a <code>double</code> providing the sales tax set for this billing project.
     */
    public double getSalesTax() {
        return this.salesTax;
    }

    /**
     * <p>Sets the sales tax set for this billing project.</p>
     *
     * @param salesTax a <code>double</code> providing the sales tax set for this billing project.
     */
    public void setSalesTax(double salesTax) {
        this.salesTax = salesTax;
    }

    /**
     * <p>Gets the flag indicating whether the project is active or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the project is active or not.
     */
    public boolean getActive() {
        return this.active;
    }

    /**
     * <p>Sets the flag indicating whether the project is active or not.</p>
     *
     * @param active a <code>boolean</code> providing the flag indicating whether the project is active or not.
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * <p>Gets the name of this billing project.</p>
     *
     * @return a <code>String</code> providing the name of this billing project.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Sets the name of this billing project.</p>
     *
     * @param name a <code>String</code> providing the name of this billing project.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>Gets the ID of a company associated with this billing project.</p>
     *
     * @return a <code>long</code> providing the ID of a company associated with this billing project.
     */
    public long getCompanyId() {
        return this.companyId;
    }

    /**
     * <p>Sets the ID of a company associated with this billing project.</p>
     *
     * @param companyId a <code>long</code> providing the ID of a company associated with this billing project.
     */
    public void setCompanyId(long companyId) {
        this.companyId = companyId;
    }

    /**
     * <p>Gets the ID of this billing project.</p>
     *
     * @return a <code>long</code> providing the ID of this billing project.
     */
    public long getBillingProjectId() {
        return this.billingProjectId;
    }

    /**
     * <p>Sets the ID of this billing project.</p>
     *
     * @param billingProjectId a <code>long</code> providing the ID of this billing project.
     */
    public void setBillingProjectId(long billingProjectId) {
        this.billingProjectId = billingProjectId;
    }
}
