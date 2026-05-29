package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"time"

	"github.com/joho/godotenv"
	"github.com/supabase-community/supabase-go"
)

type Config struct {
	SupabaseURL  string
	SupabaseKey  string
	OpenAIKey    string
	Port         string
}

type Conversation struct {
	ID         int64                  `json:"id"`
	SessionID  string                 `json:"session_id"`
	UserID     string                 `json:"user_id"`
	Role       string                 `json:"role"`
	Content    string                 `json:"content"`
	Metadata   map[string]interface{} `json:"metadata"`
	CreatedAt  time.Time             `json:"created_at"`
}

type SaveRequest struct {
	SessionID string `json:"session_id"`
	UserID    string `json:"user_id"`
	Role      string `json:"role"`
	Content   string `json:"content"`
}

type SearchRequest struct {
	Query    string `json:"query"`
	UserID   string `json:"user_id"`
	Limit    int    `json:"limit"`
}

type SearchResult struct {
	ID        int64   `json:"id"`
	SessionID string  `json:"session_id"`
	Role      string  `json:"role"`
	Content   string  `json:"content"`
	Score     float64 `json:"score"`
}

var client *supabase.Client
var config Config

func init() {
	godotenv.Load()
	config = Config{
		SupabaseURL:  getEnv("SUPABASE_URL", ""),
		SupabaseKey:  getEnv("SUPABASE_KEY", ""),
		OpenAIKey:    getEnv("OPENAI_API_KEY", ""),
		Port:         getEnv("PORT", "8080"),
	}

	supabaseClient, err := supabase.NewClient(config.SupabaseURL, config.SupabaseKey)
	if err != nil {
		log.Printf("Warning: Could not initialize Supabase client: %v", err)
	} else {
		client = supabaseClient
	}
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}

// Handlers

func healthHandler(w http.ResponseWriter, r *http.Request) {
	json.NewEncoder(w).Encode(map[string]string{"status": "ok"})
}

func saveHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	var req SaveRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Guardar en Supabase
	conversation := Conversation{
		SessionID: req.SessionID,
		UserID:    req.UserID,
		Role:      req.Role,
		Content:   req.Content,
		Metadata:  map[string]interface{}{},
	}

	resp, err := client.From("conversations").
		Insert(conversation).
		Execute()

	if err != nil {
		log.Printf("Error saving conversation: %v", err)
		http.Error(w, "Failed to save", http.StatusInternalServerError)
		return
	}

	json.NewEncoder(w).Encode(resp)
}

func searchHandler(w http.ResponseWriter, r *http.Request) {
	query := r.URL.Query().Get("q")
	userID := r.URL.Query().Get("user_id")
	limit := 5

	if limitStr := r.URL.Query().Get("limit"); limitStr != "" {
		fmt.Sscanf(limitStr, "%d", &limit)
	}

	if query == "" {
		http.Error(w, "Missing query parameter 'q'", http.StatusBadRequest)
		return
	}

	// TODO: Generate embedding and search
	// For now, return recent conversations as fallback
	
	var results []Conversation
	_, err := client.From("conversations").
		Select("*", "exact", false).
		Eq("user_id", userID).
		Order("created_at", &supabase.SortDesc).
		Limit(limit).
		ExecuteTo(&results)

	if err != nil {
		log.Printf("Error searching: %v", err)
		http.Error(w, "Search failed", http.StatusInternalServerError)
		return
	}

	json.NewEncoder(w).Encode(results)
}

func sessionHandler(w http.ResponseWriter, r *http.Request) {
	sessionID := r.URL.Path[len("/api/session/"):]

	if sessionID == "" {
		http.Error(w, "Missing session ID", http.StatusBadRequest)
		return
	}

	var results []Conversation
	_, err := client.From("conversations").
		Select("*", "exact", false).
		Eq("session_id", sessionID).
		Order("created_at", &supabase.SortAsc).
		ExecuteTo(&results)

	if err != nil {
		log.Printf("Error fetching session: %v", err)
		http.Error(w, "Failed to fetch session", http.StatusInternalServerError)
		return
	}

	json.NewEncoder(w).Encode(results)
}

func main() {
	http.HandleFunc("/health", healthHandler)
	http.HandleFunc("/api/save", saveHandler)
	http.HandleFunc("/api/search", searchHandler)
	http.HandleFunc("/api/session/", sessionHandler)

	log.Printf("Memory Agent running on port %s", config.Port)
	log.Fatal(http.ListenAndServe(":"+config.Port, nil))
}
