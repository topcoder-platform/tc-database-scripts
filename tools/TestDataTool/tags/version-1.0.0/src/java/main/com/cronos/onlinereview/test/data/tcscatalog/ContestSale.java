/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for single contest sale to be generated. Corresponds to <code>tcs_catalog.contest_sale</code> database
 * table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ContestSale implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID for this contest sale.</p>
     */
    private long contestSaleId;

    /**
     * <p>A <code>long</code> providing the ID of a contest associated with this sale..</p>
     */
    private long contestId;

    /**
     * <p>A <code>SaleStatus</code> providing the status of this contest sale.</p>
     */
    private SaleStatus status;

    /**
     * <p>A <code>double</code> providing the price of this contest sale.</p>
     */
    private double price;

    /**
     * <p>A <code>String</code> providing the ID of a PayPal order associated with this sale.</p>
     */
    private String paypalOrderId;

    /**
     * <p>A <code>String</code> providing the ID of sale reference associated with this sale.</p>
     */
    private String saleReferenceId;

    /**
     * <p>A <code>SaleType</code> providing the type of this sale.</p>
     */
    private SaleType type;

    /**
     * <p>Gets the type of this sale.</p>
     *
     * @return a <code>SaleType</code> providing the type of this sale.
     */
    public SaleType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of this sale.</p>
     *
     * @param type a <code>SaleType</code> providing the type of this sale.
     */
    public void setType(SaleType type) {
        this.type = type;
    }

    /**
     * <p>Gets the ID of sale reference associated with this sale.</p>
     *
     * @return a <code>String</code> providing the ID of sale reference associated with this sale.
     */
    public String getSaleReferenceId() {
        return this.saleReferenceId;
    }

    /**
     * <p>Sets the ID of sale reference associated with this sale.</p>
     *
     * @param saleReferenceId a <code>String</code> providing the ID of sale reference associated with this sale.
     */
    public void setSaleReferenceId(String saleReferenceId) {
        this.saleReferenceId = saleReferenceId;
    }

    /**
     * <p>Gets the ID of a PayPal order associated with this sale.</p>
     *
     * @return a <code>String</code> providing the ID of a PayPal order associated with this sale.
     */
    public String getPaypalOrderId() {
        return this.paypalOrderId;
    }

    /**
     * <p>Sets the ID of a PayPal order associated with this sale.</p>
     *
     * @param paypalOrderId a <code>String</code> providing the ID of a PayPal order associated with this sale.
     */
    public void setPaypalOrderId(String paypalOrderId) {
        this.paypalOrderId = paypalOrderId;
    }

    /**
     * <p>Gets the price of this contest sale.</p>
     *
     * @return a <code>double</code> providing the price of this contest sale.
     */
    public double getPrice() {
        return this.price;
    }

    /**
     * <p>Sets the price of this contest sale.</p>
     *
     * @param price a <code>double</code> providing the price of this contest sale.
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * <p>Gets the status of this contest sale.</p>
     *
     * @return a <code>SaleStatus</code> providing the status of this contest sale.
     */
    public SaleStatus getStatus() {
        return this.status;
    }

    /**
     * <p>Sets the status of this contest sale.</p>
     *
     * @param status a <code>SaleStatus</code> providing the status of this contest sale.
     */
    public void setStatus(SaleStatus status) {
        this.status = status;
    }

    /**
     * <p>Gets the ID of a contest associated with this sale..</p>
     *
     * @return a <code>long</code> providing the ID of a contest associated with this sale..
     */
    public long getContestId() {
        return this.contestId;
    }

    /**
     * <p>Sets the ID of a contest associated with this sale..</p>
     *
     * @param contestId a <code>long</code> providing the ID of a contest associated with this sale..
     */
    public void setContestId(long contestId) {
        this.contestId = contestId;
    }

    /**
     * <p>Gets the ID for this contest sale.</p>
     *
     * @return a <code>long</code> providing the ID for this contest sale.
     */
    public long getContestSaleId() {
        return this.contestSaleId;
    }

    /**
     * <p>Sets the ID for this contest sale.</p>
     *
     * @param contestSaleId a <code>long</code> providing the ID for this contest sale.
     */
    public void setContestSaleId(long contestSaleId) {
        this.contestSaleId = contestSaleId;
    }

    /**
     * <p>Constructs new <code>ContestSale</code> instance. This implementation does nothing.</p>
     */
    public ContestSale() {
    }
}
