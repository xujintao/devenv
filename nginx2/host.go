package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

// go build host.go
// sudo ./host

func main() {
	// foo
	http.HandleFunc("/foo", func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, fmt.Sprintf("https://%s", r.Host), 302)

		// log
		fmt.Fprintf(os.Stdout,
			"%s - - [%s] \"%s %s HTTP/%d.%d\" host[%s] %d %s \"%s\" \"%s\" \"%s\" \"%s\"\n",
			r.RemoteAddr, time.Now().Format(time.RFC1123Z), r.Method, r.RequestURI, r.ProtoMajor, r.ProtoMinor, r.Host,
			302, w.Header().Get("Content-Length"), r.Referer(), r.UserAgent(), r.Header.Get("X-Forwarded-For"), r.Header.Get("x-Real-IP"))
	})

	// root
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(200)
		n, err := w.Write([]byte("hello"))
		if err != nil {
			log.Fatalln(err)
		}
		// log
		fmt.Fprintf(os.Stdout,
			"%s - - [%s] \"%s %s HTTP/%d.%d\" host[%s] %d %d \"%s\" \"%s\" \"%s\" \"%s\"\n",
			r.RemoteAddr, time.Now().Format(time.RFC1123Z), r.Method, r.RequestURI, r.ProtoMajor, r.ProtoMinor, r.Host,
			200, n, r.Referer(), r.UserAgent(), r.Header.Get("X-Forwarded-For"), r.Header.Get("x-Real-IP"))
	})

	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatalln(err)
	}
}
