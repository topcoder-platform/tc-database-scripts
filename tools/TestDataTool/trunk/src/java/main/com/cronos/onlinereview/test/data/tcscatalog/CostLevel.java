/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing cost level for projects.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum CostLevel {
    
    LOW("A", 6001.00, 30.00, 360.00, 605.00, 240.00, 800.00, 400.00),
    
    MEDIUM("B", 6001.00, 30.00, 450.00, 683.00, 300.00, 1000.00, 500.00),
    
    HIGH("C", 6001.00, 30.00, 540.00, 761.00, 380.00, 1200.00, 600.00);

    /**
     * <p>A <code>String</code> providing the code identifying the cost level.</p>
     */
    private String code;

    /**
     * <p>A <code>double</code> providing the admin fee per cost level.</p>
     */
    private double adminFee;

    /**
     * <p>A <code>double</code> providing the specification review fee per cost level.</p>
     */
    private double specReviewFee;

    /**
     * <p>A <code>double</code> providing the cost for digital run points per cost level.</p>
     */
    private double digitalRunPoints;

    /**
     * <p>A <code>double</code> providing the review cost per cost level.</p>
     */
    private double reviewCost;

    /**
     * <p>A <code>double</code> providing the reliability bonus cost per cost level.</p>
     */
    private double reliabilityBonus;

    /**
     * <p>A <code>double</code> providing the cost for first place per cost level.</p>
     */
    private double firstPlaceCost;

    /**
     * <p>A <code>double</code> providing the second place cost.</p>
     */
    private double secondPlaceCost;

    /**
     * <p>Constructs new <code>CostLevel</code> instance.</p>
     * 
     * @param code a <code>String</code> providing the code identifying the cost level.
     * @param adminFee a <code>double</code> providing the admin fee per cost level.
     * @param specReviewFee a <code>double</code> providing the specification review fee per cost level.
     * @param digitalRunPoints a <code>double</code> providing the cost for digital run points per cost level.
     * @param reviewCost a <code>double</code> providing the review cost per cost level.
     * @param reliabilityBonus a <code>double</code> providing the reliability bonus cost per cost level.
     * @param firstPlaceCost a <code>double</code> providing the first place cost.
     * @param secondPlaceCost a <code>double</code> providing the second place cost.
     */
    private CostLevel(String code, double adminFee, double specReviewFee, double digitalRunPoints, double reviewCost,
                      double reliabilityBonus, double firstPlaceCost, double secondPlaceCost) {
        this.code = code;
        this.adminFee = adminFee;
        this.specReviewFee = specReviewFee;
        this.digitalRunPoints = digitalRunPoints;
        this.reviewCost = reviewCost;
        this.reliabilityBonus = reliabilityBonus;
        this.firstPlaceCost = firstPlaceCost;
        this.secondPlaceCost = secondPlaceCost;
    }

    /**
     * <p>Gets the second place cost.</p>
     *
     * @return a <code>double</code> providing the second place cost.
     */
    public double getSecondPlaceCost() {
        return this.secondPlaceCost;
    }

    /**
     * <p>Gets the cost for first place per cost level.</p>
     *
     * @return a <code>double</code> providing the cost for first place per cost level.
     */
    public double getFirstPlaceCost() {
        return this.firstPlaceCost;
    }

    /**
     * <p>Gets the reliability bonus cost per cost level.</p>
     *
     * @return a <code>double</code> providing the reliability bonus cost per cost level.
     */
    public double getReliabilityBonus() {
        return this.reliabilityBonus;
    }

    /**
     * <p>Gets the review cost per cost level.</p>
     *
     * @return a <code>double</code> providing the review cost per cost level.
     */
    public double getReviewCost() {
        return this.reviewCost;
    }

    /**
     * <p>Gets the cost for digital run points per cost level.</p>
     *
     * @return a <code>double</code> providing the cost for digital run points per cost level.
     */
    public double getDigitalRunPoints() {
        return this.digitalRunPoints;
    }

    /**
     * <p>Gets the specification review fee per cost level.</p>
     *
     * @return a <code>double</code> providing the specification review fee per cost level.
     */
    public double getSpecReviewFee() {
        return this.specReviewFee;
    }

    /**
     * <p>Gets the admin fee per cost level.</p>
     *
     * @return a <code>double</code> providing the admin fee per cost level.
     */
    public double getAdminFee() {
        return this.adminFee;
    }

    /**
     * <p>Gets the code identifying the cost level.</p>
     *
     * @return a <code>String</code> providing the code identifying the cost level.
     */
    public String getCode() {
        return this.code;
    }
}
