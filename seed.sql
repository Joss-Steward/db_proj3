INSERT INTO Players 
    (playerName, class, experiencePoints, strength, charisma, intelligence, currentHealth, maxHealth) 
VALUES 
    ("Torbjorn", "dwarf mechanic",      FLOOR(RAND() * 250), FLOOR(RAND() * 300), FLOOR(RAND() * 100), FLOOR(RAND() * 190), FLOOR(RAND() * 100), 100),
    ("Vlad", "elf vampire",             FLOOR(RAND() * 250), FLOOR(RAND() * 300), FLOOR(RAND() * 100), FLOOR(RAND() * 190), FLOOR(RAND() * 100), 100),
    ("Brittany", "human cheerleader",   FLOOR(RAND() * 250), FLOOR(RAND() * 300), FLOOR(RAND() * 100), FLOOR(RAND() * 190), FLOOR(RAND() * 100), 100),
    ("Treeguy", "ent",                  FLOOR(RAND() * 250), FLOOR(RAND() * 300), FLOOR(RAND() * 100), FLOOR(RAND() * 190), FLOOR(RAND() * 100), 450),
    ("Harry Potter", "human wizard",    FLOOR(RAND() * 250), FLOOR(RAND() * 300), FLOOR(RAND() * 100), FLOOR(RAND() * 190), FLOOR(RAND() * 100), 190),
    ("Uuuuurk", "orc berserker",        FLOOR(RAND() * 250), FLOOR(RAND() * 300), FLOOR(RAND() * 100), FLOOR(RAND() * 190), FLOOR(RAND() * 100), 650);

-- Now, normally this would not be a good idea. But, because we just created the players, 
--  we know what their primary keys will be (because we dropped & recreated the table first).

INSERT INTO Logins 
    (playerID, loginTime, logoutTime) 
VALUES
    (1, '2017-01-29 11:23:05', '2017-02-01 13:52:57'),
    (2, '2016-11-25 11:23:05', '2017-02-10 13:52:57'),
    (3, '2017-01-12 11:23:05', '2017-02-07 13:52:57'),
    (4, '2017-01-17 11:23:05', '2017-02-09 13:52:57'),
    (5, '2017-02-05 11:23:05', '2017-02-23 13:52:57'),
    (6, '2016-10-09 11:23:05', '2017-02-12 13:52:57');

INSERT INTO Maps
    (mapName, region)
VALUES
    ("Magic treasure burried here", "Cambrodia"),
    ("Known Troll-caves", "Middle-Earthen Curutiba"),
    ("The safe path", "The Enchanted Forest"),
    ("Known Covens", "Old Englang"),
    ("The kingdom under the mountain", "The far reaches");

INSERT INTO KnownMaps
    (playerID, mapName)
VALUES
    (1, "The safe path"),
    (1, "Known Covens"),
    (1, "The kingdom under the mountain"),
    (2, "The safe path"),
    (2, "Known Covens"),
    (2, "The kingdom under the mountain"),
    (3, "Magic treasure burried here"),
    (3, "Known Troll-caves"),
    (3, "Known Covens"),
    (4, "Magic treasure burried here"),
    (4, "Known Troll-caves"),
    (4, "The safe path"),
    (5, "The safe path"),
    (5, "Known Covens"),
    (6, "The safe path"),
    (6, "Known Covens"),
    (6, "The kingdom under the mountain");

INSERT INTO StatusEffects
    (statusName, timeout, strength, charisma, intelligence)
VALUES
    ("poisoned", 30, -20, -50, -50),
    ("drunk", 60, +70, -75, -75),
    ("hangover", 120, -30, -50, -35),
    ("strength_plus", 30, +50, 0, 0),
    ("frostbite", 30, -45, 0, -20),
    ("suffocating", 50, -60, -60, -60);

INSERT INTO PlayerStatus
    (playerID, statusName, timeApplied, status)
VALUES
    (1, "drunk", NOW(), "Having fun"),
    (3, "hangover", NOW(), "Recovering from fun"),
    (2, "poisoned", NOW(), "Fighting"),
    (2, "strength_plus", NOW(), "From potion"),
    (5, "frostbite", NOW(), "Freezing");
    
INSERT INTO Deaths
    (causeOfDeath, timeOfDeath)
VALUES
    ("Very angry rabbit", '2016-05-25 12:00:00'),           -- 1
    ("Didn't see cliff", '2016-06-12 12:00:00'),            -- 2
    ("Tried to cut down an ent", '2016-10-19 12:00:00'),    -- 3
    ("Ate poisoned food", '2016-11-28 12:00:00'),           -- 4
    ("Very angry rabbit", '2017-01-23 12:00:00'),           -- 5
    ("Choked on chicken bone", '2017-02-10 12:00:00');      -- 6

INSERT INTO PlayerDeaths
    (playerID, deathID)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (3, 4),
    (4, 5),
    (2, 6);

INSERT INTO Creatures
    (species, maxHealth, friendliness)
VALUES
    ("dog", 150, "passive"),            -- 1
    ("cat", 70, "neutral"),             -- 2
    ("raven", 10, "aggressive"),        -- 3
    ("mushroom", 250, "aggressive"),    -- 4
    ("snake", 50, "passive"),           -- 5
    ("rabbit", 1500, "aggressive"),     -- 6
    ("whiptree", 700, "aggressive"),    -- 7
    ("mouse", 20, "neutral"),           -- 8
    ("gopher", 60, "passive"),          -- 9
    ("human", 100, "neutral"),          -- 10
    ("human", 120, "neutral"),          -- 11
    ("human", 150, "aggressive"),       -- 12
    ("orc", 200, "aggressive"),         -- 13
    ("orc", 250, "passive"),            -- 14
    ("elf", 90, "neutral"),             -- 15
    ("dog", 150, "passive"),            -- 16
    ("cat", 90, "neutral"),             -- 17
    ("dog", 150, "aggressive"),         -- 18
    ("dog", 150, "neutral"),            -- 19
    ("cat", 110, "aggressive"),         -- 20
    ("mushroom", 350, "aggressive"),    -- 21
    ("mushroom", 150, "aggressive"),    -- 22
    ("mushroom",  50, "aggressive"),    -- 23
    ("mushroom",  75, "aggressive");    -- 24

INSERT INTO CreaturesOwned
    (playerID, creatureID)
VALUES
    (6, 3),
    (5, 4),
    (4, 2),
    (2, 1),
    (2, 17),
    (3, 18);

INSERT INTO Pets
    (petID, loyalty)
VALUES
    (2, "neutral"),
    (4, "disloyal"),
    (5, "loyal"),
    (18, "loyal"),
    (17, "disloyal"),
    (1, "very_loyal");

INSERT INTO NPCs
    (npcID, npcName, class)
VALUES
    (10, "Bob", "shopkeeper"),
    (11, "Tim", "enchanter"),
    (12, "Jim", "bandit"),
    (13, "Ragh", "bandit"),
    (14, "Uuururkru", "shopkeeper"),
    (15, "Elderong", "archer");

INSERT INTO Summons
    (summonID, creatureName, duration)
VALUES 
    (3, "Flit", 30),
    (8, "Mr. Useless", 10),
    (9, "Digdug", 60),
    (16, "Fido", 90),
    (19, "Doggo", 90);

INSERT INTO Monsters
    (monsterID, attackValue)
VALUES 
    (6, 1000),
    (7, 100),
    (21, 63),
    (22, 70),
    (23, 10),
    (24, 250);

INSERT INTO Skills
    (skillName, maxLevel)
VALUES
    ("forging", 100),
    ("divining", 10),
    ("diving", 7),
    ("spell-making", 100),
    ("hand-to-hand", 100),
    ("archery", 100);

INSERT INTO PlayerSkills
    (playerID, skillName, playerSkillLevel)
VALUES
    (1, "forging", 87),
    (1, "hand-to-hand", 73),
    (2, "divining", 9),
    (2, "diving", 3),
    (4, "archery", 65),
    (4, "spell-making", 2),
    (5, "forging", 56);

INSERT INTO Items
    (itemName, weight, cost)
VALUES
    ("broadsword", 3, 50),      -- 1
    ("letter opener", 1, 10),   -- 2
    ("hammer", 2, 40),          -- 3
    ("big hammer", 5, 70),      -- 4
    ("breastplate", 5, 30),     -- 5 
    ("wood planks", 1, 10),     -- 6
    ("iron ingot", 1, 8),       -- 7
    ("bronze ingot", 1, 10),    -- 8
    ("leather", 1, 6),          -- 9
    ("melange", 1, 500),        -- 10
    ("fiber", 1, 2),            -- 11
    ("helmet", 3, 50),          -- 12
    ("iron ore", 1, 5),         -- 13
    ("bronze ore", 1, 10),      -- 14
    ("log", 30, 30),            -- 15
    ("helmet", 3, 50);          -- 16

INSERT INTO Equipment
    (itemID, armorValue, damageValue)
VALUES
    (1, 0, 59),
    (2, 0, 7),
    (3, 0, 10),
    (4, 0, 80),
    (5, 100, 0),
    (12, 80, 0);
    
INSERT INTO PlayerInventory
    (playerID, itemID)
VALUES 
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (1, 4),
    (4, 2),
    (6, 11),
    (6, 12);

INSERT INTO Recipes
    (craftedItemID, quantityMade)
VALUES
    (1, 1),     -- 1
    (7, 2),     -- 2
    (8, 2),     -- 3
    (6, 10),    -- 4
    (16, 1);    -- 5

INSERT INTO CraftingMaterials
    (recipeID, craftingMaterialID)
VALUES
    (1, 7),
    (1, 9),
    (2, 13),
    (3, 14),
    (4, 15),
    (5, 8);