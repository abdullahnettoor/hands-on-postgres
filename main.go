package main

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = "5432"
	database = "test"
)

var directorTable = `create table directors (
	director_uid UUID NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),

	CONSTRAINT directors_name_unique UNIQUE (first_name, last_name)
);`

var movieTable = `create table movies (
	movie_uid UUID NOT NULL PRIMARY KEY,
	title VARCHAR(250) NOT NULL,
	genre VARCHAR(100) NOT NULL,
	director UUID REFERENCES directors(director_uid),
	released_on DATE NOT NULL,
	gross NUMERIC(7, 2),

	CONSTRAINT movie_unique UNIQUE (title, genre, released_on)
);`

func main() {

	dbURI := fmt.Sprintf("host=%s port=%s database=%s sslmode=disable", host, port, database)

	db, err := sql.Open("postgres", dbURI)
	if err != nil {
		fmt.Println("Error opening db:", err)
		return
	}
	defer db.Close()

	_, err = db.Exec(directorTable)
	if err != nil {
		fmt.Println("Error Creating Director Table:", err)
		return
	}
	_, err = db.Exec(movieTable)
	if err != nil {
		fmt.Println("Error Creating Movie Table:", err)
		return
	}

	// Add movies to db
	_, err = db.Exec(`
	INSERT INTO movies (movie_uid, title, genre, released_on, gross) VALUES (uuid_generate_v4(), 'Tormented', 'Horror|Thriller', '2019-07-09', null);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'My Sex Life...', 'Comedy|Drama|Romance', '2012-05-17', 255.78);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Curly Top', 'Children|Musical|Romance', '2014-09-29', 771.23);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Blood for Dracula (Andy Warhol''s Dracula)', 'Horror', '2014-03-23', null);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'The Mark of Cain', 'Documentary|Drama', '2019-08-17', 184.25);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Where the Wild Things Are', 'Adventure|Children|Drama|Fantasy|IMAX', '2019-01-25', 621.09);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Labyrinth', 'Adventure|Fantasy|Musical', '2015-08-10', 565.32);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Ursul', 'Comedy|Drama', '2012-03-06', 855.56);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Fearless Hyena, The (Xiao quan guai zhao)', 'Action|Comedy', '2014-12-19', 507.27);
	insert into movies (movie_uid, title, genre, released_on, gross) values (uuid_generate_v4(), 'Lady Dragon', 'Action|Drama', '2010-09-26', null);
	`)
	if err != nil {
		fmt.Println("Error Inserting Movies:", err)
		return
	}

	// Add directors to db
	_, err = db.Exec(`
	insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Theo', 'Geffcock');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Korie', 'Sayre');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Darrel', 'Yakob');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Sybilla', 'Coulling');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Kyle', 'Gronow');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Lotty', 'Gerrens');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Nydia', 'Barracks');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Jerrine', 'Kinnaird');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Page', 'Insworth');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Kelcie', 'Toppin');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Wayne', null);
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Keri', 'Jozefczak');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Kerri', 'Logg');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Chadwick', 'Marco');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Lars', 'Vyse');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Alysia', 'Bramsom');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Lynnet', null);
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Bell', 'McVicker');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Etty', 'Gerrelt');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Candide', 'De Brett');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Griffy', 'Murney');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Nickie', 'Sokale');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Natale', 'Lacheze');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Lorinda', 'Wapple');
insert into directors (director_uid, first_name, last_name) values (uuid_generate_v4(), 'Charmaine', 'Kinnach');
	`)
	if err != nil {
		fmt.Println("Error Inserting Directors:", err)
		return
	}

	// Update movies with random directors
	_, err = db.Exec(`UPDATE movies
	SET director = (
		SELECT director_uid
		FROM directors
		ORDER BY random()
		LIMIT 1
	);`)
	if err != nil {
		fmt.Println("Error Updating directors in Movie Table:", err)
		return
	}

	rows, err := db.Query("SELECT movie_uid, title, genre FROM movies LIMIT 10")
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer rows.Close()

	for rows.Next() {
		var id, title, genre string
		err := rows.Scan(&id, &title, &genre)
		if err != nil {
			fmt.Println("Error fetching results:", err)
			return
		}
		fmt.Printf("Id: %s\tName: %s\t DOB: %s\n", id, title, genre)
	}

	fmt.Println("----END----")
}
