create table directors (
	dirctor_uid UUID NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,

	CONSTRAINT directors_name_unique UNIQUE (first_name, last_name)
);
-- directors
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Theo', 'Geffcock');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Korie', 'Sayre');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Darrel', 'Yakob');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Sybilla', 'Coulling');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Kyle', 'Gronow');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Lotty', 'Gerrens');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Nydia', 'Barracks');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Jerrine', 'Kinnaird');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Page', 'Insworth');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Kelcie', 'Toppin');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Wayne', null);
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Keri', 'Jozefczak');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Kerri', 'Logg');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Chadwick', 'Marco');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Lars', 'Vyse');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Alysia', 'Bramsom');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Lynnet', null);
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Bell', 'McVicker');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Etty', 'Gerrelt');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Candide', 'De Brett');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Griffy', 'Murney');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Nickie', 'Sokale');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Natale', 'Lacheze');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Lorinda', 'Wapple');
insert into directors (dirctor_uid, first_name, last_name) values (uuid_generate_v4(), 'Charmaine', 'Kinnach');

create table movies (
	movie_uid UUID NOT NULL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	genre VARCHAR(50) NOT NULL,
	director UUID REFERENCES directors(dirctor_uid),
	released_on DATE NOT NULL,
	gross NUMERIC(7,movie_uid,  2)

	CONSTRAINT movie_unique UNIQUE (title, genre, released_on)
);

UPDATE movies
SET director = (
    SELECT director_uid
    FROM directors
    ORDER BY random()
    LIMIT 1
);

-- movies
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Tormented', 'Horror|Thriller', '2019-07-09', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'My Sex Life... or How I Got Into an Argument (Comment je me suis disputé... (ma vie sexuelle))', 'Comedy|Drama|Romance', '2012-05-17', 255.78);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Curly Top', 'Children|Musical|Romance', '2014-09-29', 771.23);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Blood for Dracula (Andy Warhol''s Dracula)', 'Horror', '2014-03-23', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'The Mark of Cain', 'Documentary|Drama', '2019-08-17', 184.25);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Where the Wild Things Are', 'Adventure|Children|Drama|Fantasy|IMAX', '2019-01-25', 621.09);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Labyrinth', 'Adventure|Fantasy|Musical', '2015-08-10', 565.32);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Ursul', 'Comedy|Drama', '2012-03-06', 855.56);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Fearless Hyena, The (Xiao quan guai zhao)', 'Action|Comedy', '2014-12-19', 507.27);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Lady Dragon', 'Action|Drama', '2010-09-26', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'London', 'Documentary', '2020-12-02', 338.43);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Picking Up the Pieces', 'Comedy|Fantasy', '2017-06-09', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Me You Them (Eu, Tu, Eles)', 'Comedy|Drama|Romance', '2014-12-02', 357.68);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Downhill', 'Drama', '2020-08-01', 393.44);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Honest Liar, An', 'Comedy|Documentary', '2016-02-27', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Shanghai Triad (Yao a yao yao dao waipo qiao)', 'Crime|Drama', '2018-05-18', 283.17);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Return to Me', 'Drama|Romance', '2018-04-03', 436.58);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Tales of Hoffmann, The', 'Adventure|Fantasy|Musical|Romance', '2016-02-08', 877.1);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Legend of the Guardians: The Owls of Ga''Hoole', 'Adventure|Animation|Fantasy|IMAX', '2015-10-01', 801.63);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Stolen Children (Ladro di bambini, Il)', 'Drama', '2017-08-17', 516.86);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Broken Embraces (Los abrazos rotos)', 'Drama|Romance|Thriller', '2013-07-27', 823.29);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Annie Oakley', 'Drama|Western', '2013-05-28', 720.54);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Magnificent Obsession', 'Drama|Romance', '2015-12-15', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Ward 13', 'Action|Animation|Comedy|Horror', '2010-02-09', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Oedipus Rex (Edipo re)', 'Drama', '2013-08-07', 812.07);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Fog, The', 'Horror', '2016-08-13', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Wrong Guy, The', 'Comedy|Romance|Thriller', '2013-04-24', 516.84);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Class of Nuke ''Em High Part II: Subhumanoid Meltdown', 'Comedy|Horror|Sci-Fi', '2016-10-01', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'The French Kissers', 'Comedy', '2015-06-07', 174.31);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Bonheur, Le', 'Drama', '2011-10-03', 697.42);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'It Had to Be You', 'Comedy|Romance', '2016-09-12', 802.84);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Jackass 3D', 'Action|Comedy|Documentary', '2012-02-24', 823.75);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Hachiko: A Dog''s Story (a.k.a. Hachi: A Dog''s Tale)', 'Drama', '2011-10-12', 449.0);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Dead Ringers', 'Drama|Horror|Thriller', '2012-11-19', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'When Animals Dream (Når dyrene drømmer)', 'Drama|Horror|Mystery', '2013-10-25', 144.75);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), '9 Star Hotel (Malon 9 Kochavim)', 'Documentary', '2017-01-15', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Magnum Force', 'Action|Crime|Drama|Thriller', '2014-03-03', 628.09);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Grumpier Old Men', 'Comedy|Romance', '2010-04-23', 279.62);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Puppet Master II', 'Horror|Sci-Fi|Thriller', '2014-04-26', 819.48);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), '18 Years Later (Diciotto anni dopo)', 'Comedy|Drama', '2018-01-03', 260.33);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Four Sided Triangle', 'Romance|Sci-Fi', '2014-09-01', 374.3);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Listen to Britain', 'Documentary', '2017-03-11', 280.19);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Executioner, The', 'Drama|Thriller', '2015-06-06', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Girl with the Dragon Tattoo, The', 'Drama|Thriller', '2010-04-02', 531.04);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Sagebrush Trail', 'Western', '2013-09-30', 804.51);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Outcast of the Islands', 'Adventure|Drama', '2013-01-19', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Mona and the Time of Burning Love (Mona ja palavan rakkauden aika))', 'Drama', '2019-11-06', 162.27);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Glenn Killing på Berns', 'Comedy', '2010-11-24', 691.03);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Sherlock Holmes', 'Mystery|Sci-Fi', '2016-04-19', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Harvey Girls, The', 'Comedy|Musical|Western', '2013-12-25', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Vollidiot', 'Comedy|Drama', '2017-03-26', 695.54);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Flash of Genius', 'Drama', '2018-10-11', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Dieta mediterránea', 'Comedy|Drama|Romance', '2018-08-03', 493.21);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Zero Charisma', 'Comedy|Drama', '2016-05-05', 971.67);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Ice Cream Man', 'Comedy|Horror', '2015-06-28', 577.32);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'One Week', 'Adventure|Drama', '2018-08-30', 151.85);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'My Joy (Schastye moe)', 'Drama', '2016-01-30', 743.7);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Thank You, Jeeves!', '(no genres listed)', '2017-09-28', 128.28);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Artist, The', 'Drama|Romance', '2019-07-11', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Christmas Evil (a.k.a. You Better Watch Out)', 'Horror|Thriller', '2020-07-17', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Conspirator, The', 'Drama', '2014-03-19', 803.41);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Gambit', 'Comedy|Crime', '2012-01-30', 281.87);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Slipping-Down Life, A', 'Drama|Romance', '2019-06-18', 647.42);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Back to the USSR - takaisin Ryssiin', 'Comedy|Drama', '2010-04-25', 814.15);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Wish I Was Here', 'Comedy|Drama', '2011-03-22', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Truth in 24', 'Documentary', '2015-05-26', 218.16);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Beneath the Planet of the Apes', 'Action|Sci-Fi', '2015-08-02', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'My Night At Maud''s (Ma Nuit Chez Maud)', 'Comedy|Drama|Romance', '2014-03-27', 428.63);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'And So It Is', 'Drama', '2014-05-04', 810.69);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Mischief Night', 'Drama|Horror|Thriller', '2017-06-10', 119.26);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'What Price Hollywood?', 'Drama', '2016-03-27', 746.59);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Suspiria', 'Horror', '2018-03-24', 507.86);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Bastards (Les salauds)', 'Drama', '2017-04-09', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Pepe', 'Comedy|Musical', '2017-05-31', 971.17);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Dead Outside, The', 'Horror|Mystery|Thriller', '2020-05-20', 595.78);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Rumor Has It...', 'Comedy|Drama|Romance', '2020-08-29', 210.25);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Dead Man', 'Drama|Mystery|Western', '2011-11-03', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Six Pack', 'Comedy|Drama', '2012-10-15', 904.65);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Dead or Alive 2: Tôbôsha', 'Action|Crime|Thriller', '2014-04-11', 828.05);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'In the Folds of the Flesh', 'Drama|Horror|Thriller', '2011-11-22', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Pope of Greenwich Village, The', 'Drama', '2020-08-10', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Avventura, L'' (Adventure, The)', 'Drama|Mystery|Romance', '2010-06-13', 543.81);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Blue Bird, The', 'Children|Fantasy', '2010-05-16', 884.02);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Saban, Son of Saban', 'Comedy|Crime|Mystery', '2018-07-27', 758.9);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Aliens of the Deep', 'Documentary|IMAX', '2019-08-18', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'K-9', 'Action|Comedy|Crime', '2010-03-01', 649.24);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Moon in the Gutter, The (La lune dans le caniveau)', 'Drama', '2015-11-27', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Garfield''s Fun Fest', 'Animation|Children|Comedy|Fantasy', '2017-12-17', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Innocence', 'Drama', '2012-04-15', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Smile Like Yours, A', 'Comedy|Romance', '2011-06-12', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Woman in the Fifth, The (Femme du Vème, La)', 'Drama|Mystery|Thriller', '2014-03-10', 514.67);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'The Puzzle', 'Drama', '2011-11-13', 839.67);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Son of Lassie', 'Children|Drama', '2019-04-17', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'The Lost Squadron', '(no genres listed)', '2019-08-14', 429.36);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Half of a Yellow Sun', 'Drama|Romance', '2013-11-27', 643.11);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Amos & Andrew', 'Comedy', '2010-01-31', 704.21);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'China O''Brien', 'Action', '2018-09-12', 323.54);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Criminal', 'Comedy|Drama', '2013-03-29', 107.77);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'DEFCON: The Documentary', 'Documentary', '2015-04-23', null);
insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Puffy Chair, The', 'Drama|Romance', '2010-08-04', null);
