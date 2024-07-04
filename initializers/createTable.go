package initializers

import (
	"log"
)

func Check_If_Table_Of_Same_Name_Exists()bool {
	sqlQuery := "SELECT * FROM person"
	_,err := DBConnection.Exec(sqlQuery)
	return err == nil 

}

func Create_table() {
	if Check_If_Table_Of_Same_Name_Exists() {
		log.Println("Table exists already..")
		return
	}
	sqlQuery := `CREATE TABLE person(  
					id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
					email VARCHAR(255),
					password VARCHAR(255)
					);`
	_, err := DBConnection.Exec(sqlQuery)
	if err != nil {
		log.Fatal("error while creating table",err)
	}

}
