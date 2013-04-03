database studio_jive;

INSERT INTO JIVEUSERPERM VALUES(17,-1,1,1,59)
;
INSERT INTO JIVEUSERPERM VALUES(17,-1,-1,1,0)
;
INSERT INTO JIVEUSERPERM VALUES(17,-1,0,1,1)
;
INSERT INTO JIVEUSERPERM VALUES(17,-1,0,1,2)
;
INSERT INTO JIVEUSERPERM VALUES(17,-1,0,1,5)
;
INSERT INTO JIVEUSERPERM VALUES(17,-1,0,1,10)
;
INSERT INTO JIVEUSERPROP VALUES(1,'jiveAdminUserRange','15')
;
INSERT INTO JIVEID VALUES(0,9)
;
INSERT INTO JIVEID VALUES(1,11)
;
INSERT INTO JIVEID VALUES(2,16)
;
INSERT INTO JIVEID VALUES(3,3)
;
INSERT INTO JIVEID VALUES(4,1)
;
INSERT INTO JIVEID VALUES(13,1)
;
INSERT INTO JIVEID VALUES(14,2)
;
INSERT INTO JIVEID VALUES(18,1)
;
INSERT INTO JIVEID VALUES(19,1)
;
INSERT INTO JIVEID VALUES(20,1)
;
INSERT INTO JIVEID VALUES(22,1)
;
INSERT INTO JIVEID VALUES(23,1)
;
INSERT INTO JIVEID VALUES(24,1)
;
INSERT INTO JIVEID VALUES(25,1)
;
INSERT INTO JIVEID VALUES(26,1)
;
INSERT INTO JIVEID VALUES(201,1)
;
INSERT INTO JIVEID VALUES(202,1)
;

insert into jiveproperty values ('AuthFactory.className', 'com.topcoder.web.forums.model.TCAuthFactory');
insert into jiveproperty values ('cron.propertiesUpgraded', 'true');
insert into jiveproperty values ('cookieKey', '486VEaRLu5FAeXa');
insert into jiveproperty values ('jiveURL', 'http://172.16.20.41:8080/jive4');
insert into jiveproperty values ('rss.enabled', 'true');
insert into jiveproperty values ('skin.default.aLinkColor', '#ff0000');
insert into jiveproperty values ('skin.default.activeColor', '#ffffcc');
insert into jiveproperty values ('skin.default.bgColor', '#ffffff');
insert into jiveproperty values ('skin.default.borderColor', '#cccccc');
insert into jiveproperty values ('skin.default.breadcrumbColor', '#003399');
insert into jiveproperty values ('skin.default.breadcrumbColorHover', '#ff0000');
insert into jiveproperty values ('skin.default.changePasswordEnabled', 'true');
insert into jiveproperty values ('skin.default.communityDescription', 'Below you will find the topics currently being discussed. TopCoder Round Tables are forum style discussion topics. TopCoder members may use the Round Tables to discuss ideas with and make suggestions to the TopCoder community. The Round Tables are for discussions of any TopCoder related topics.');
insert into jiveproperty values ('skin.default.communityName', 'Round Tables');
insert into jiveproperty values ('skin.default.descrFontFace', 'verdana,arial,sans-serif');
insert into jiveproperty values ('skin.default.descrFontSize', '8pt');
insert into jiveproperty values ('skin.default.displayFullNames', 'false');
insert into jiveproperty values ('skin.default.evenColor', '#ffffff');
insert into jiveproperty values ('skin.default.fontFace', 'arial,helvetica,sans-serif');
insert into jiveproperty values ('skin.default.fontSize', '10pt');
insert into jiveproperty values ('skin.default.guiEditorEnabled', 'false');
insert into jiveproperty values ('skin.default.headerHTML', '<table cellspacing=0 class=pageTitleTable>\u000d\u000a    <tr>\u000d\u000a        <td width="100%" class=pageTitle><img border=0 src="images/tc/header_round_table.gif" alt="round_table"/></td><td align=right class=pageSubtitle>\u00a0\u00a0</td>\u000d\u000a    </tr>\u000d\u000a</table>');
insert into jiveproperty values ('skin.default.linkColor', '#003399');
insert into jiveproperty values ('skin.default.newAccountCreationEnabled', 'true');
insert into jiveproperty values ('skin.default.oddColor', '#eeeeee');
insert into jiveproperty values ('skin.default.showLastPostLink', 'true');
insert into jiveproperty values ('skin.default.tableHeaderBgColor', '#cccccc');
insert into jiveproperty values ('skin.default.tableHeaderColor', '#333333');
insert into jiveproperty values ('skin.default.textColor', '#000000');
insert into jiveproperty values ('skin.default.threadMode', 'flat');
insert into jiveproperty values ('skin.default.trackIP', 'true');
insert into jiveproperty values ('skin.default.useDefaultCommunityName', 'false');
insert into jiveproperty values ('skin.default.useDefaultFooterHTML', 'true');
insert into jiveproperty values ('skin.default.useDefaultHeaderHTML', 'false');
insert into jiveproperty values ('skin.default.useDefaultWelcomeText', 'false');
insert into jiveproperty values ('skin.default.usersChooseLocale', 'true');
insert into jiveproperty values ('skin.default.usersChooseThreadMode', 'false');
insert into jiveproperty values ('skin.default.vLinkColor', '#003399');
insert into jiveproperty values ('filter.global.filter3.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter3.className', 'com.jivesoftware.base.filter.URLConverter');
insert into jiveproperty values ('filter.global.filter0.className', 'com.topcoder.web.forums.util.filter.TCHTMLFilter');
insert into jiveproperty values ('filter.global.filter1.properties.underlineEnabled', 'true');
insert into jiveproperty values ('filter.global.filter0.properties.stripDisallowedTags', 'false');
insert into jiveproperty values ('filter.global.filter1.className', 'com.jivesoftware.base.filter.TextStyle');
insert into jiveproperty values ('filter.global.filter0.properties.disallowedTagsString', 'o:~,st1:~');
insert into jiveproperty values ('filter.global.filter2.className', 'com.jivesoftware.base.filter.Emoticon');
insert into jiveproperty values ('filter.global.filter0.properties.blockStart', '<pre>');
insert into jiveproperty values ('filter.initialSetup', 'true');
insert into jiveproperty values ('filter.filterClasses.filter10', 'com.jivesoftware.base.filter.Regex');
insert into jiveproperty values ('filter.filterClasses.filter7', 'com.jivesoftware.base.filter.QuoteFilter');
insert into jiveproperty values ('filter.filterClasses.filter13', 'com.topcoder.web.forums.util.filter.TCHTMLFilter');
insert into jiveproperty values ('filter.filterClasses.filter4', 'com.jivesoftware.base.filter.Profanity');
insert into jiveproperty values ('filter.filterClasses.filter0', 'com.jivesoftware.base.filter.HTMLFilter');
insert into jiveproperty values ('filter.filterClasses.filter3', 'com.jivesoftware.base.filter.URLConverter');
insert into jiveproperty values ('filter.filterClasses.filter8', 'com.jivesoftware.base.filter.Emoticon');
insert into jiveproperty values ('filter.filterClasses.filter9', 'com.jivesoftware.base.filter.MSWordToText');
insert into jiveproperty values ('filter.filterClasses.filter2', 'com.jivesoftware.base.filter.TextStyle');
insert into jiveproperty values ('filter.filterClasses.filter12', 'com.jivesoftware.base.filter.XMLFilter');
insert into jiveproperty values ('filter.filterClasses.filter6', 'com.jivesoftware.base.filter.WordBreak');
insert into jiveproperty values ('filter.filterClasses.filter1', 'com.jivesoftware.base.filter.Newline');
insert into jiveproperty values ('filter.filterClasses.filter11', 'com.jivesoftware.forum.filter.JIRAFilter');
insert into jiveproperty values ('filter.filterClasses.filter5', 'com.jivesoftware.base.filter.JavaCodeHighlighter');
insert into jiveproperty values ('filter.global.filter1.properties.italicEnabled', 'true');
insert into jiveproperty values ('filter.global.filter4.className', 'com.jivesoftware.base.filter.Newline');
insert into jiveproperty values ('filter.global.filter3.properties.newWindowEnabled', 'false');
insert into jiveproperty values ('filter.global.filter2.properties.imageURL', 'images/emoticons');
insert into jiveproperty values ('filter.global.filter1.filterTypes', '24');
insert into jiveproperty values ('filter.global.filter0.properties.disallowedKeywordsString', 'javascript');
insert into jiveproperty values ('filter.global.filter0.properties.onlyFilterBlocksEnabled', 'false');
insert into jiveproperty values ('filter.global.filter1.properties.preformatEnabled', 'true');
insert into jiveproperty values ('filter.global.filter0.properties.allowedAttributesString', 'a:href img:src,height,width');
insert into jiveproperty values ('filter.global.filter2.filterTypes', '24');
insert into jiveproperty values ('filter.global.filter4.filterTypes', '24');
insert into jiveproperty values ('filter.global.filter0.properties.restrictImageWidth', 'false');
insert into jiveproperty values ('filter.global.filter0.properties.allowSymbols', 'true');
insert into jiveproperty values ('filter.global.filter4.properties.nobrEnabled', 'false');
insert into jiveproperty values ('filter.global.filter0.properties.allowedTagsString', 'annot,a,abbr,acronym,blockquote,b,br,em,font,i,img,li,ol,p,pre,s,strike,sub,sup,strong,table,td,tr,tt,u,ul');
insert into jiveproperty values ('filter.global.filter1.properties.boldEnabled', 'true');
insert into jiveproperty values ('filter.global.filter0.filterTypes', '16');
insert into jiveproperty values ('filter.global.filter0.properties.blockEnd', '</pre>');
insert into jiveproperty values ('filter.global.filter0.properties.maxImageWidth', '600');
insert into jiveproperty values ('filter.global.filterCount', '5');
insert into jiveproperty values ('watches.replyToEmailSuffix', '@ec2-107-21-70-51.compute-1.amazonaws.com');
insert into jiveproperty values ('watches.replyTo.email.fromName', 'Topcoder Fourms');
insert into jiveproperty values ('watches.replyTo.email.fromEmail', 'forums-not-reply@topcoder.com');
insert into jiveproperty values ('watches.replyTo.email.unknownUser.subject', 'The user of Forums Reply Identifier ${replyToIdentifier} is unknown.');
insert into jiveproperty values ('watches.replyTo.email.unknownUser.body', 'Sorry, the user of Forums Reply Identifier ${replyToIdentifier} is unknown.');
insert into jiveproperty values ('watches.replyTo.email.invalidIdentifier.subject', 'Invalid Forums Reply Identifier ${replyToIdentifier}');
insert into jiveproperty values ('watches.replyTo.email.invalidIdentifier.body', 'Sorry, ${username}, the Forums Reply Identifier ${replyToIdentifier} is unknown.');

insert into jiveproperty values ('watches.email.fromEmail', 'service@topcoder.com');
insert into jiveproperty values ('watches.email.fromName', 'Topcoder Forums');
insert into jiveproperty values ('watches.emailNotifyEnabled', 'true');
insert into jiveproperty values ('watches.enabled', 'true');
insert into jiveproperty values ('mail.smtp.host', 'localhost');
insert into jiveproperty values ('mail.smtp.port', '25');

insert into jiveuserperm values (17,-1,100129,1,59);
insert into jiveuserperm values (17,-1,132458,1,59);


insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  VALUES (1, 	"Forums", "",	0	,1330888958659,	1	,14);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  VALUES(2,"Round Tables","This is where TopCoder Studio members can go to discuss the details of TopCoder Studio Contests. You will also find forums for giving feedback and suggestions, and pointing out any bugs you may have found.",	1155049876565,	1330729337174,	2,	3);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(3,	"TopCoder Studio Contests",	"Discuss anything about a particular TopCoder Studio Contest here.", 1155049944637, 1330888958659, 4, 5);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(4,	"TopCoder Cockpit"	,"Forums for both clients and Studio members to discuss how to launch and participate in Cockpit contests.",	1217966586433,	1324392729524, 8, 9);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(9	,"Bug Race Competitions - Studio", 	null,	1228920017020,	1330706672693,	6,	7);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(10, "Protected Forums", null, 1234964530979,	 1330869031010	,10	,11);
insert into jivecategory(categoryid,	name	,description,	creationdate	,modificationdate	,lft,	rgt)
  values(11,	"TopCoder Cookbook", null, 1242667146044, 1283515224764, 	12,	13);

insert into jiveforum
  values(6, "General Discussion", "round_tables.general_discussion", "Discuss anything ""TopCoder Studio"" that doesn't fit into the other categories.", 1, 1, 1155050346706, 1330729337174, 2, 3, 2313);
insert into jiveforum
  values(2, "Bugs, Suggestions and General Feedback", "round_tables.bugs__suggestions_and_general_feedback", "Report bugs, request enhancements, provide general feedback on existing functionality.", 1, 1, 1155050092695, 1330098604152, 2, 0, 467);
insert into jiveforum
  values(3, "Getting Started in TopCoder Studio Contests", "round_tables.getting_started_in_topcoder_studio", "Check here for help and advice on getting started as a competitor.", 1, 1, 1155050220771, 1321842832954, 2, 1, 88);
insert into jiveforum
  values(5, "Educational Discussion", "round_tables.educational_discussion_1", "Give and receive helpful advice.", 1, 1, 1155050319473, 1319690511358, 2, 2, 154);
insert into jiveforum
  values(1995, "TCO General Discussions", "round_tables.tco_general_discussions", "Discussions about the Studio track in the current TCO Tournament.", 1, 1, 1303307053419, 1327936362414, 2, 4, 210);

insert into jivecategoryprop values (1,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (2,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (3,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (4,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (9,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (10,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (11,'showEmptyForumsOnMain', 'true');
insert into jivecategoryprop values (2,'leftNavName', 'Round Tables');
insert into jivecategoryprop values (3,'leftNavName', 'TopCoder Studio Contests');

