codeally@84338c27ae77:~/project$ psql -U postgres < universe.sql
Border style is 2.
Pager usage is off.
SET
SET
SET
SET
SET
+------------+
| set_config |
+------------+
|            |
+------------+
(1 row)

SET
SET
SET
SET
DROP DATABASE
CREATE DATABASE
ALTER DATABASE
You are now connected to database "universe" as user "postgres".
SET
SET
SET
SET
SET
+------------+
| set_config |
+------------+
|            |
+------------+
(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
+--------+
| setval |
+--------+
|      1 |
+--------+
(1 row)

+--------+
| setval |
+--------+
|      6 |
+--------+
(1 row)

+--------+
| setval |
+--------+
|      1 |
+--------+
(1 row)

+--------+
| setval |
+--------+
|     12 |
+--------+
(1 row)

+--------+
| setval |
+--------+
|      6 |
+--------+
(1 row)

ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
codeally@84338c27ae77:~/project$ psql --username=freecodecamp -dbname=postgres
psql: error: invalid connection option "bname"
codeally@84338c27ae77:~/project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> /d
universe-> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | comet                | table    | freecodecamp |
| public | comet_comet_id_seq   | sequence | freecodecamp |
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | moon                 | table    | freecodecamp |
| public | moon_moon_id_seq     | sequence | freecodecamp |
| public | planet               | table    | freecodecamp |
| public | planet_planet_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(10 rows)

universe-> \d planet
                                           Table "public.planet"
+--------------+-----------------------+-----------+----------+-------------------------------------------+
|    Column    |         Type          | Collation | Nullable |                  Default                  |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id    | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                           |
| has_life     | boolean               |           | not null |                                           |
| is_spherical | boolean               |           | not null |                                           |
| description  | text                  |           |          |                                           |
| star_id      | integer               |           |          |                                           |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe-> SELECT * FROM planet
universe-> ;
ERROR:  syntax error at or near "/"
LINE 1: /d
        ^
universe=> SELECT * FROM planet;
+-----------+-----------+----------+--------------+----------------------------------------------------------------+---------+
| planet_id |   name    | has_life | is_spherical |                          description                           | star_id |
+-----------+-----------+----------+--------------+----------------------------------------------------------------+---------+
|         1 | mercury   | f        | t            | smallest planet closest to the sun                             |       1 |
|         2 | venus     | f        | t            | hottest planet in the solar system                             |       1 |
|         3 | earth     | t        | t            | only known planet inhabited by living things                   |       1 |
|         4 | mars      | f        | t            | dusty cold desert world very thin atmosphere                   |       1 |
|         5 | jupiter   | f        | t            | more then twice as massive then all the other planets combined |       1 |
|         6 | saturn    | f        | t            | has a complex system of icy rings                              |       1 |
|         7 | uranus    | f        | t            | seventh planet from the sun                                    |       1 |
|         8 | neptune   | f        | t            | furthest major planet dark cold whipped by supersonic winds    |       1 |
|         9 | pluto     | f        | t            | dwarf planet in the kuiper belt                                |       1 |
|        10 | proxima b | f        | t            | terrestrial planet                                             |       2 |
|        11 | proxima c | f        | t            | superearth or mini neptune                                     |       2 |
|        12 | proxima a | f        | t            | like mars                                                      |       2 |
+-----------+-----------+----------+--------------+----------------------------------------------------------------+---------+
(12 rows)

universe=> \d moon
                                          Table "public.moon"
+--------------+-----------------------+-----------+----------+---------------------------------------+
|    Column    |         Type          | Collation | Nullable |                Default                |
+--------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id      | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                       |
| has_life     | boolean               |           | not null |                                       |
| is_spherical | boolean               |           | not null |                                       |
| planet_id    | integer               |           |          |                                       |
| diameter_km  | integer               |           |          |                                       |
+--------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> ALTER TABLE moon DROP COLUMN diameter_km;
ALTER TABLE
universe=> ALTER TABLE MOON ADD COLUMN diameter_km NUMERIC;
ALTER TABLE
universe=> \d moon
                                          Table "public.moon"
+--------------+-----------------------+-----------+----------+---------------------------------------+
|    Column    |         Type          | Collation | Nullable |                Default                |
+--------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id      | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                       |
| has_life     | boolean               |           | not null |                                       |
| is_spherical | boolean               |           | not null |                                       |
| planet_id    | integer               |           |          |                                       |
| diameter_km  | numeric               |           |          |                                       |
+--------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d comet
                                            Table "public.comet"
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
|     Column      |         Type          | Collation | Nullable |                 Default                 |
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
| comet_id        | integer               |           | not null | nextval('comet_comet_id_seq'::regclass) |
| has_life        | boolean               |           |          |                                         |
| is_spherical    | boolean               |           |          |                                         |
| galaxy_id       | integer               |           |          |                                         |
| name            | character varying(20) |           | not null |                                         |
| year_discovered | integer               |           |          |                                         |
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
Indexes:
    "comet_pkey" PRIMARY KEY, btree (comet_id)
    "comet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "comet_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> \d moon
                                          Table "public.moon"
+--------------+-----------------------+-----------+----------+---------------------------------------+
|    Column    |         Type          | Collation | Nullable |                Default                |
+--------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id      | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                       |
| has_life     | boolean               |           | not null |                                       |
| is_spherical | boolean               |           | not null |                                       |
| planet_id    | integer               |           |          |                                       |
| diameter_km  | numeric               |           |          |                                       |
+--------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> ALTER TABLE moon DROP COLUMN diameter_km;
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN diameter_km INT;
ALTER TABLE
universe=> \d moon
                                          Table "public.moon"
+--------------+-----------------------+-----------+----------+---------------------------------------+
|    Column    |         Type          | Collation | Nullable |                Default                |
+--------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id      | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                       |
| has_life     | boolean               |           | not null |                                       |
| is_spherical | boolean               |           | not null |                                       |
| planet_id    | integer               |           |          |                                       |
| diameter_km  | integer               |           |          |                                       |
+--------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> INSERT INTO moon(name, has_life, is_spherical, planet_id, diameter_km) VALUES ('phobos', false, true, 4, 22);
INSERT 0 1
universe=> SELECT * FROM moon;
+---------+--------+----------+--------------+-----------+-------------+
| moon_id |  name  | has_life | is_spherical | planet_id | diameter_km |
+---------+--------+----------+--------------+-----------+-------------+
|       1 | phobos | f        | t            |         4 |          22 |
+---------+--------+----------+--------------+-----------+-------------+
(1 row)

universe=> INSERT INTO moon(name, has_life, is_spherical, planet_id, diameter_km) VALUES ('deimos', false, true, 4, 12), ('moon', false, true, 3, 3500), ('europa', false, true, 5, 3121);
INSERT 0 3
universe=> SELECT * FROM moon;
+---------+--------+----------+--------------+-----------+-------------+
| moon_id |  name  | has_life | is_spherical | planet_id | diameter_km |
+---------+--------+----------+--------------+-----------+-------------+
|       1 | phobos | f        | t            |         4 |          22 |
|       2 | deimos | f        | t            |         4 |          12 |
|       3 | moon   | f        | t            |         3 |        3500 |
|       4 | europa | f        | t            |         5 |        3121 |
+---------+--------+----------+--------------+-----------+-------------+
(4 rows)

universe=> INSERT INTO moon(name, has_life, is_spherical, planet_id, diameter_km) VALUES ('gamymede', false, true, 5, 5262), ('callisto', false, true, 5, 4821), ('themisto', false, true, 5, 8), ('leda', false, true, 5, 16);
INSERT 0 4
universe=> SELECT * FROM moon;
+---------+----------+----------+--------------+-----------+-------------+
| moon_id |   name   | has_life | is_spherical | planet_id | diameter_km |
+---------+----------+----------+--------------+-----------+-------------+
|       1 | phobos   | f        | t            |         4 |          22 |
|       2 | deimos   | f        | t            |         4 |          12 |
|       3 | moon     | f        | t            |         3 |        3500 |
|       4 | europa   | f        | t            |         5 |        3121 |
|       5 | gamymede | f        | t            |         5 |        5262 |
|       6 | callisto | f        | t            |         5 |        4821 |
|       7 | themisto | f        | t            |         5 |           8 |
|       8 | leda     | f        | t            |         5 |          16 |
+---------+----------+----------+--------------+-----------+-------------+
(8 rows)

universe=> INSERT INTO moon(name, has_life, is_spherical, planet_id, diameter_km) VALUES ('himalia', false, true, 5, 170), ('elara', false, true, 5, 86), ('dia', false, true, 5, 4), ('carpo', false, true, 5, 3), ('helike', false, true, 5, 4);
INSERT 0 5
universe=> SELECT * FROM moon;
+---------+----------+----------+--------------+-----------+-------------+
| moon_id |   name   | has_life | is_spherical | planet_id | diameter_km |
+---------+----------+----------+--------------+-----------+-------------+
|       1 | phobos   | f        | t            |         4 |          22 |
|       2 | deimos   | f        | t            |         4 |          12 |
|       3 | moon     | f        | t            |         3 |        3500 |
|       4 | europa   | f        | t            |         5 |        3121 |
|       5 | gamymede | f        | t            |         5 |        5262 |
|       6 | callisto | f        | t            |         5 |        4821 |
|       7 | themisto | f        | t            |         5 |           8 |
|       8 | leda     | f        | t            |         5 |          16 |
|       9 | himalia  | f        | t            |         5 |         170 |
|      10 | elara    | f        | t            |         5 |          86 |
|      11 | dia      | f        | t            |         5 |           4 |
|      12 | carpo    | f        | t            |         5 |           3 |
|      13 | helike   | f        | t            |         5 |           4 |
+---------+----------+----------+--------------+-----------+-------------+
(13 rows)

universe=> INSERT INTO moon(name, has_life, is_spherical, planet_id, diameter_km) VALUES ('locaste', false, true, 5, 5), ('thyone', false, true, 5, 4), ('titan', false, true, 5, 5149), ('mimas', false, true, 6, 396), ('enceladus', false, true, 6, 504);
INSERT 0 5
universe=> SELECT * FROM moon;
+---------+-----------+----------+--------------+-----------+-------------+
| moon_id |   name    | has_life | is_spherical | planet_id | diameter_km |
+---------+-----------+----------+--------------+-----------+-------------+
|       1 | phobos    | f        | t            |         4 |          22 |
|       2 | deimos    | f        | t            |         4 |          12 |
|       3 | moon      | f        | t            |         3 |        3500 |
|       4 | europa    | f        | t            |         5 |        3121 |
|       5 | gamymede  | f        | t            |         5 |        5262 |
|       6 | callisto  | f        | t            |         5 |        4821 |
|       7 | themisto  | f        | t            |         5 |           8 |
|       8 | leda      | f        | t            |         5 |          16 |
|       9 | himalia   | f        | t            |         5 |         170 |
|      10 | elara     | f        | t            |         5 |          86 |
|      11 | dia       | f        | t            |         5 |           4 |
|      12 | carpo     | f        | t            |         5 |           3 |
|      13 | helike    | f        | t            |         5 |           4 |
|      14 | locaste   | f        | t            |         5 |           5 |
|      15 | thyone    | f        | t            |         5 |           4 |
|      16 | titan     | f        | t            |         5 |        5149 |
|      17 | mimas     | f        | t            |         6 |         396 |
|      18 | enceladus | f        | t            |         6 |         504 |
+---------+-----------+----------+--------------+-----------+-------------+
(18 rows)

universe=> INSERT INTO moon(name, has_life, is_spherical, planet_id, diameter_km) VALUES ('dione', false, true, 6, 1123), ('rhea', false, true, 6, 1527);
INSERT 0 2
universe=> SELECT * FROM moon;
+---------+-----------+----------+--------------+-----------+-------------+
| moon_id |   name    | has_life | is_spherical | planet_id | diameter_km |
+---------+-----------+----------+--------------+-----------+-------------+
|       1 | phobos    | f        | t            |         4 |          22 |
|       2 | deimos    | f        | t            |         4 |          12 |
|       3 | moon      | f        | t            |         3 |        3500 |
|       4 | europa    | f        | t            |         5 |        3121 |
|       5 | gamymede  | f        | t            |         5 |        5262 |
|       6 | callisto  | f        | t            |         5 |        4821 |
|       7 | themisto  | f        | t            |         5 |           8 |
|       8 | leda      | f        | t            |         5 |          16 |
|       9 | himalia   | f        | t            |         5 |         170 |
|      10 | elara     | f        | t            |         5 |          86 |
|      11 | dia       | f        | t            |         5 |           4 |
|      12 | carpo     | f        | t            |         5 |           3 |
|      13 | helike    | f        | t            |         5 |           4 |
|      14 | locaste   | f        | t            |         5 |           5 |
|      15 | thyone    | f        | t            |         5 |           4 |
|      16 | titan     | f        | t            |         5 |        5149 |
|      17 | mimas     | f        | t            |         6 |         396 |
|      18 | enceladus | f        | t            |         6 |         504 |
|      19 | dione     | f        | t            |         6 |        1123 |
|      20 | rhea      | f        | t            |         6 |        1527 |
+---------+-----------+----------+--------------+-----------+-------------+
(20 rows)

universe=> \d comets
Did not find any relation named "comets".
universe=> \d comet
                                            Table "public.comet"
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
|     Column      |         Type          | Collation | Nullable |                 Default                 |
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
| comet_id        | integer               |           | not null | nextval('comet_comet_id_seq'::regclass) |
| has_life        | boolean               |           |          |                                         |
| is_spherical    | boolean               |           |          |                                         |
| galaxy_id       | integer               |           |          |                                         |
| name            | character varying(20) |           | not null |                                         |
| year_discovered | integer               |           |          |                                         |
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
Indexes:
    "comet_pkey" PRIMARY KEY, btree (comet_id)
    "comet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "comet_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> INSERT INTO comet(has_life, is_spherical, galaxy_id, name, year_discovered) VALUES (false, false, 1, 'deming', 1892);
INSERT 0 1
universe=> SELECT * FROM comet
universe-> ;
+----------+----------+--------------+-----------+--------+-----------------+
| comet_id | has_life | is_spherical | galaxy_id |  name  | year_discovered |
+----------+----------+--------------+-----------+--------+-----------------+
|        1 | f        | f            |         1 | deming |            1892 |
+----------+----------+--------------+-----------+--------+-----------------+
(1 row)

universe=> INSERT INTO comet(has_life, is_spherical, galaxy_id, name, year_discovered) VALUES (false, false, 1, 'donati', 1855), (false, false, 1, 'elias', 1981);
INSERT 0 2
universe=> SELECT * FROM moon;
+---------+-----------+----------+--------------+-----------+-------------+
| moon_id |   name    | has_life | is_spherical | planet_id | diameter_km |
+---------+-----------+----------+--------------+-----------+-------------+
|       1 | phobos    | f        | t            |         4 |          22 |
|       2 | deimos    | f        | t            |         4 |          12 |
|       3 | moon      | f        | t            |         3 |        3500 |
|       4 | europa    | f        | t            |         5 |        3121 |
|       5 | gamymede  | f        | t            |         5 |        5262 |
|       6 | callisto  | f        | t            |         5 |        4821 |
|       7 | themisto  | f        | t            |         5 |           8 |
|       8 | leda      | f        | t            |         5 |          16 |
|       9 | himalia   | f        | t            |         5 |         170 |
|      10 | elara     | f        | t            |         5 |          86 |
|      11 | dia       | f        | t            |         5 |           4 |
|      12 | carpo     | f        | t            |         5 |           3 |
|      13 | helike    | f        | t            |         5 |           4 |
|      14 | locaste   | f        | t            |         5 |           5 |
|      15 | thyone    | f        | t            |         5 |           4 |
|      16 | titan     | f        | t            |         5 |        5149 |
|      17 | mimas     | f        | t            |         6 |         396 |
|      18 | enceladus | f        | t            |         6 |         504 |
|      19 | dione     | f        | t            |         6 |        1123 |
|      20 | rhea      | f        | t            |         6 |        1527 |
+---------+-----------+----------+--------------+-----------+-------------+
(20 rows)

universe=> SELECT * FROM comet;
+----------+----------+--------------+-----------+--------+-----------------+
| comet_id | has_life | is_spherical | galaxy_id |  name  | year_discovered |
+----------+----------+--------------+-----------+--------+-----------------+
|        1 | f        | f            |         1 | deming |            1892 |
|        2 | f        | f            |         1 | donati |            1855 |
|        3 | f        | f            |         1 | elias  |            1981 |
+----------+----------+--------------+-----------+--------+-----------------+
(3 rows)

universe=> \d
                     List of relations
+--------+----------------------+----------+--------------+
| Schema |         Name         |   Type   |    Owner     |
+--------+----------------------+----------+--------------+
| public | comet                | table    | freecodecamp |
| public | comet_comet_id_seq   | sequence | freecodecamp |
| public | galaxy               | table    | freecodecamp |
| public | galaxy_galaxy_id_seq | sequence | freecodecamp |
| public | moon                 | table    | freecodecamp |
| public | moon_moon_id_seq     | sequence | freecodecamp |
| public | planet               | table    | freecodecamp |
| public | planet_planet_id_seq | sequence | freecodecamp |
| public | star                 | table    | freecodecamp |
| public | star_star_id_seq     | sequence | freecodecamp |
+--------+----------------------+----------+--------------+
(10 rows)

universe=> \d galaxy
                                                 Table "public.galaxy"
+---------------------------+-----------------------+-----------+----------+-------------------------------------------+
|          Column           |         Type          | Collation | Nullable |                  Default                  |
+---------------------------+-----------------------+-----------+----------+-------------------------------------------+
| galaxy_id                 | integer               |           | not null | nextval('galaxy_galaxy_id_seq'::regclass) |
| name                      | character varying(20) |           |          |                                           |
| has_life                  | boolean               |           | not null |                                           |
| is_spherical              | boolean               |           | not null |                                           |
| distance_from_earth_m_l_y | numeric               |           |          |                                           |
+---------------------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "comet" CONSTRAINT "comet_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> \d star
                                          Table "public.star"
+--------------+-----------------------+-----------+----------+---------------------------------------+
|    Column    |         Type          | Collation | Nullable |                Default                |
+--------------+-----------------------+-----------+----------+---------------------------------------+
| star_id      | integer               |           | not null | nextval('star_star_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                       |
| has_life     | boolean               |           | not null |                                       |
| is_spherical | boolean               |           | not null |                                       |
| galaxy_id    | integer               |           |          |                                       |
| type         | character varying(20) |           |          |                                       |
+--------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> \d planet
                                           Table "public.planet"
+--------------+-----------------------+-----------+----------+-------------------------------------------+
|    Column    |         Type          | Collation | Nullable |                  Default                  |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
| planet_id    | integer               |           | not null | nextval('planet_planet_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                           |
| has_life     | boolean               |           | not null |                                           |
| is_spherical | boolean               |           | not null |                                           |
| description  | text                  |           |          |                                           |
| star_id      | integer               |           |          |                                           |
+--------------+-----------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d moon
                                          Table "public.moon"
+--------------+-----------------------+-----------+----------+---------------------------------------+
|    Column    |         Type          | Collation | Nullable |                Default                |
+--------------+-----------------------+-----------+----------+---------------------------------------+
| moon_id      | integer               |           | not null | nextval('moon_moon_id_seq'::regclass) |
| name         | character varying(20) |           |          |                                       |
| has_life     | boolean               |           | not null |                                       |
| is_spherical | boolean               |           | not null |                                       |
| planet_id    | integer               |           |          |                                       |
| diameter_km  | integer               |           |          |                                       |
+--------------+-----------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> \d comet
                                            Table "public.comet"
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
|     Column      |         Type          | Collation | Nullable |                 Default                 |
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
| comet_id        | integer               |           | not null | nextval('comet_comet_id_seq'::regclass) |
| has_life        | boolean               |           |          |                                         |
| is_spherical    | boolean               |           |          |                                         |
| galaxy_id       | integer               |           |          |                                         |
| name            | character varying(20) |           | not null |                                         |
| year_discovered | integer               |           |          |                                         |
+-----------------+-----------------------+-----------+----------+-----------------------------------------+
Indexes:
    "comet_pkey" PRIMARY KEY, btree (comet_id)
    "comet_name_key" UNIQUE CONSTRAINT, btree (name)
Foreign-key constraints:
    "comet_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> SELECT * FROM galaxy;
+-----------+-------------------+----------+--------------+---------------------------+
| galaxy_id |       name        | has_life | is_spherical | distance_from_earth_m_l_y |
+-----------+-------------------+----------+--------------+---------------------------+
|         1 | milky way         | t        | f            |                         0 |
|         2 | canis major dwarf | f        | f            |                     0.025 |
|         3 | draco II          | f        | f            |                    0.0701 |
|         4 | segue I           | f        | f            |                     0.075 |
|         5 | hydrus I          | f        | f            |                    0.0900 |
|         6 | andromeda         | f        | f            |                       2.5 |
+-----------+-------------------+----------+--------------+---------------------------+
(6 rows)

universe=> SELECT * FROM star;
+---------+------------------+----------+--------------+-----------+--------------+
| star_id |       name       | has_life | is_spherical | galaxy_id |     type     |
+---------+------------------+----------+--------------+-----------+--------------+
|       1 | sun              | f        | t            |         1 | yellow dwarf |
|       2 | proxima centauri | f        | t            |         1 | m type       |
|       3 | sirius a         | f        | t            |         1 | white dwarf  |
|       4 | altair           | f        | t            |         1 | a type       |
|       5 | 64 and           | f        | t            |         6 | o type       |
|       6 | hip 2421         | f        | t            |         6 | red giant    |
+---------+------------------+----------+--------------+-----------+--------------+
(6 rows)

universe=> SELECT * FROM planet;
+-----------+-----------+----------+--------------+----------------------------------------------------------------+---------+
| planet_id |   name    | has_life | is_spherical |                          description                           | star_id |
+-----------+-----------+----------+--------------+----------------------------------------------------------------+---------+
|         1 | mercury   | f        | t            | smallest planet closest to the sun                             |       1 |
|         2 | venus     | f        | t            | hottest planet in the solar system                             |       1 |
|         3 | earth     | t        | t            | only known planet inhabited by living things                   |       1 |
|         4 | mars      | f        | t            | dusty cold desert world very thin atmosphere                   |       1 |
|         5 | jupiter   | f        | t            | more then twice as massive then all the other planets combined |       1 |
|         6 | saturn    | f        | t            | has a complex system of icy rings                              |       1 |
|         7 | uranus    | f        | t            | seventh planet from the sun                                    |       1 |
|         8 | neptune   | f        | t            | furthest major planet dark cold whipped by supersonic winds    |       1 |
|         9 | pluto     | f        | t            | dwarf planet in the kuiper belt                                |       1 |
|        10 | proxima b | f        | t            | terrestrial planet                                             |       2 |
|        11 | proxima c | f        | t            | superearth or mini neptune                                     |       2 |
|        12 | proxima a | f        | t            | like mars                                                      |       2 |
+-----------+-----------+----------+--------------+----------------------------------------------------------------+---------+
(12 rows)

universe=> SELECT * FROM moon;
+---------+-----------+----------+--------------+-----------+-------------+
| moon_id |   name    | has_life | is_spherical | planet_id | diameter_km |
+---------+-----------+----------+--------------+-----------+-------------+
|       1 | phobos    | f        | t            |         4 |          22 |
|       2 | deimos    | f        | t            |         4 |          12 |
|       3 | moon      | f        | t            |         3 |        3500 |
|       4 | europa    | f        | t            |         5 |        3121 |
|       5 | gamymede  | f        | t            |         5 |        5262 |
|       6 | callisto  | f        | t            |         5 |        4821 |
|       7 | themisto  | f        | t            |         5 |           8 |
|       8 | leda      | f        | t            |         5 |          16 |
|       9 | himalia   | f        | t            |         5 |         170 |
|      10 | elara     | f        | t            |         5 |          86 |
|      11 | dia       | f        | t            |         5 |           4 |
|      12 | carpo     | f        | t            |         5 |           3 |
|      13 | helike    | f        | t            |         5 |           4 |
|      14 | locaste   | f        | t            |         5 |           5 |
|      15 | thyone    | f        | t            |         5 |           4 |
|      16 | titan     | f        | t            |         5 |        5149 |
|      17 | mimas     | f        | t            |         6 |         396 |
|      18 | enceladus | f        | t            |         6 |         504 |
|      19 | dione     | f        | t            |         6 |        1123 |
|      20 | rhea      | f        | t            |         6 |        1527 |
+---------+-----------+----------+--------------+-----------+-------------+
(20 rows)

universe=> SELECT * FROM comet;
+----------+----------+--------------+-----------+--------+-----------------+
| comet_id | has_life | is_spherical | galaxy_id |  name  | year_discovered |
+----------+----------+--------------+-----------+--------+-----------------+
|        1 | f        | f            |         1 | deming |            1892 |
|        2 | f        | f            |         1 | donati |            1855 |
|        3 | f        | f            |         1 | elias  |            1981 |
+----------+----------+--------------+-----------+--------+-----------------+
(3 rows)

universe=> 
