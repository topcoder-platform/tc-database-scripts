/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for a single client account. Corresponds to <code>time_oltp.client</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class Client implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of this client.</p>
     */
    private long clientId;

    /**
     * <p>A <code>String</code> providing the name of this client account.</p>
     */
    private String name;

    /**
     * <p>A <code>Company</code> providing the details for company this client account is associated to.</p>
     */
    private Company company;

    /**
     * <p>A <code>PaymentTerms</code> providing the details for payment terms set for this client account.</p>
     */
    private PaymentTerms paymentTerms;

    /**
     * <p>A <code>ClientStatus</code> providing the client status.</p>
     */
    private ClientStatus status;

    /**
     * <p>A <code>double</code> providing the sales tax set for this client.</p>
     */
    private double salesTax;

    /**
     * <p>A <code>Date</code> providing the start date for this billing project.</p>
     */
    private Date startDate;

    /**
     * <p>A <code>Date</code> providing the end date for this billing project.</p>
     */
    private Date endDate;

    /**
     * <p>A <code>String</code> providing the code name for this client.</p>
     */
    private String codeName;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this client account is deleted or not.</p>
     */
    private boolean deleted;

    /**
     * <p>Constructs new <code>Client</code> instance. This implementation does nothing.</p>
     */
    public Client() {
    }

    /**
     * <p>Gets the details for payment terms set for this client account.</p>
     *
     * @return a <code>PaymentTerms</code> providing the details for payment terms set for this client account.
     */
    public PaymentTerms getPaymentTerms() {
        return this.paymentTerms;
    }

    /**
     * <p>Sets the details for payment terms set for this client account.</p>
     *
     * @param paymentTerms a <code>PaymentTerms</code> providing the details for payment terms set for this client
     *                     account.
     */
    public void setPaymentTerms(PaymentTerms paymentTerms) {
        this.paymentTerms = paymentTerms;
    }

    /**
     * <p>Gets the details for company this client account is associated to.</p>
     *
     * @return a <code>Company</code> providing the details for company this client account is associated to.
     */
    public Company getCompany() {
        return this.company;
    }

    /**
     * <p>Sets the details for company this client account is associated to.</p>
     *
     * @param company a <code>Company</code> providing the details for company this client account is associated to.
     */
    public void setCompany(Company company) {
        this.company = company;
    }

    /**
     * <p>Gets the name of this client account.</p>
     *
     * @return a <code>String</code> providing the name of this client account.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Sets the name of this client account.</p>
     *
     * @param name a <code>String</code> providing the name of this client account.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>Gets the ID of this client.</p>
     *
     * @return a <code>long</code> providing the ID of this client.
     */
    public long getClientId() {
        return this.clientId;
    }

    /**
     * <p>Sets the ID of this client.</p>
     *
     * @param clientId a <code>long</code> providing the ID of this client.
     */
    public void setClientId(long clientId) {
        this.clientId = clientId;
    }

    /**
     * <p>Gets the sales tax set for this client.</p>
     *
     * @return a <code>double</code> providing the sales tax set for this client.
     */
    public double getSalesTax() {
        return this.salesTax;
    }

    /**
     * <p>Sets the sales tax set for this client.</p>
     *
     * @param salesTax a <code>double</code> providing the sales tax set for this client.
     */
    public void setSalesTax(double salesTax) {
        this.salesTax = salesTax;
    }

    /**
     * <p>Gets the client status.</p>
     *
     * @return a <code>ClientStatus</code> providing the client status.
     */
    public ClientStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the client status.</p>
     *
     * @param status a <code>ClientStatus</code> providing the client status.
     */
    public void setStatus(ClientStatus status) {
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
     * <p>Gets the flag indicating whether this client account is deleted or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this client account is deleted or not.
     */
    public boolean getDeleted() {
        return this.deleted;
    }

    /**
     * <p>Sets the flag indicating whether this client account is deleted or not.</p>
     *
     * @param deleted a <code>boolean</code> providing the flag indicating whether this client account is deleted or
     *                not.
     */
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    /**
     * <p>Gets the code name for this client.</p>
     *
     * @return a <code>String</code> providing the code name for this client.
     */
    public String getCodeName() {
        return this.codeName;
    }

    /**
     * <p>Sets the code name for this client.</p>
     *
     * @param codeName a <code>String</code> providing the code name for this client.
     */
    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }
}
