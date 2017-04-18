SELECT * FROM CraftingMaterials;
SELECT * FROM Creatures;
SELECT * FROM CreaturesOwned;
SELECT * FROM Deaths;
SELECT * FROM Equipment;
SELECT * FROM Items;
SELECT * FROM KnownMaps;
SELECT * FROM Logins;
SELECT * FROM Maps;
SELECT * FROM Monsters;
SELECT * FROM NPCs;
SELECT * FROM Pets;
SELECT * FROM PlayerDeaths;
SELECT * FROM PlayerInventory;
SELECT * FROM PlayerSkills;
SELECT * FROM PlayerStatus;
SELECT * FROM Players;
SELECT * FROM Recipes;
SELECT * FROM Skills;
SELECT * FROM StatusEffects;
SELECT * FROM Summons;


-- 1. Simple Project: Show the name and class of all players
SELECT playerName, class 
 FROM Players;

-- 2. Simple Select: Show the names and HP of players with more than 200 MaxHP
SELECT playerName, maxHealth 
 FROM Players 
 WHERE maxHealth > 200;

-- 3. Two Table Join: Show the players who have visited the "Known Covens" map
SELECT playerID 
 FROM Players P JOIN KnownMaps K
 WHERE P.playerID = K.playerID AND mapName = "Known Covens";

--Player who logged in between Jan 1st and Jan 20th 2017
SELECT playerID 
 FROM Logins 
 WHERE loginTime BETWEEN '2017-01-01 00:00:00'AND '2017-01-20 00:00:00';


--Player with greatest number of max level skills and what they are
SELECT playerID,skillName 
 FROM 
    (SELECT playerID,skillName  
     FROM PlayerSkills NATURAL JOIN Skills  
     WHERE playerSkillLevel = maxLevel) t1
 NATURAL JOIN 
    (SELECT playerID,Count(playerID) AS occurances 
     FROM PlayerSkills NATURAL JOIN Skills  
     WHERE playerSkillLevel = maxLevel 
     GROUP BY playerID 
     ORDER BY occurances DESC LIMIT 1) t2;

SELECT t1.playerID,skillName  
 FROM
     (SELECT playerID,skillName
      FROM PlayerSkills NATURAL JOIN Skills
      WHERE playerSkillLevel = maxLevel) t1
  LEFT JOIN
     (SELECT playerID,Count(playerID) AS occurances
      FROM PlayerSkills NATURAL JOIN Skills
      WHERE playerSkillLevel = maxLevel
      GROUP BY playerID
      ORDER BY occurances DESC LIMIT 1) t2 on t1.playerID = t2.playerID;


--Player Who never logged on for more than an hour at a time
SELECT playerID FROM
    (SELECT playerID, MAX(TIME_TO_SEC(TIMEDIFF(logoutTime, loginTime))) AS totalTime 
     FROM Logins 
     GROUP BY playerId) times 
     WHERE times.totalTime <= 3600;

--Given recipe 1, what items does player1 need to make it;
SELECT craftingMaterialID AS neededMatID 
 FROM CraftingMaterials 
 WHERE recipeID = 1 AND NOT EXISTS 
    (SELECT itemID 
     FROM PlayerInventory 
     WHERE craftingMaterialID = itemID AND playerID=6);

-- Player who can take and deal the most damag
 
 SELECT playerDMG.playerID
 FROM (SELECT 
        Equipment.playerID, 
        SUM(Equipment.combined) AS total
       FROM
        (SELECT 
         playerID, 
         (armorValue + damageValue) AS combined 
         FROM PlayerInventory 
         NATURAL JOIN Equipment) AS Equipment 
       GROUP BY playerID) AS playerDMG
INNER JOIN (SELECT MAX(playerDMG2.total) AS maxTotal
           FROM
            (SELECT 
              Equipment.playerID, 
              SUM(Equipment.combined) AS total
             FROM
              (SELECT 
               playerID, 
               (armorValue + damageValue) AS combined 
               FROM PlayerInventory 
               NATURAL JOIN Equipment) AS Equipment 
             GROUP BY playerID) AS playerDMG2          
           ) AS t
WHERE playerDMG.total = t.maxTotal;
    
