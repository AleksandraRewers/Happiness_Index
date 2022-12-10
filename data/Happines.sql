use happines;

#adding year column to each data table'
ALTER TABLE happines.fifteen ADD COLUMN Year YEAR(4) DEFAULT '2015';
ALTER TABLE happines.sixteen ADD COLUMN Year YEAR(4) DEFAULT '2016';
ALTER TABLE happines.seventeen ADD COLUMN Year YEAR(4) DEFAULT '2017';
ALTER TABLE happines.eighteen ADD COLUMN Year YEAR(4) DEFAULT '2018';
ALTER TABLE happines.nineteen ADD COLUMN Year YEAR(4) DEFAULT '2019';
ALTER TABLE happines.twenty ADD COLUMN Year YEAR(4) DEFAULT '2020';
ALTER TABLE happines.twentyone ADD COLUMN Year YEAR(4) DEFAULT '2021';

# changing column's names in 2019, to match other tables
ALTER TABLE happines.fifeteen
CHANGE COLUMN `Country or region` `Country` TEXT NULL DEFAULT NULL ;
ALTER TABLE happines.twenty 
CHANGE COLUMN `Country name` `Country` TEXT NULL DEFAULT NULL ;
ALTER TABLE happines.twentyone
CHANGE COLUMN `Country name` `Country` TEXT NULL DEFAULT NULL ;


# adding a column "Region" to 2017, 2018, 2018
ALTER TABLE happines.seventeen ADD COLUMN Region varchar(50) DEFAULT NULL;
ALTER TABLE happines.eighteen ADD COLUMN Region varchar(50) DEFAULT NULL;
ALTER TABLE happines.nineteen ADD COLUMN Region varchar(50) DEFAULT NULL;

# checking if values in "Regional indicator" column (from 2020 and 2021) match values in "Region" from 2015 table
SELECT 
    f.Country, f.Region, t.`Regional indicator`
FROM
    happines.fifteen f
        JOIN
    happines.twenty t ON f.Country = t.Country
WHERE
    f.Region <> t.`Regional indicator`
GROUP BY f.Region;

SELECT 
    f.Country, f.Region, ton.`Regional indicator`
FROM
    happines.fifteen f
        JOIN
    happines.twentyone ton ON f.Country = ton.Country
WHERE
    f.Region <> ton.`Regional indicator`
GROUP BY f.Region;

# standardisation regions' names in tables: fifteen, sixteen, twenty and twentyone
#changes in `Regional indicator`: 'North America and ANZ' to 'North America', 'South Asia' to 'Southern Asia', 'East Asia' = 'Eastern Asia', 'Southeast Asia' = 'Southeastern Asia', 'Middle East and North Africa' = 'Middle East and Northern Africa';

UPDATE happines.twenty t
        INNER JOIN
    happines.fifteen f ON t.Country = f.Country 
SET 
    t.`Regional indicator` = f.Region;

UPDATE happines.twentyone ton
        INNER JOIN
    happines.fifteen f ON ton.Country = f.Country 
SET 
    ton.`Regional indicator` = f.Region;

# Adding regions to tables "seventeen", "eighteen", "nighteen"
UPDATE seventeen s
        INNER JOIN
    fifteen f ON s.Country = f.Country 
SET 
    s.Region = f.Region;

UPDATE eighteen e
        INNER JOIN
    fifteen f ON e.Country = f.Country 
SET 
    e.Region = f.Region;

UPDATE nineteen n
        INNER JOIN
    fifteen f ON n.Country = f.Country 
SET 
    n.Region = f.Region;
    
#change names in tables twenty and twentyone
ALTER TABLE happines.twenty
CHANGE COLUMN `Regional indicator` `Region` TEXT NULL DEFAULT NULL ;

ALTER TABLE happines.twentyone
CHANGE COLUMN `Regional indicator` `Region` TEXT NULL DEFAULT NULL ;

# Adding a new lable for Australia and New Zeleand 
Update happines.fifteen
Set Region='Australia and New Zeleand'
where Country= "Australia" and Country="New Zeleand";

Update happines.sixteen
Set Region='Australia and New Zeleand'
where Country= "Australia" and Country="New Zeleand";

Update happines.seventeen
Set Region='Australia and New Zeleand'
where Country= "Australia" and Country="New Zeleand";

Update happines.eighteen
Set Region='Australia and New Zeleand'
where Country= "Australia" and Country="New Zeleand";

Update happines.nineteen
Set Region='Australia and New Zeleand'
where Country= "Australia" and Country="New Zeleand";

Update happines.twenty
Set Region='Australia and New Zeleand'
where Country= "Australia" and Country="New Zeleand";

Update happines.twentyone
Set Region='Australia and New Zeleand'
where Country= "Australia" and Country="New Zeleand";

#standarisation of columns' headers in order to union them in next step
# Example only for table happines.seventeen

ALTER TABLE `happines`.`fifteen` 
CHANGE COLUMN `Country` `Country` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `Economy.GDP.per.Capita` `GDP.per.capita` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Social support` `Social.support` DOUBLE NULL DEFAULT NULL ,
ADD PRIMARY KEY (`Country`);

ALTER TABLE `happines`.`sixteen` 
CHANGE COLUMN `Country` `Country` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `Economy.GDP.per.Capita` `GDP.per.capita` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Social support` `Social.support` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Trust (Government Corruption)` `Trust.Government.Corruption` DOUBLE NULL DEFAULT NULL ,
ADD PRIMARY KEY (`Country`);

ALTER TABLE `happines`.`seventeen` 
CHANGE COLUMN `Happiness Score` `Happiness.Score` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Economy (GDP per Capita)` `GDP.per.capita` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Social support` `Social.support` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Health (Life Expectancy)` `Health.Life.Expectancy` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Trust (Government Corruption)` `Trust.Government.Corruption` DOUBLE NULL DEFAULT NULL ,
ADD PRIMARY KEY (`Country`),
DROP INDEX `Country_UNIQUE` ;

ALTER TABLE `happines`.`eighteen` 
CHANGE COLUMN `Overall rank` `Overall rank` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `Score` `Happiness.Score` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `GDP per capita` `GDP.per.capita` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Social support` `Social.support` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Healthy life expectancy` `Health.Life.Expectancy` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Freedom to make life choices` `Freedom` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Perceptions of corruption` `Trust.Government.Corruption` DOUBLE NULL DEFAULT NULL ,
ADD PRIMARY KEY (`Overall rank`);

ALTER TABLE `happines`.`nineteen` 
CHANGE COLUMN `Overall rank` `Overall rank` INT NULL ,
CHANGE COLUMN `Country` `Country` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `Score` `Happiness.Score` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `GDP per capita` `GDP.per.capita` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Social support` `Social.support` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Healthy life expectancy` `Health.Life.Expectancy` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Freedom to make life choices` `Freedom` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Perceptions of corruption` `Trust.Government.Corruption` DOUBLE NULL DEFAULT NULL ,
ADD PRIMARY KEY (`Country`);

ALTER TABLE `happines`.`twenty` 
CHANGE COLUMN `Country` `Country` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `Ladder score` `Happiness.Score` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Logged GDP per capita` `GDP.per.capita1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Social support` `Social.support1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Healthy life expectancy` `Health.Life.Expectancy1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Freedom to make life choices` `Freedom1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Generosity` `Generosity1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Perceptions of corruption` `Trust.Government.Corruption1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Log GDP per capita` `GDP.per.capita` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Social support` `Social.support` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Healthy life expectancy` `Health.Life.Expectancy` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Freedom to make life choices` `Freedom` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Generosity` `Generosity` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Perceptions of corruption` `Trust.Government.Corruption` DOUBLE NULL DEFAULT NULL ,
ADD PRIMARY KEY (`Country`);

ALTER TABLE `happines`.`twentyone` 
CHANGE COLUMN `GDP.per.capita` `GDP.per.capita1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Social.support` `Social.support1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Freedom` `Freedom1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Generosity` `Generosity1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Trust.Government.Corruption` `Trust.Government.Corruption1` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Log GDP per capita` `GDP.per.capita` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Social support` `Social.support` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Freedom to make life choices` `Freedom` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Generosity` `Generosity` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Explained by: Perceptions of corruption` `Trust.Government.Corruption` DOUBLE NULL DEFAULT NULL ;

# Edit done 
# Creating final table for data visualisation

(
SELECT
`Country`, `Region`, `Year`, `Happiness.Score`, `Health.Life.Expectancy`, `Trust.Government.Corruption`, `Generosity`, `Freedom`, `Social.support`, `GDP.per.capita`
FROM happines.fifteen
)
UNION
(
SELECT
`Country`, `Region`, `Year`, `Happiness.Score`, `Health.Life.Expectancy`, `Trust.Government.Corruption`, `Generosity`, `Freedom`, `Social.support`, `GDP.per.capita`
FROM happines.sixteen
)
UNION
(
SELECT
`Country`, `Region`, `Year`, `Happiness.Score`, `Health.Life.Expectancy`, `Trust.Government.Corruption`, `Generosity`, `Freedom`, `Social.support`, `GDP.per.capita`
FROM happines.seventeen
)
UNION
(
SELECT
`Country`, `Region`, `Year`, `Happiness.Score`, `Health.Life.Expectancy`, `Trust.Government.Corruption`, `Generosity`, `Freedom`, `Social.support`, `GDP.per.capita`
FROM happines.eighteen
)
UNION
(
SELECT
`Country`, `Region`, `Year`, `Happiness.Score`, `Health.Life.Expectancy`, `Trust.Government.Corruption`, `Generosity`, `Freedom`, `Social.support`, `GDP.per.capita`
FROM happines.nineteen
)
UNION
(
SELECT
`Country`, `Region`, `Year`, `Happiness.Score`, `Health.Life.Expectancy`, `Trust.Government.Corruption`, `Generosity`, `Freedom`, `Social.support`, `GDP.per.capita`
FROM happines.twenty
)
UNION
(
SELECT
`Country`, `Region`, `Year`, `Happiness.Score`, `Health.Life.Expectancy`, `Trust.Government.Corruption`, `Generosity`, `Freedom`, `Social.support`, `GDP.per.capita`
FROM happines.twentyone
);

