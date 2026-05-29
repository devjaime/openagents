package config

import (
	"os"
)

// Config holds application configuration
type Config struct {
	Env            string
	Port           string
	DatabaseURL    string
	RedisURL       string
	JWTSecret      string
	GitHubClientID string
	GitHubSecret   string
	FrontendURL    string
}

// Load loads configuration from environment variables
func Load() *Config {
	return &Config{
		Env:            getEnv("ENV", "development"),
		Port:           getEnv("PORT", "8080"),
		DatabaseURL:    getEnv("DATABASE_URL", "postgres://localhost:5432/aispec?sslmode=disable"),
		RedisURL:       getEnv("REDIS_URL", "redis://localhost:6379"),
		JWTSecret:      getEnv("JWT_SECRET", "dev-secret-change-in-production"),
		GitHubClientID: getEnv("GITHUB_CLIENT_ID", ""),
		GitHubSecret:   getEnv("GITHUB_SECRET", ""),
		FrontendURL:    getEnv("FRONTEND_URL", "http://localhost:3000"),
	}
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}
