package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from go in Docker!")
	fmt.Printf("Request received from: %s\n", r.RemoteAddr)
}


func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server started on :8080")
	http.ListenAndServe(":8080", nil)
}
