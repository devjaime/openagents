"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import {
  Activity,
  GitBranch,
  PieChart,
  Settings,
  Users,
  BarChart3,
  FileText,
  Bell,
} from "lucide-react";

export default function Dashboard() {
  const [loading, setLoading] = useState(true);
  const [stats, setStats] = useState({
    projects: 5,
    overallScore: 78,
    grade: "B+",
    specCoverage: 75,
    aiRiskFiles: 3,
    roi: 247,
  });

  useEffect(() => {
    // Simulate loading data
    setTimeout(() => setLoading(false), 1000);
  }, []);

  const qualityMetrics = [
    { name: "Cyclomatic Complexity", value: 82, grade: "A" },
    { name: "Cognitive Complexity", value: 65, grade: "B" },
    { name: "Halstead Effort", value: 70, grade: "B+" },
    { name: "Spec Coverage", value: 75, grade: "B+" },
    { name: "Duplication", value: 88, grade: "A" },
    { name: "Maintainability", value: 64, grade: "B" },
  ];

  const recentProjects = [
    { id: 1, name: "myapp", grade: "B+", score: 78, lastAnalyzed: "2 hours ago" },
    { id: 2, name: "aispec-api", grade: "A-", score: 85, lastAnalyzed: "5 hours ago" },
    { id: 3, name: "dashboard-ui", grade: "C+", score: 62, lastAnalyzed: "1 day ago" },
  ];

  const driftAlerts = [
    { file: "src/auth/login.ts", type: "spec_outdated", severity: "high" },
    { file: "src/payment/stripe.ts", type: "code_changed", severity: "medium" },
  ];

  if (loading) {
    return (
      <div className="flex h-screen items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex items-center space-x-2">
              <Activity className="h-8 w-8 text-blue-600" />
              <span className="text-xl font-bold text-gray-900">AISpec Quality</span>
            </div>
            <div className="flex items-center space-x-4">
              <button className="p-2 text-gray-400 hover:text-gray-600">
                <Bell className="h-5 w-5" />
              </button>
              <div className="h-8 w-8 rounded-full bg-blue-600 flex items-center justify-center text-white text-sm font-medium">
                JD
              </div>
            </div>
          </div>
        </div>
      </header>

      <div className="flex">
        {/* Sidebar */}
        <aside className="w-64 bg-white border-r border-gray-200 min-h-screen">
          <nav className="p-4 space-y-1">
            <Link
              href="/dashboard"
              className="flex items-center space-x-3 px-3 py-2 rounded-md bg-blue-50 text-blue-700"
            >
              <BarChart3 className="h-5 w-5" />
              <span>Dashboard</span>
            </Link>
            <Link
              href="/projects"
              className="flex items-center space-x-3 px-3 py-2 rounded-md text-gray-700 hover:bg-gray-50"
            >
              <GitBranch className="h-5 w-5" />
              <span>Projects</span>
            </Link>
            <Link
              href="/analysis"
              className="flex items-center space-x-3 px-3 py-2 rounded-md text-gray-700 hover:bg-gray-50"
            >
              <PieChart className="h-5 w-5" />
              <span>Analysis</span>
            </Link>
            <Link
              href="/roi"
              className="flex items-center space-x-3 px-3 py-2 rounded-md text-gray-700 hover:bg-gray-50"
            >
              <Activity className="h-5 w-5" />
              <span>ROI Calculator</span>
            </Link>
            <Link
              href="/reports"
              className="flex items-center space-x-3 px-3 py-2 rounded-md text-gray-700 hover:bg-gray-50"
            >
              <FileText className="h-5 w-5" />
              <span>Reports</span>
            </Link>
            <Link
              href="/team"
              className="flex items-center space-x-3 px-3 py-2 rounded-md text-gray-700 hover:bg-gray-50"
            >
              <Users className="h-5 w-5" />
              <span>Team</span>
            </Link>
            <Link
              href="/settings"
              className="flex items-center space-x-3 px-3 py-2 rounded-md text-gray-700 hover:bg-gray-50"
            >
              <Settings className="h-5 w-5" />
              <span>Settings</span>
            </Link>
          </nav>
        </aside>

        {/* Main Content */}
        <main className="flex-1 p-8">
          <div className="mb-8">
            <h1 className="text-2xl font-bold text-gray-900">Dashboard</h1>
            <p className="text-gray-600">Overview of your code quality and AI ROI metrics</p>
          </div>

          {/* Stats Cards */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <div className="bg-white rounded-lg shadow p-6">
              <div className="flex items-center justify-between mb-4">
                <span className="text-sm font-medium text-gray-600">Overall Score</span>
                <span className="text-2xl font-bold text-blue-600">{stats.grade}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div
                  className="bg-blue-600 h-2 rounded-full"
                  style={{ width: `${stats.overallScore}%` }}
                />
              </div>
              <span className="text-sm text-gray-500 mt-2">{stats.overallScore}/100</span>
            </div>

            <div className="bg-white rounded-lg shadow p-6">
              <div className="flex items-center justify-between mb-4">
                <span className="text-sm font-medium text-gray-600">Spec Coverage</span>
                <span className="text-2xl font-bold text-green-600">{stats.specCoverage}%</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div
                  className="bg-green-600 h-2 rounded-full"
                  style={{ width: `${stats.specCoverage}%` }}
                />
              </div>
              <span className="text-sm text-gray-500 mt-2">Target: 80%</span>
            </div>

            <div className="bg-white rounded-lg shadow p-6">
              <div className="flex items-center justify-between mb-4">
                <span className="text-sm font-medium text-gray-600">AI ROI</span>
                <span className="text-2xl font-bold text-emerald-600">+{stats.roi}%</span>
              </div>
              <p className="text-sm text-gray-500">Compared to traditional dev</p>
            </div>

            <div className="bg-white rounded-lg shadow p-6">
              <div className="flex items-center justify-between mb-4">
                <span className="text-sm font-medium text-gray-600">AI Risk Files</span>
                <span className="text-2xl font-bold text-red-600">{stats.aiRiskFiles}</span>
              </div>
              <p className="text-sm text-gray-500">Require attention</p>
            </div>
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {/* Quality Metrics */}
            <div className="bg-white rounded-lg shadow p-6">
              <h2 className="text-lg font-semibold text-gray-900 mb-6">Quality Metrics</h2>
              <div className="space-y-4">
                {qualityMetrics.map((metric) => (
                  <div key={metric.name}>
                    <div className="flex items-center justify-between mb-1">
                      <span className="text-sm text-gray-700">{metric.name}</span>
                      <span className="text-sm font-medium text-gray-900">
                        {metric.value}/100 ({metric.grade})
                      </span>
                    </div>
                    <div className="w-full bg-gray-200 rounded-full h-2">
                      <div
                        className={`h-2 rounded-full ${
                          metric.value >= 80
                            ? "bg-green-600"
                            : metric.value >= 60
                            ? "bg-yellow-500"
                            : "bg-red-600"
                        }`}
                        style={{ width: `${metric.value}%` }}
                      />
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Recent Projects */}
            <div className="bg-white rounded-lg shadow p-6">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-lg font-semibold text-gray-900">Recent Projects</h2>
                <Link
                  href="/projects"
                  className="text-sm text-blue-600 hover:text-blue-800"
                >
                  View all
                </Link>
              </div>
              <div className="space-y-4">
                {recentProjects.map((project) => (
                  <div
                    key={project.id}
                    className="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50"
                  >
                    <div className="flex items-center space-x-4">
                      <div className="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center">
                        <GitBranch className="h-5 w-5 text-blue-600" />
                      </div>
                      <div>
                        <p className="font-medium text-gray-900">{project.name}</p>
                        <p className="text-sm text-gray-500">Analyzed {project.lastAnalyzed}</p>
                      </div>
                    </div>
                    <div className="flex items-center space-x-4">
                      <div className="text-right">
                        <p className="text-sm font-medium text-gray-900">Grade: {project.grade}</p>
                        <p className="text-sm text-gray-500">Score: {project.score}</p>
                      </div>
                      <button className="p-2 text-gray-400 hover:text-gray-600">
                        <Activity className="h-5 w-5" />
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Spec Drift Alerts */}
          {driftAlerts.length > 0 && (
            <div className="mt-8 bg-amber-50 border border-amber-200 rounded-lg p-6">
              <div className="flex items-center space-x-2 mb-4">
                <Bell className="h-5 w-5 text-amber-600" />
                <h2 className="text-lg font-semibold text-amber-900">Spec Drift Detected</h2>
              </div>
              <div className="space-y-2">
                {driftAlerts.map((alert, idx) => (
                  <div
                    key={idx}
                    className="flex items-center justify-between p-3 bg-white rounded-md"
                  >
                    <div className="flex items-center space-x-3">
                      <span
                        className={`inline-flex items-center px-2 py-1 rounded-full text-xs font-medium ${
                          alert.severity === "high"
                            ? "bg-red-100 text-red-800"
                            : "bg-yellow-100 text-yellow-800"
                        }`}
                      >
                        {alert.severity.toUpperCase()}
                      </span>
                      <span className="text-sm text-gray-700">{alert.file}</span>
                    </div>
                    <span className="text-sm text-gray-500 capitalize">{alert.type.replace("_", " ")}</span>
                  </div>
                ))}
              </div>
              <div className="mt-4 flex space-x-4">
                <button className="px-4 py-2 bg-amber-600 text-white rounded-md hover:bg-amber-700">
                  Review Changes
                </button>
                <button className="px-4 py-2 border border-amber-300 text-amber-700 rounded-md hover:bg-amber-100">
                  Sync Specs
                </button>
              </div>
            </div>
          )}
        </main>
      </div>
    </div>
  );
}
