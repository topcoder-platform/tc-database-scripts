DATABASE tcs_dw;

INSERT INTO calendar SELECT calendar_id + 10000, 2012, month_numeric, month_alpha, day_of_month, day_of_week, 
week_day, year_month, week_of_year, day_of_year, holiday, weekend, date + 365 UNITS DAY, week_year, quarter_of_year
FROM calendar 
WHERE YEAR = 2011;

INSERT INTO log_type_lu VALUES (2, 'TCLoadCoders') ;
INSERT INTO update_log (log_id, calendar_id, timestamp, log_type_id) VALUES (100, 2893, '2008-12-02 00:00:00.000', 2);

DATABASE topcoder_dw;

INSERT INTO log_type_lu VALUES (2, 'TCLoadCoders') ;
INSERT INTO update_log (log_id, calendar_id, timestamp, log_type_id) VALUES (100, 2893, '2008-12-02 00:00:00.000', 2);



