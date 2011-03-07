/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

import java.io.Serializable;
import java.util.List;

/**
 * <p>A DTO for a component from the catalog which may be associated with the project. Corresponds to 
 * <code>tcs_catalog.comp_catalog</code> database table.</p>
 *
 * @author isv
 * @version 1.0
 */
public class Component implements Serializable {

    /**
     * <p>A <code>boolean</code> indicating whether the component is public or not.</p>
     */
    private boolean visible;

    /**
     * <p>A <code>long</code> providing the ID for the catalog component associated with this component.</p>
     */
    private long componentId;

    /**
     * <p>A <code>String</code> providing the short description of this component.</p>
     */
    private String shortDesc;

    /**
     * <p>A <code>String</code> providing the functional description of this component.</p>
     */
    private String functionalDesc;

    /**
     * <p>A <code>String</code> providing the name of this component.</p>
     */
    private String componentName;

    /**
     * <p>A <code>String</code> providing the description of this component.</p>
     */
    private String description;

    /**
     * <p>A <code>long</code> providing the ID referencing the current status for this component.</p>
     */
    private long statusId;

    /**
     * <p>A <code>long</code> providing the ID referencing the root category for this component.</p>
     */
    private long rootCategoryId;

    /**
     * <p>A <code>long</code> providing the ID referencing the current component's version.</p>
     */
    private long currentVersionId;

    /**
     * <p>A <code>List</code> providing the versions for this component.</p>
     */
    private List<ComponentVersion> versions;

    /**
     * <p>Constructs new <code>Component</code> instance. This implementation does nothing.</p>
     */
    public Component() {
    }

    /**
     * <p>Gets the versions for this component.</p>
     *
     * @return a <code>List</code> providing the versions for this component.
     */
    public List<ComponentVersion> getVersions() {
        return this.versions;
    }

    /**
     * <p>Sets the versions for this component.</p>
     *
     * @param versions a <code>List</code> providing the versions for this component.
     */
    public void setVersions(List<ComponentVersion> versions) {
        this.versions = versions;
    }

    /**
     * <p>Gets the ID referencing the current component's version.</p>
     *
     * @return a <code>long</code> providing the ID referencing the current component's version.
     */
    public long getCurrentVersionId() {
        return this.currentVersionId;
    }

    /**
     * <p>Sets the ID referencing the current component's version.</p>
     *
     * @param currentVersionId a <code>long</code> providing the ID referencing the current component's version.
     */
    public void setCurrentVersionId(long currentVersionId) {
        this.currentVersionId = currentVersionId;
    }

    /**
     * <p>Gets the ID referencing the root category for this component.</p>
     *
     * @return a <code>long</code> providing the ID referencing the root category for this component.
     */
    public long getRootCategoryId() {
        return this.rootCategoryId;
    }

    /**
     * <p>Sets the ID referencing the root category for this component.</p>
     *
     * @param rootCategoryId a <code>long</code> providing the ID referencing the root category for this component.
     */
    public void setRootCategoryId(long rootCategoryId) {
        this.rootCategoryId = rootCategoryId;
    }

    /**
     * <p>Gets the ID referencing the current status for this component.</p>
     *
     * @return a <code>long</code> providing the ID referencing the current status for this component.
     */
    public long getStatusId() {
        return this.statusId;
    }

    /**
     * <p>Sets the ID referencing the current status for this component.</p>
     *
     * @param statusId a <code>long</code> providing the ID referencing the current status for this component.
     */
    public void setStatusId(long statusId) {
        this.statusId = statusId;
    }

    /**
     * <p>Gets the description of this component.</p>
     *
     * @return a <code>String</code> providing the description of this component.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this component.</p>
     *
     * @param description a <code>String</code> providing the description of this component.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the name of this component.</p>
     *
     * @return a <code>String</code> providing the name of this component.
     */
    public String getComponentName() {
        return this.componentName;
    }

    /**
     * <p>Sets the name of this component.</p>
     *
     * @param componentName a <code>String</code> providing the name of this component.
     */
    public void setComponentName(String componentName) {
        this.componentName = componentName;
    }


    /**
     * <p>Gets the functional description of this component.</p>
     *
     * @return a <code>String</code> providing the functional description of this component.
     */
    public String getFunctionalDesc() {
        return this.functionalDesc;
    }

    /**
     * <p>Sets the functional description of this component.</p>
     *
     * @param functionalDesc a <code>String</code> providing the functional description of this component.
     */
    public void setFunctionalDesc(String functionalDesc) {
        this.functionalDesc = functionalDesc;
    }

    /**
     * <p>Gets the short description of this component.</p>
     *
     * @return a <code>String</code> providing the short description of this component.
     */
    public String getShortDesc() {
        return this.shortDesc;
    }

    /**
     * <p>Sets the short description of this component.</p>
     *
     * @param shortDesc a <code>String</code> providing the short description of this component.
     */
    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    /**
     * <p>Checks if this component is public or not.</p>
     *
     * @return <code>true</code> if component is publicly visible; <code>false</code> otherwise.
     */
    public boolean isVisible() {
        return visible;
    }

    /**
     * <p>Sets the flag indicating whether this component is public or not.</p>
     *
     * @param visible <code>true</code> if component is publicly visible; <code>false</code> otherwise.
     */
    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    /**
     * <p>Gets the component ID.</p>
     *
     * @return a <code>long</code> providing the ID for the catalog component associated with this component.
     */
    public long getComponentId() {
        return this.componentId;
    }

    /**
     * <p>Sets the component ID.</p>
     *
     * @param componentId a <code>long</code> providing the ID for the catalog component associated with this component.
     */
    public void setComponentId(long componentId) {
        this.componentId = componentId;
    }

    /**
     * <p>Gets the current version for this component.</p>
     *
     * @return a <code>ComponentVersion</code> providing the details for current version for this component
     *         or <code>null</code> if there is no current version.
     */
    public ComponentVersion getCurrentVersion() {
        if (this.versions != null) {
            for (ComponentVersion version : this.versions) {
                if (version.getVersionId() == getCurrentVersionId()) {
                    return version;
                }
            }
        }
        return null;
    }
}
