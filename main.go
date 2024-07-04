package main

import (
	"log"
	"net/http"

	"github.com/PranitRout07/Practice-Golang/login-logout/initializers"
	"github.com/PranitRout07/Practice-Golang/login-logout/middlewares"
	"github.com/PranitRout07/Practice-Golang/login-logout/routes"
)


func init() {
	if middlewares.IsRunningInContainer(){
		log.Println("Running in docker container...")
	}else{
		initializers.LoadEnvVariables()
	}
	
	initializers.ConnectDB()
	initializers.Create_table()
}
func main() {
	r := routes.Routes()

	log.Fatal(http.ListenAndServe(":8000",r ))
	
}