/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing component catalog types. Corresponds to <code>tcs_catalog.catalog</code> database
 * table.</p>
 *
 * @author isv
 * @version 1.0
 */
public enum Catalog {

    JAVA(1, "Java", 5801776),

    DON_NET(2, ".Net", 5801777),

    FLASH(3, "Flash", 8459260),

    APPLICATION(4, "Application", 9926572),

    CPP(5, "C++", 26805357),

    PHP(6, "PHP", 27202903),

    ACTION_SCRIPT(7, "Action Script", 27202905),

    RUBY(8, "Ruby", 27202907),

    OBJECTIVE_C(9, "Objective C", 27202909),

    FLEX(10, "Flex", 27202911),

    JAVASCRIPT(11, "Javascript", 27202913),

    PYTHON(13, "Python", 27355736);

    /**
     * <p>A <code>long</code> providing the ID of this catalog type.</p>
     */
    private long catalogId;

    /**
     * <p>A <code>String</code> providing the name of this catalog type.</p>
     */
    private String name;

    /**
     * <p>A <code>long</code> providing the ID for the root category for this catalog type.</p>
     */
    private long rootCategoryId;

    /**
     * <p>Constructs new <code>Catalog</code> instance with specified ID and name.</p>
     *
     * @param catalogId a <code>long</code> providing the ID of this catalog type.
     * @param name a <code>String</code> providing the name of this catalog type.
     * @param rootCategoryId a <code>long</code> providing the ID for the root category for this catalog type.
     */
    private Catalog(long catalogId, String name, long rootCategoryId) {
        this.catalogId = catalogId;
        this.name = name;
        this.rootCategoryId = rootCategoryId;
    }

    /**
     * <p>Gets the ID for the root category for this catalog type..</p>
     *
     * @return a <code>long</code> providing the ID for the root category for this catalog type..
     */
    public long getRootCategoryId() {
        return this.rootCategoryId;
    }

    /**
     * <p>Gets the name of this catalog type.</p>
     *
     * @return a <code>String</code> providing the name of this catalog type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this catalog type.</p>
     *
     * @return a <code>long</code> providing the ID of this catalog type.
     */
    public long getCatalogId() {
        return this.catalogId;
    }
}
