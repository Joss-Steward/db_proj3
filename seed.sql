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