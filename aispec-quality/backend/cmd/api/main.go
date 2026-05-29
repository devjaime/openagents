package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/devjaime/aispec-quality/internal/config"
	"github.com/devjaime/aispec-quality/internal/handlers"
	"github.com/devjaime/aispec-quality/internal/middleware"
)

func main() {
	// Load configuration
	cfg := config.Load()

	// Set Gin mode
	if cfg.Env == "production" {
		gin.SetMode(gin.ReleaseMode)
	}

	// Initialize router
	r := gin.Default()

	// Middleware
	r.Use(middleware.CORS())
	r.Use(middleware.Logger())

	// Health check
	r.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{"status": "ok"})
	})

	// API Routes
	api := r.Group("/api/v1")
	{
		// Auth routes (public)
		auth := api.Group("/auth")
		{
			auth.POST("/github", handlers.GitHubAuth)
			auth.POST("/refresh", handlers.RefreshToken)
		}

		// Protected routes
		protected := api.Group("")
		protected.Use(middleware.Auth())
		{
			// Projects
			projects := protected.Group("/projects")
			{
				projects.GET("", handlers.ListProjects)
				projects.POST("", handlers.CreateProject)
				projects.GET("/:id", handlers.GetProject)
				projects.DELETE("/:id", handlers.DeleteProject)
				projects.POST("/:id/analyze", handlers.TriggerAnalysis)
			}

			// Analysis
			analysis := protected.Group("/analysis")
			{
				analysis.GET("/:id", handlers.GetAnalysis)
				analysis.GET("/:id/quality", handlers.GetQualityMetrics)
				analysis.GET("/:id/specs", handlers.GetSpecCoverage)
			}

			// ROI Calculator
			roi := protected.Group("/roi")
			{
				roi.POST("/calculate", handlers.CalculateROI)
				roi.GET("/projects/:id", handlers.GetROIHistory)
			}
		}
	}

	// Start server
	port := cfg.Port
	if port == "" {
		port = "8080"
	}

	log.Printf("🚀 Server starting on port %s", port)
	if err := r.Run(":" + port); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
