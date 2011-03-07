/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.generator;

/**
 * <p>A generator for the IDs to be used when generating the test data for various projects and accounts.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class IdGenerator {

    /**
     * <p>A <code>long</code> providing the current ID.</p>
     */
    private long currentId;

    /**
     * <p>Constructs new <code>IdGenerator</code> instance with specified ID to start generation from.</p>
     * 
     * @param currentId a <code>long</code> providing the current ID.
     */
    public IdGenerator(long currentId) {
        this.currentId = currentId;
    }

    /**
     * <p>Gets the next ID to be used in data generation.</p>
     * 
     * @return a <code>long</code> providing the next ID.
     */
    public long getNextId() {
        return ++this.currentId;
    }
}
