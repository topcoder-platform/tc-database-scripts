/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.timeoltp;

import java.io.Serializable;

/**
 * <p>A DTO for a single payment terms. Corresponds to <code>time_oltp.payment_terms</code> table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class PaymentTerms implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID for these payment terms.</p>
     */
    private long paymentTermsId;

    /**
     * <p>A <code>String</code> providing the description of this payment terms.</p>
     */
    private String description;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether these terms are active or not.</p>
     */
    private boolean active;

    /**
     * <p>A <code>int</code> providing the term ID.</p>
     */
    private int term;

    /**
     * <p>Constructs new <code>PaymentTerms</code> instance. This implementation does nothing.</p>
     */
    public PaymentTerms() {
    }

    /**
     * <p>Gets the description of this payment terms.</p>
     *
     * @return a <code>String</code> providing the description of this payment terms.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this payment terms.</p>
     *
     * @param description a <code>String</code> providing the description of this payment terms.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the ID for these payment terms.</p>
     *
     * @return a <code>long</code> providing the ID for these payment terms.
     */
    public long getPaymentTermsId() {
        return this.paymentTermsId;
    }

    /**
     * <p>Sets the ID for these payment terms.</p>
     *
     * @param paymentTermsId a <code>long</code> providing the ID for these payment terms.
     */
    public void setPaymentTermsId(long paymentTermsId) {
        this.paymentTermsId = paymentTermsId;
    }

    /**
     * <p>Gets the flag indicating whether these terms are active or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether these terms are active or not.
     */
    public boolean getActive() {
        return this.active;
    }

    /**
     * <p>Sets the flag indicating whether these terms are active or not.</p>
     *
     * @param active a <code>boolean</code> providing the flag indicating whether these terms are active or not.
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * <p>Gets the term ID.</p>
     *
     * @return a <code>int</code> providing the term ID.
     */
    public int getTerm() {
        return this.term;
    }

    /**
     * <p>Sets the term ID.</p>
     *
     * @param term a <code>int</code> providing the term ID.
     */
    public void setTerm(int term) {
        this.term = term;
    }
}
