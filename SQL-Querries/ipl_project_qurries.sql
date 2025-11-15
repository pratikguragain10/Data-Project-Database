-- IPL DATA ANALYSIS QUERIES

-- 1. TOTAL RUNS SCORED BY EACH TEMA

SELECT
    batting_team,
    SUM(total_runs) AS total_runs
FROM deliveries
GROUP BY batting_team
ORDER BY total_runs DESC;

-- 2. TOP 10 BATSMEN FOR ROYAL CHALLENGERS BANGALORE

SELECT
    batsman,
    SUM(batsman_runs) AS total_runs
FROM deliveries
WHERE batting_team = 'Royal Challengers Bangalore'
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 10;

-- 3. FOREIGN UMPIER COUNT

SELECT
    country,
    COUNT(*) AS umpire_count
FROM umpires
WHERE country <> 'India'
GROUP BY country
ORDER BY umpire_count DESC;

-- 4. MATCHES PLAYED BY TEAM BY SEASON

SELECT
    season,
    team,
    COUNT(*) AS matches_played
FROM (
    SELECT season, team1 AS team FROM matches
    UNION ALL
    SELECT season, team2 AS team FROM matches
) AS teams
GROUP BY season, team
ORDER BY season, team;

-- 5. MATCHES PLAYED PER YEAR

SELECT
    season,
    COUNT(*) AS matches_played
FROM matches
GROUP BY season
ORDER BY season;

-- 6. MATCHES WON PER TEAM PER YEAR

SELECT
    season,
    winner AS team,
    COUNT(*) AS wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY season, winner
ORDER BY season, wins DESC;

-- 7. EXTRA RUNS CONCEDED PER TEAM IN 2016

SELECT
    bowling_team,
    SUM(extra_runs) AS extra_runs_conceded
FROM deliveries d
JOIN matches m
    ON d.match_id = m.id
WHERE m.season = 2016
GROUP BY bowling_team
ORDER BY extra_runs_conceded DESC;

-- 8. TOP 10 ECONOMICAL BOWLERS IN 2015

SELECT
    bowler,
    ROUND(
        SUM(total_runs)::NUMERIC /
        (COUNT(*) FILTER (WHERE wide_runs = 0 AND noball_runs = 0) / 6.0),
        2
    ) AS economy_rate
FROM deliveries d
JOIN matches m
    ON d.match_id = m.id
WHERE m.season = 2015
GROUP BY bowler
HAVING COUNT(*) FILTER (WHERE wide_runs = 0 AND noball_runs = 0) > 0
ORDER BY economy_rate
LIMIT 10;
