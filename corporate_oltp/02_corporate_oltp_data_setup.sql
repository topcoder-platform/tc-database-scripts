database corporate_oltp;

insert into 'informix'.permission_type (permission_type_id, name) values(0, 'project_report');
insert into 'informix'.permission_type (permission_type_id, name) values(1, 'project_read');
insert into 'informix'.permission_type (permission_type_id, name) values(2, 'project_write');
insert into 'informix'.permission_type (permission_type_id, name) values(3, 'project_full');
insert into 'informix'.permission_type (permission_type_id, name) values(4, 'contest_read');
insert into 'informix'.permission_type (permission_type_id, name) values(5, 'contest_write');
insert into 'informix'.permission_type (permission_type_id, name) values(6, 'contest_full');


INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (1, 'Active', 'Active', 'System', current, 'System', current);
INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (2, 'Inactive', 'Inactive', 'System', current, 'System', current);
INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (3, 'Cancelled', 'Cancelled', 'System', CURRENT, 'System', CURRENT);
INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (4, 'Completed', 'Completed', 'System', CURRENT, 'System', CURRENT);

INSERT INTO 'informix'.tc_direct_project_status_lu(project_status_id,name,description,create_user,create_date,modify_user,modify_date) VALUES (5, 'Draft', 'Draft', 'System', CURRENT, 'System', CURRENT);


INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(0, 'Statistics');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(1, 'Email');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(2, 'Graph');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(4, 'Report');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(7, 'Applet');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(9, 'Job Posting');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(8, 'TCES');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(10, 'Util');
INSERT INTO 'informix'.command_group_lu(command_group_id, command_group_name)
  VALUES(11009, 'Corp');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(5, 'sd', 1003, 'Start date');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(6, 'ed', 1003, 'End date');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(18, 'ci', 1001, 'Command ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(19, 'ji', 1001, 'Job ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(20, 'email', 1005, 'E-mail Address');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(21, 'subject', 1005, 'Subject');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(22, 'sector', 1005, 'Sector Desc');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(3, 'cr', 1001, 'Coder ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(23, 'rd', 1001, 'Round ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(24, 'ct', 1001, 'Coder Type Id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(25, 'dq', 1001, 'Demographic Question Id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(39, 'top', 1001, 'No of Top Rated Coders');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1000, 'uid', 1001, 'TCES User ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(27, 'rn', 1001, 'min rating');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(28, 'rx', 1001, 'max rating');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(29, 'ha', 1005, 'handle');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(30, 'scs', 1005, 'state codes');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1001, 'cid', 1001, 'TCES Campaign ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(32, 'nrn', 1001, 'min num ratings');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(33, 'nrx', 1001, 'max num ratings');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(34, 'gn', 1001, 'min grad year');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(35, 'gx', 1001, 'max grad year');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(36, 'cts', 1005, 'coder types');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(37, 'fn', 1005, 'first name');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(38, 'ln', 1005, 'last name');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(41, 'cm', 1001, 'company id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(42, 'it', 1001, 'image type id');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1002, 'jid', 1001, 'TCES Job ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1003, 'mid', 1001, 'TCES Member ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(1100, 'hn', 1005, 'User Handle');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(43, 'cd', 1001, 'Contest ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(44, 'rds', 1005, 'round ids');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11001, 'sdir', 1004, 'Sort direction');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11002, 'sc', 1001, 'Sort column');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11008, 'comid', 1001, 'company ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11003, 'stateID', 1005, 'state ID (2 letter combination)');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11004, 'countryID', 1005, 'country ID (3 digit combination)');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(11005, 'puid', 1001, 'TCES primary User ID');
INSERT INTO 'informix'.input_lu(input_id, input_code, data_type_id, input_desc)
  VALUES(12105, 'prodID', 1001, 'Product ID');
INSERT INTO 'informix'.unit_type_lu(unit_type_id, unit_type_desc, create_date, modify_date)
  VALUES(1, 'Time', EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND, EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND);
INSERT INTO 'informix'.unit_type_lu(unit_type_id, unit_type_desc, create_date, modify_date)
  VALUES(2, 'Item', EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND, EXTEND(MDY(3,5,2003), YEAR to SECOND)+11 UNITS HOUR+13 UNITS MINUTE+46 UNITS SECOND);

insert into spec_review_status_type_lu(review_status_type_id, name)
values (1, 'PASSED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (2, 'FAILED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (3, 'PENDING');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (4, 'READY');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (5, 'REVIEWER_ASSIGNED');

insert into spec_review_status_type_lu(review_status_type_id, name)
values (6, 'NOT_READY');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (1, 1, 'Contest Selection');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (2, 1, 'Contest Overview');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (3, 1, 'Contest Details');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (4, 1, 'Contest Specs');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (5, 1, 'Attached Files');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (6, 1, 'Contest Schedule');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (7, 0, 'Contest Selection');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (8, 0, 'Contest Overview');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (9, 0, 'Contest Details');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (10, 0, 'Attached Files');

insert into spec_review_section_type_lu(review_section_type_id, is_studio, name)
values (11, 0, 'Contest Schedule');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (1, 'ADMIN');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (2, 'CREATOR');

insert into spec_review_user_role_type_lu(review_user_role_type_id, name)
values (3, 'REVIEWER');


insert into direct_project_type VALUES (1, "Web Application");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (10, 1, "Ecommerce");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (11, 1, "Back Office");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (12, 1, "Community/Social Platforms");
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (13,1,'B2B');
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (14,1,'B2C');
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (15,1,'Portal');

insert into direct_project_type VALUES (2, "Web Site");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (20, 2, "Marketing");

insert into direct_project_type VALUES (3, "Mobile Application");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (30, 3, "iPhone");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (31, 3, "Android Phone");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (32, 3, "iPad");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (33, 3, "Multi-Platform");
INSERT INTO direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (34,3,'Android Tablet');


insert into direct_project_type VALUES (4, "Desktop Application");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (40, 4, "Windows App");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (41, 4, "Mac OSX App");

insert into direct_project_type VALUES (5, "Business Intelligence");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (50, 5, "Report Development");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (51, 5, "Data Warehousing");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (52, 5, "Analytics");

insert into direct_project_type VALUES (6, "Content Creation");

insert into direct_project_type VALUES (7, "Presentation");

insert into direct_project_type VALUES (8, "Other");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (80, 8, "Conversion/Migration");
insert into direct_project_category (direct_project_category_id,direct_project_type_id,name) VALUES (81, 8, "QA Existing Product"); 


-- Project type
INSERT INTO direct_project_type(direct_project_type_id, name) VALUES(9, 'Custom Project');
INSERT INTO direct_project_type(direct_project_type_id, name) VALUES(10, 'Mobile Project');
INSERT INTO direct_project_type(direct_project_type_id, name) VALUES(11, 'Presentation Project');
INSERT INTO direct_project_type(direct_project_type_id, name) VALUES(12, 'Analytic Project');

-- Test data for project mobile type.
INSERT INTO project_question VALUES(1, "What type of app do you want to build: cross-platform, native, or web?", 10, "", "");
INSERT INTO project_question VALUES(2, "Do you require the use of a specific cross-platform framework?", 10, "", "");
INSERT INTO project_question VALUES(3, "What operating system(s) do you want to target?", 10, "", "");
INSERT INTO project_question VALUES(4, "Original or adaptation||Is the design of your mobile app based on an existing application?", 10, "", "");
INSERT INTO project_question VALUES(5, "What type of application are you adapting?", 10, "", "");
INSERT INTO project_question VALUES(6, "Form factor", 10, "", "");
INSERT INTO project_question VALUES(7, "Screen orientation", 10, "", "");
INSERT INTO project_question VALUES(8, "Screen resolution", 10, "", "");
INSERT INTO project_question VALUES(9, "Motion sensing", 10, "", "");
INSERT INTO project_question VALUES(10, "Geolocation", 10, "", "");
INSERT INTO project_question VALUES(11, "Camera", 10, "", "");
INSERT INTO project_question VALUES(12, "Additional features", 10, "", " input[name=aditional]");
INSERT INTO project_question VALUES(13, "<span>4</span>Detailed specifications||Type:||Source:", 10, "", ".newProjectStep .stepFourth2 .tableContainer table.addedItem tr");

INSERT INTO project_question_option VALUES(1, 1, "Cross-platform app||A single development effort results in a set of native apps that look and feel the same while running on different operating systems. A cross-platform app can use many of the hardware features on each device.", "crossPlatformApp", "f", "");
INSERT INTO project_question_option VALUES(2, 1, "Native app||The app is developed for a family of mobile devices that use a specific operating system, allowing it to take full advantage of hardware capabilities. A separate development effort is required for each operating system.", "nativeApp", "f", "");
INSERT INTO project_question_option VALUES(3, 1, "Web app||The application is hosted 'in the cloud' and users access it through their device's web browser. All Internet-connected mobile devices can use the same web app. However, a web app cannot integrate tightly with the operating system and has minimal access to hardware features.", "webApp", "f", "");
INSERT INTO project_question_option VALUES(4, 1, "I'm not sure||You're not clear on the differences between the various approaches, or you can't decide which one would suit you best. We'll discuss your goals and compare the possible solutions.", "typeNotSure", "f", "");
INSERT INTO project_question_option VALUES(5, 2, "No specific requirement", "noSpecific", "f", "");
INSERT INTO project_question_option VALUES(6, 2, "PhoneGap", "phoneGap", "f", "");
INSERT INTO project_question_option VALUES(7, 2, "MoSync", "moSync", "f", "");
INSERT INTO project_question_option VALUES(8, 2, "Other:", "otherCrossPlatform", "t", "otherCrossPlatformVal");
INSERT INTO project_question_option VALUES(9, 3, "Apple iOS (iPhone, iPod, iPad)", "ios", "f", "");
INSERT INTO project_question_option VALUES(10, 3, "Android", "android", "f", "");
INSERT INTO project_question_option VALUES(11, 3, "BlackBerry", "blackberry", "f", "");
INSERT INTO project_question_option VALUES(12, 3, "Windows Phone", "windowsPhone", "f", "");
INSERT INTO project_question_option VALUES(13, 3, "Other:", "otherNative", "t", "otherNativeVal");
INSERT INTO project_question_option VALUES(14, 4, "No, we are making a completely new design", "newDesign", "f", "");
INSERT INTO project_question_option VALUES(15, 4, "Yes, we are adapting an existing application", "adaptExisting", "f", "");
INSERT INTO project_question_option VALUES(16, 5, "Desktop application", "desktopApplication", "f", "");
INSERT INTO project_question_option VALUES(17, 5, "Web application", "webApplication", "f", "");
INSERT INTO project_question_option VALUES(18, 5, "&nbsp;", "otherApplication", "t", "otherApplicationVal");
INSERT INTO project_question_option VALUES(19, 6, "Unsure about this area - need help", "formFactorNotSure", "f", "");
INSERT INTO project_question_option VALUES(20, 6, 'Smartphone||4" screen approximately', "smartPhone", "f", "");
INSERT INTO project_question_option VALUES(21, 6, 'Compact tablet||7" screen approximately', "compactTablet", "f", "");
INSERT INTO project_question_option VALUES(22, 6, 'Full-sized tablet||10" screen and greater', "fullSizedTablet", "f", "");
INSERT INTO project_question_option VALUES(23, 6, "&nbsp;", "otherFormFactor", "t", "otherFormFactorVal");
INSERT INTO project_question_option VALUES(24, 7, "Unsure about this area - need help", "screenOrientationNotSure", "f", "");
INSERT INTO project_question_option VALUES(25, 7, "Portrait", "portrait", "f", "");
INSERT INTO project_question_option VALUES(26, 7, "Landscape", "landscape", "f", "");
INSERT INTO project_question_option VALUES(27, 7, "Both orientation", "bothOrientation", "f", "");
INSERT INTO project_question_option VALUES(28, 8, "Unsure about this area - need help", "screenResolutionNotSure", "f", "");
INSERT INTO project_question_option VALUES(29, 8, "Low resolution||individual pixels are easily distinguished, as on iPhone 3, iPad 2", "lowResolution", "f", "");
INSERT INTO project_question_option VALUES(30, 8, 'High resolution||"retina display" as on iPhone 4, Galaxy Nexus, iPad 3', "highResolution", "f", "");
INSERT INTO project_question_option VALUES(31, 8, "Both low and high resolution||extra design effort required", "bothResolution", "f", "");
INSERT INTO project_question_option VALUES(32, 9, "<span>Unsure about this area - need help</span>", "motionSensingNotSure", "f", "");
INSERT INTO project_question_option VALUES(33, 9, "<span>Tilt</span>", "tilt", "f", "");
INSERT INTO project_question_option VALUES(34, 9, "<span>Shake</span>", "shake", "f", "");
INSERT INTO project_question_option VALUES(35, 9, "<span>&nbsp;</span>", "otherMotionSensing", "t", "otherMotionSensingVal");
INSERT INTO project_question_option VALUES(36, 10, "<span>Unsure about this area - need help</span>", "geolocationNotSure", "f", "");
INSERT INTO project_question_option VALUES(37, 10, "<span>Cellular network</span>||low precision; dependent on proximity to cell tower", "cellularNetwork", "f", "");
INSERT INTO project_question_option VALUES(38, 10, "<span>Wi-Fi triangulation</span>||medium precision; dependent on Wi-Fi network proximity", "wifiTriangulation", "f", "");
INSERT INTO project_question_option VALUES(39, 10, "<span>GPS</span>||high precision; dependent on presence of GPS receiver in device", "gps", "f", "");
INSERT INTO project_question_option VALUES(40, 11, "<span>Unsure about this area - need help</span>", "cameraNotSure", "f", "");
INSERT INTO project_question_option VALUES(41, 11, "<span>Still photos</span>", "stillPhotos", "f", "");
INSERT INTO project_question_option VALUES(42, 11, "<span>Video capture</span>", "videoCapture", "f", "");
INSERT INTO project_question_option VALUES(43, 11, "<span>Object detection</span>", "objectDetection", "f", "");
INSERT INTO project_question_option VALUES(44, 11, "<span>&nbsp;</span>", "otherCamera", "t", "otherCameraVal");
INSERT INTO project_question_option VALUES(45, 12, "<span>Unsure about this area - need help</span>", "additionalFeatureNotSure", "f", "");
INSERT INTO project_question_option VALUES(46, 12, "<span>Audio recording</span>", "audioRecording", "f", "");
INSERT INTO project_question_option VALUES(47, 12, "<span>Phone calls</span>", "phoneCall", "f", "");
INSERT INTO project_question_option VALUES(48, 13, "Content outline", "contentOutline", "f", "");
INSERT INTO project_question_option VALUES(49, 13, "Design document", "designDoc", "f", "");
INSERT INTO project_question_option VALUES(50, 13, "Data document", "dataDoc", "f", "");
INSERT INTO project_question_option VALUES(51, 13, "Free-form comments", "freeForm", "f", "");
INSERT INTO project_question_option VALUES(52, 13, "", "otherType", "f", "");
INSERT INTO project_question_option VALUES(53, 13, "Upload", "upload", "f", "");
INSERT INTO project_question_option VALUES(54, 13, "Remote file (URL)", "url", "f", "");
INSERT INTO project_question_option VALUES(55, 13, "Direct entry ", "directEntry", "f", "");

-- Test data for project presentation type
INSERT INTO project_question VALUES(14, "What do you want us to deliver?", 11, "", "");
INSERT INTO project_question VALUES(15, "Title", 11, "presentationTitle", "");
INSERT INTO project_question VALUES(16, "Summary", 11, "presentationSummary", "");
INSERT INTO project_question VALUES(17, "Format", 11, "", "");
INSERT INTO project_question VALUES(18, "Visuals", 11, "", "");
INSERT INTO project_question VALUES(19, "Audience", 11, "", " input[name=audience]");
INSERT INTO project_question VALUES(20, "Purpose", 11, "", " input[name=purpose]");
INSERT INTO project_question VALUES(21, "Style", 11, "", " input[name=style]");
INSERT INTO project_question VALUES(22, "Detailed specifications", 11, "", ".newProjectStep .stepFourth2 .tableContainer table.addedItem tr");

INSERT INTO project_question_option VALUES(56, 14, "A Whole Presentation||You want us to develop a complete, audience-ready presentation from materials that you supply to us.", "wholePresentation", "f", "");
INSERT INTO project_question_option VALUES(57, 14, "Start a conversation||You know what the presentation is about and what you want to accomplish with it, but you're not sure how to get there. We'll discuss the possibilities with you.", "startConversion", "f", "");
INSERT INTO project_question_option VALUES(58, 14, "Create a presentation from existing materials||You have the necessary data and a content outline, which you would like us to expand into a polished final product.", "createFromExistingMaterial", "f", "");
INSERT INTO project_question_option VALUES(59, 14, "Enhance an existing presentation||You have a complete presentation which you would like us to improve with eye-catching graphics and/or meticulous text editing.", "enhanceExistingPresentation", "f", "");
INSERT INTO project_question_option VALUES(60, 14, "Some other situation", "otherWholePresentationSituation", "t", "otherWholePresentationSituationVal");
INSERT INTO project_question_option VALUES(61, 14, "Part of a presentation||You want us to deliver a specific component that you will integrate into the presentation yourself.", "partPresentation", "f", "");
INSERT INTO project_question_option VALUES(62, 14, "Concept visualization||You have an idea or a written description that you'd like us to render as a striking new image.", "conceptVisualization", "f", "");
INSERT INTO project_question_option VALUES(63, 14, "Data visualization||You have a structured collection of numbers that you'd like us to translate into an informative visual representation.", "dataVisualization", "f", "");
INSERT INTO project_question_option VALUES(64, 14, "Graphical motif||You want us to design a background and border treatment that will be applied to every page or slide of a presentation.", "graphicalMotif", "f", "");
INSERT INTO project_question_option VALUES(65, 14, "Some other situation", "otherPartPresentationSituation", "t", "otherPartPresentationSituationVal");
INSERT INTO project_question_option VALUES(66, 17, "<span>PowerPoint slides</span>", "pptSlide", "f", "");
INSERT INTO project_question_option VALUES(67, 17, "<span>Word document</span>", "wordDocument", "f", "");
INSERT INTO project_question_option VALUES(68, 17, "<span>PDF document</span>", "pdfDocument", "f", "");
INSERT INTO project_question_option VALUES(69, 17, "<span>HTML (web) pages</span>", "htmlPage", "f", "");
INSERT INTO project_question_option VALUES(70, 17, "<span>Flash application</span>", "flashApplication", "f", "");
INSERT INTO project_question_option VALUES(71, 17, "<span>&nbsp;</span>", "otherPresentationFormat", "t", "otherPresentationFormatVal");
INSERT INTO project_question_option VALUES(72, 18, "<span>On one large screen</span>", "onLargeScreen", "f", "");
INSERT INTO project_question_option VALUES(73, 18, "<span>On their own computers</span>", "onOwnComputer", "f", "");
INSERT INTO project_question_option VALUES(74, 18, "<span>On printed copies</span>", "onPrintedCopy", "f", "");
INSERT INTO project_question_option VALUES(75, 18, "<span>This is an oral presentation without visual aids</span>", "oralPresentation", "f", "");
INSERT INTO project_question_option VALUES(76, 18, "<span>&nbsp;</span>", "otherPresentationVisualAid", "t", "otherPresentationVisualAidVal");
INSERT INTO project_question_option VALUES(77, 19, "<span>Customers</span>", "customer", "f", "");
INSERT INTO project_question_option VALUES(78, 19, "<span>Colleagues</span>", "colleague", "f", "");
INSERT INTO project_question_option VALUES(79, 19, "<span>Business partners</span>", "businessPartner", "f", "");
INSERT INTO project_question_option VALUES(80, 19, "<span>Top executives</span>", "topExcutive", "f", "");
INSERT INTO project_question_option VALUES(81, 19, "<span>Upper management</span>", "upperManagement", "f", "");
INSERT INTO project_question_option VALUES(82, 19, "<span>Lower management</span>", "lowerManagement", "f", "");
INSERT INTO project_question_option VALUES(83, 19, "<span>Technical staff</span>", "technicalStaff", "f", "");
INSERT INTO project_question_option VALUES(84, 19, "<span>Sales staff</span>", "saleStaff", "f", "");
INSERT INTO project_question_option VALUES(85, 19, "<span>Laborers</span>", "laborer", "f", "");
INSERT INTO project_question_option VALUES(86, 19, "<span>Academic audience</span>", "academic", "f", "");
INSERT INTO project_question_option VALUES(87, 19, "<span>Industry insiders</span>", "industryInsider", "f", "");
INSERT INTO project_question_option VALUES(88, 19, "<span>General public</span>", "generalPublic", "f", "");
INSERT INTO project_question_option VALUES(89, 20, "<span>Introduce a product</span>", "introduceProduct", "f", "");
INSERT INTO project_question_option VALUES(90, 20, "<span>Present a plan</span>", "presentPlan", "f", "");
INSERT INTO project_question_option VALUES(91, 20, "<span>Offer a deal</span>", "offerDeal", "f", "");
INSERT INTO project_question_option VALUES(92, 20, "<span>Recruit a customer</span>", "recruitCustomer", "f", "");
INSERT INTO project_question_option VALUES(93, 20, "<span>Honor an occasion</span>", "honorOccasion", "f", "");
INSERT INTO project_question_option VALUES(94, 20, "<span>Inspire an action</span>", "inspireAction", "f", "");
INSERT INTO project_question_option VALUES(95, 20, "<span>Improve morale</span>", "improveMorale", "f", "");
INSERT INTO project_question_option VALUES(96, 20, "<span>Describe an idea</span>", "describeIdea", "f", "");
INSERT INTO project_question_option VALUES(97, 20, "<span>Analyze a situation</span>", "analyzeSituation", "f", "");
INSERT INTO project_question_option VALUES(98, 20, "<span>Argue for a position</span>", "arguePosition", "f", "");
INSERT INTO project_question_option VALUES(99, 20, "<span>Explain a problem</span>", "explainProblem", "f", "");
INSERT INTO project_question_option VALUES(100, 20, "<span>Offer a solution</span>", "offerSolution", "f", "");
INSERT INTO project_question_option VALUES(101, 20, "<span>Describe research</span>", "describeResearch", "f", "");
INSERT INTO project_question_option VALUES(102, 20, "<span>Summarize finances</span>", "summarizeFinace", "f", "");
INSERT INTO project_question_option VALUES(103, 21, "<span>Casual</span>", "casual", "f", "");
INSERT INTO project_question_option VALUES(104, 21, "<span>Formal</span>", "formal", "f", "");
INSERT INTO project_question_option VALUES(105, 21, "<span>Concise</span>", "concise", "f", "");
INSERT INTO project_question_option VALUES(106, 21, "<span>Detailed</span>", "detail", "f", "");
INSERT INTO project_question_option VALUES(107, 21, "<span>Statistical</span>", "statistical", "f", "");
INSERT INTO project_question_option VALUES(108, 21, "<span>Textual</span>", "textual", "f", "");
INSERT INTO project_question_option VALUES(109, 21, "<span>Graphical</span>", "graphical", "f", "");
INSERT INTO project_question_option VALUES(110, 21, "<span>Humorous</span>", "humorous", "f", "");
INSERT INTO project_question_option VALUES(111, 21, "<span>Dispassionate</span>", "dispassionate", "f", "");
INSERT INTO project_question_option VALUES(112, 21, "<span>Factual</span>", "factual", "f", "");
INSERT INTO project_question_option VALUES(113, 21, "<span>Emotional</span>", "emotional", "f", "");

-- Test data for project type analytics
INSERT INTO project_question VALUES(23, 'Estimated Budget<span class="red">*</span>', 12, "estimatedBudget", "");
INSERT INTO project_question VALUES(24, 'Estimated Timeline<span class="red">*</span>', 12, "", "");
INSERT INTO project_question VALUES(25, "Do you require a Copilot for your Project ?", 12, "", "div[id=selectionConfirmationModal] dd span");
INSERT INTO project_question VALUES(26, 'Please provide a high level overview of the problem that needs to be solved. <span class="red">*</span>', 12, "problemOverview", "");
INSERT INTO project_question VALUES(27, "Do you know the metrics that are essential to evaluate the quality of a <br/>solution to the described problem.", 12, "", "");
INSERT INTO project_question VALUES(28, "Do you know the 'fields of knowledge' that one needs to have a deep <br/>knowledge of in order to be successful in solving the problem.", 12, "", ".fieldBtn .btnMask .btnText > i");
INSERT INTO project_question VALUES(29, "Do you have or can you create a relevant test data in order to evaluate performance of solutions for your problem?", 12, "", "");
INSERT INTO project_question VALUES(30, "Is amount of used memory essential in this problem?", 12, "", "");
INSERT INTO project_question VALUES(31, "Is runtime speed essential in this problem?", 12, "", "");
INSERT INTO project_question VALUES(32, "What type of solution is Appropriate?", 12, "", "");
INSERT INTO project_question VALUES(33, "Which of these languages you would like to allow for your competition?", 12, "", "");
INSERT INTO project_question VALUES(34, "How do you prefer to integrate the winning solution (assuming its quality is appropriate) into your software product", 12, "", "");
INSERT INTO project_question VALUES(35, "Do you have any current solution of the problem described?", 12, "", "");
INSERT INTO project_question VALUES(36, 'If there are any other details that you think are relevant but are not covered by any questions in the previous steps, please list them here.<span class="red">*</span>', 12, "otherDetail", "");
INSERT INTO project_question VALUES(37, "Additional Documents", 12, "", ".analyticsSteps .step6Container .step6 tr");
INSERT INTO project_question VALUES(38, "<span>6</span>Who can access your Project?", 12, "", ".analyticsSteps .checkPermissions .userRow .group");

INSERT INTO project_question_option VALUES(114, 24, "Days", "slider", "t", "estimatedTimeline");
INSERT INTO project_question_option VALUES(115, 24, "Specific Dates", "specificDate", "t", "startDate");
INSERT INTO project_question_option VALUES(116, 24, "to", "specificDate", "t", "endDate");
INSERT INTO project_question_option VALUES(117, 25, "Yes, I need a Copilot", "needCopilot", "f", "");
INSERT INTO project_question_option VALUES(118, 25, "No Thanks, I don't need a copilot", "noCopilot", "f", "");
INSERT INTO project_question_option VALUES(119, 27, 'Yes||Please list the metrics <span class="red">*</span>', "metricsYes", "t", "analyticMetrics");
INSERT INTO project_question_option VALUES(120, 27, "No", "metricsNo", "f", "");
INSERT INTO project_question_option VALUES(121, 28, 'Yes||Field of Knowledge: <span class="red">*</span>', "knowledgeYes", "f", "");
INSERT INTO project_question_option VALUES(122, 28, "No", "knowledgeNo", "f", "");
INSERT INTO project_question_option VALUES(123, 29, "Yes||Please provide an expected size of all test data", "radio11", "t", "expectedSizeOfTestData");
INSERT INTO project_question_option VALUES(124, 29, "No||Please clarify why it is difficult to get a proper test data.", "radio12", "t", "reasonForNoTestData");
INSERT INTO project_question_option VALUES(125, 29, "I don't know||A Topcoder PM will be approaching you soon to clarify your doubts", "radio13", "f", "");
INSERT INTO project_question_option VALUES(126, 30, "Yes||What maximum amount of memory would be acceptable", "radio21", "t", "maximumAmountOfMemory");
INSERT INTO project_question_option VALUES(127, 30, "No||How much memory do you think it is necessary in order to obtain proper results?", "radio22", "t", "expectedAmountOfMemory");
INSERT INTO project_question_option VALUES(128, 30, "I don't know||A Topcoder PM will be approaching you soon to clarify your doubts", "radio23", "f", "");
INSERT INTO project_question_option VALUES(129, 31, "Yes||What maximum execution time would be acceptable (assuming a single threaded solution and average modern PC)?", "radio31", "t", "maximumExecutionTime");
INSERT INTO project_question_option VALUES(130, 31, "No||How much execution time do you think should be allowed for a solution in order to obtain reasonable results?", "radio32", "t", "allowedExecutionTime");
INSERT INTO project_question_option VALUES(131, 31, "I don't know||A Topcoder PM will be approaching you soon to clarify your doubts", "radio33", "f", "");
INSERT INTO project_question_option VALUES(132, 32, "<strong>Single Threaded</strong>||at least before the integration to your <br/>system", "radio41", "f", "");
INSERT INTO project_question_option VALUES(133, 32, "<strong>Multi Threaded</strong>||ie. problem has not much meaning in a sungle threading context", "radio42", "f", "");
INSERT INTO project_question_option VALUES(134, 32, "I don't know", "radio43", "f", "");
INSERT INTO project_question_option VALUES(135, 33, "C++", "checkbox51", "f", "");
INSERT INTO project_question_option VALUES(136, 33, "Java", "checkbox52", "f", "");
INSERT INTO project_question_option VALUES(137, 33, "C#", "checkbox53", "f", "");
INSERT INTO project_question_option VALUES(138, 33, "VB.NET", "checkbox54", "f", "");
INSERT INTO project_question_option VALUES(139, 33, "Python", "checkbox55", "f", "");
INSERT INTO project_question_option VALUES(140, 33, "I don't know", "checkbox56", "f", "");
INSERT INTO project_question_option VALUES(141, 34, "I prefer to handle the integration myself.", "radio61", "f", "");
INSERT INTO project_question_option VALUES(142, 34, " Prefer the integration to be done by TopCoder through a separate contest or a series of contests?", "radio62", "f", "");
INSERT INTO project_question_option VALUES(143, 35, "Yes||Please provide its high level overview and information on its performance.", "radio71", "t", "overviewOnCurrentSolution");
INSERT INTO project_question_option VALUES(144, 35, "No", "radio72", "f", "");
INSERT INTO project_question_option VALUES(145, 37, "Upload", "", "f", "");
INSERT INTO project_question_option VALUES(146, 37, "Remote file (URL)", "", "f", "");
INSERT INTO project_question_option VALUES(147, 37, "Direct entry", "", "f", "");

-- Test data for project type custom
INSERT INTO project_question VALUES(39, "Do you require a Copilot for your Project ?", 9, "", "div[id=selectionConfirmationModal] dd span");
INSERT INTO project_question VALUES(40, "<span>5</span>Who can access your Project?", 9, "", ".customProject .checkPermissions .userRow .group");
INSERT INTO project_question VALUES(41, "<span>6</span>Manage Project Forum", 9, "", "table.forums tr");

INSERT INTO project_question_option VALUES(148, 39, "Yes, I need a Copilot", "needCopilotCustom", "f", "");
INSERT INTO project_question_option VALUES(149, 39, "No Thanks, I don't need a copilot", "noCopilotCustom", "f", "");





