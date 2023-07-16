USE mydb;

#Query 1 - Driver_Crash_Info
CREATE OR REPLACE VIEW Driver_Crash_Info AS 
SELECT Driver_id, Driver_Sex,Driver_License_Jurisdiction, Collision_Time, Collision_Date
FROM Driver JOIN Collisions 
	 USING(Driver_id)
WHERE Collision_Date > '2016-04-01' AND Collision_Date < '2016-05-30' 
ORDER BY Collision_Date;

#Query 2 - Vehicle_Info
CREATE OR REPLACE VIEW Vehicle_Info AS 
SELECT Vehicle_Type, COUNT(*) AS 'Vehicles Made After 2010'
FROM Vehicles RIGHT JOIN Vehicle_Collisions 
	 USING(Unique_id) RIGHT JOIN Collisions
     USING(Collision_id)
WHERE Vehicle_Year > '2010'
GROUP BY Vehicle_Type WITH ROLLUP;


#Query 3 - Contributing_Factor_Info
CREATE OR REPLACE VIEW Contributing_Factor_Info AS 
SELECT Contributing_Factor_1, COUNT(Contributing_Factor_1) AS Total
FROM (
	SELECT *
    FROM Driver JOIN Collisions
	USING(Driver_id) JOIN Damage_and_Contributing_Factor
    USING(Collision_id) JOIN Contributing_Factor
    USING(Cont_Factor_id) JOIN Damages
    USING(Damage_id)
    WHERE Vehicle_Damage <> 'No Damage'
)t 
GROUP BY Contributing_Factor_1
ORDER BY Total DESC





