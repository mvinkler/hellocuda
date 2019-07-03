package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"os/exec"
)

func handler(w http.ResponseWriter, r *http.Request) {
	cmd := exec.Command("/usr/local/cuda/samples/0_Simple/vectorAdd/vectorAdd")

	stdoutStderr, err := cmd.CombinedOutput()
	s := string(stdoutStderr)

	if err != nil {
		log.Print("Error executing vectorAdd: ", err)
		fmt.Fprintln(w,"Error executing vectorAdd: ", err)
	}

	log.Print("cuda-vector-add output: ", s)
	fmt.Fprintln(w,"cuda-vector-add output: ", s)
}

func main() {
	flag.Parse()
	log.Print("Hello world CUDA sample started.")

	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}