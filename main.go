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

func main() {

	dbURI := fmt.Sprintf("host=%s port=%s database=%s sslmode=disable", host, port, database)

	db, err := sql.Open("postgres", dbURI)
	if err != nil {
		fmt.Println("Error opening db:", err)
		return
	}
	// var name string
	defer db.Close()
	rows, err := db.Query("SELECT first_name, date_of_birth FROM person LIMIT 10")
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	for rows.Next() {
		var first_name, date_of_birth string
		err := rows.Scan(&first_name, &date_of_birth)
		if err != nil {
			fmt.Println("Error fetching results:", err)
			return
		}

		fmt.Printf("Name: %s\t DOB: %s\n", first_name, date_of_birth)

	}

	fmt.Println("Hello, Guys")
}
