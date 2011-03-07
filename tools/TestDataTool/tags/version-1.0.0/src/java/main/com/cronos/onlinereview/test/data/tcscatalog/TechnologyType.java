/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.test.data.tcscatalog;

/**
 * <p>An enumeration over existing technology types.</p>
 * 
 * @author isv
 * @version 1.0
 */
public enum TechnologyType {
    J2EE(1, "J2EE"),

    Java(2, "Java"),

    JavaBean(3, "JavaBean"),

    EJB(4, "EJB"),

    JSP(5, "JSP"),

    Servlet(6, "Servlet"),

    Applet(7, "Applet"),

    JavaApplication(8, "Java Application"),

    JMS(9, "JMS"),

    WebServices(10, "Web Services"),

    DotNET(11, ".NET"),

    VB(12, "VB"),

    CPP(13, "C++"),

    COM(14, "COM"),

    XML(15, "XML"),

    XSL(16, "XSL"),

    JDBC(17, "JDBC"),

    HTML(4202325, "HTML"),

    HTTP(4202326, "HTTP"),

    RMI(4202327, "RMI"),

    CSHARP(5905414, "C#"),

    CustomTag(7352908, "Custom Tag"),

    VBNET(7375010, "VB.NET"),

    Remoting(8352145, "Remoting"),

    ActionScript(8490749, "ActionScript"),

    Flash(8490750, "Flash"),

    JSF(14999206, "JSF"),

    J2ME(15035679, "J2ME"),

    MIDP2_0(15035680, "MIDP 2.0"),

    XUL(22839202, "XUL"),

    JavaScript(22839204, "JavaScript"),

    WinFormsControls(24665371, "WinForms Controls"),

    DotNET2_0(26740928, ".NET 2.0"),

    ASPNET(26740929, "ASP.NET"),

    WindowsServer2003(26740930, "Windows Server 2003"),

    IIS(26740931, "IIS"),

    Oracle10g(26740932, "Oracle 10g"),

    Oracle9i(26740933, "Oracle 9iv"),

    SQLServer2000(26740934, "SQL Server 2000"),

    SQLServer2005(26753737, "SQL Server 2005"),

    ADONET(26753797, "ADO.NET"),

    ASPNETAJAX(26769147, "ASP.NET AJAX"),

    COMPLUS(26783183, "COM+"),

    WindowsWorkflowFoundation(26854281, "Windows Workflow Foundation"),

    WindowsCommunicationFoundation(26854283, "Windows Communication Foundation"),

    XAML(26930935, "XAML"),

    DotNET3_0(26930937, ".NET 3.0"),

    MicrosoftSilverLight(26930938, "Microsoft SilverLight"),

    Spring(26951706, "Spring"),

    Castor(26951707, "Castor"),

    Dojo(26951708, "Dojo"),

    AJAX(26951709, "AJAX"),

    Struts(27004060, "Struts"),

    CSS(27004061, "CSS"),

    WPF(27048250, "WPF"),

    ClickOnce(27048486, "ClickOnce"),

    PostgreSQL(27050144, "PostgreSQL"),

    DotNET3_5(27052210, ".NET 3.5"),

    DotNETSystemAddins(27052211, ".NET System.Addins"),

    MSMQ(27081642, "MSMQ"),

    SWT(27093852, "SWT"),

    JFace(27093853, "JFace"),

    EclipsePlugin(27093857, "Eclipse Plugin"),

    JSON(27094426, "JSON"),

    JUnit(27114506, "JUnit"),

    Swing(27114507, "Swing"),

    EJB3(27141050, "EJB 3"),

    JPA(27141051, "JPA"),

    Hibernate(27141052, "Hibernate"),

    LDAP(27154786, "LDAP"),

    ActiveDirectory(27154787, "Active Directory"),

    C(27167847, "C"),

    MySQL(27167850, "MySQL"),

    ApacheDerby(27169590, "Apache Derby"),

    JBossSeam(27188285, "JBoss Seam"),

    Flex(27202765, "Flex"),

    PHP(27203172, "PHP"),

    Ruby(27203173, "Ruby"),

    ObjectiveC(27203174, "Objective C");

    /**
     * <p>A <code>long</code> providing the ID of this technology type.</p>
     */
    private long technologyTypeId;

    /**
     * <p>A <code>String</code> providing the name of this technology type.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>TechnologyType</code> instance with specified ID and name.</p>
     *
     * @param technologyTypeId a <code>long</code> providing the ID of this technology type.
     * @param name a <code>String</code> providing the name of this technology type.
     */
    private TechnologyType(long technologyTypeId, String name) {
        this.technologyTypeId = technologyTypeId;
        this.name = name;
    }

    /**
     * <p>Gets the name of this technology type.</p>
     *
     * @return a <code>String</code> providing the name of this technology type.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Gets the ID of this technology type.</p>
     *
     * @return a <code>long</code> providing the ID of this technology type.
     */
    public long getTechnologyTypeId() {
        return this.technologyTypeId;
    }
}
