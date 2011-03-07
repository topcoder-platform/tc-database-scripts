/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;

/**
 * <p>A DTO for a single version for the component from the catalog which may be associated with the project.
 * Corresponds to <code>tcs_catalog.comp_versions</code> database table.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class ComponentVersion implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID for this component version.</p>
     */
    private long versionId;

    /**
     * <p>A <code>int</code> providing the version number.</p>
     */
    private int versionNumber;

    /**
     * <p>A <code>String</code> providing the version text.</p>
     */
    private String versionText;

    /**
     * <p>A <code>long</code> providing the ID for the phase this version belongs to.</p>
     */
    private long phaseId;

    /**
     * <p>A <code>double</code> providing the price for this component version.</p>
     */
    private double price;

    /**
     * <p>A <code>String</code> providing the comments for this component version.</p>
     */
    private String comments;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether this component version is suspended or not.</p>
     */
    private boolean suspended;

    /**
     * <p>A <code>TechnologyType[]</code> providing the list of technologies involved in project.</p>
     */
    private TechnologyType[] technologies;

    /**
     * <p>Constructs new <code>ComponentVersion</code> instance. This implementation does nothing.</p>
     */
    public ComponentVersion() {
    }

    /**
     * <p>Gets the flag indicating whether this component version is suspended or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether this component version is suspended or not.
     */
    public boolean isSuspended() {
        return this.suspended;
    }

    /**
     * <p>Sets the flag indicating whether this component version is suspended or not.</p>
     *
     * @param suspended a <code>boolean</code> providing the flag indicating whether this component version is suspended or not.
     */
    public void setSuspended(boolean suspended) {
        this.suspended = suspended;
    }


    /**
     * <p>Gets the comments for this component version.</p>
     *
     * @return a <code>String</code> providing the comments for this component version.
     */
    public String getComments() {
        return this.comments;
    }

    /**
     * <p>Sets the comments for this component version.</p>
     *
     * @param comments a <code>String</code> providing the comments for this component version.
     */
    public void setComments(String comments) {
        this.comments = comments;
    }

    /**
     * <p>Gets the price for this component version.</p>
     *
     * @return a <code>double</code> providing the price for this component version.
     */
    public double getPrice() {
        return this.price;
    }

    /**
     * <p>Sets the price for this component version.</p>
     *
     * @param price a <code>double</code> providing the price for this component version.
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * <p>Gets the ID for the phase this version belongs to.</p>
     *
     * @return a <code>long</code> providing the ID for the phase this version belongs to.
     */
    public long getPhaseId() {
        return this.phaseId;
    }

    /**
     * <p>Sets the ID for the phase this version belongs to.</p>
     *
     * @param phaseId a <code>long</code> providing the ID for the phase this version belongs to.
     */
    public void setPhaseId(long phaseId) {
        this.phaseId = phaseId;
    }


    /**
     * <p>Gets the version text.</p>
     *
     * @return a <code>String</code> providing the version text.
     */
    public String getVersionText() {
        return this.versionText;
    }

    /**
     * <p>Sets the version text.</p>
     *
     * @param versionText a <code>String</code> providing the version text.
     */
    public void setVersionText(String versionText) {
        this.versionText = versionText;
    }

    /**
     * <p>Gets the version number.</p>
     *
     * @return a <code>int</code> providing the version number.
     */
    public int getVersionNumber() {
        return this.versionNumber;
    }

    /**
     * <p>Sets the version number.</p>
     *
     * @param versionNumber a <code>int</code> providing the version number.
     */
    public void setVersionNumber(int versionNumber) {
        this.versionNumber = versionNumber;
    }

    /**
     * <p>Gets the ID for this component version.</p>
     *
     * @return a <code>long</code> providing the ID for this component version.
     */
    public long getVersionId() {
        return this.versionId;
    }

    /**
     * <p>Sets the ID for this component version.</p>
     *
     * @param versionId a <code>long</code> providing the ID for this component version.
     */
    public void setVersionId(long versionId) {
        this.versionId = versionId;
    }

    /**
     * <p>Gets the list of technologies involved in project.</p>
     *
     * @return a <code>TechnologyType[]</code> providing the list of technologies involved in project.
     */
    public TechnologyType[] getTechnologies() {
        return this.technologies;
    }

    /**
     * <p>Sets the list of technologies involved in project.</p>
     *
     * @param technologies a <code>TechnologyType[]</code> providing the list of technologies involved in project.
     */
    public void setTechnologies(TechnologyType[] technologies) {
        this.technologies = technologies;
    }
}
