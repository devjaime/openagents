#!/bin/bash
# Run system metrics and update agent status, then commit to blog

# Run metrics collection
/bin/bash /Users/devjaime/.openclaw/workspace/scripts/system-metrics.sh

# Update agent status
STATUS_FILE="/tmp/openclaw-agent-status.json"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Read metrics if available
METRICS=$(cat /tmp/openclaw-metrics.json 2>/dev/null || echo "{}")

# Update status file
cat > "$STATUS_FILE" << EOF
{
  "status": "online",
  "agent": "main",
  "lastUpdate": "$TIMESTAMP",
  "uptime": "$(uptime | sed 's/.*up/up/' | sed 's/,.*load/cpu/')",
  "metrics": $METRICS,
  "jobs": [
    {"name": "Reporte Matutino 6AM", "schedule": "0 6 * * *", "enabled": true},
    {"name": "Reporte Medio Día 12PM", "schedule": "0 12 * * *", "enabled": true}
  ]
}
EOF

echo "✅ Agent status updated"

# Copy metrics to blog repo for web serving
BLOG_DIR="/Users/devjaime/.openclaw/workspace/devjaimeblog"
STATUS_TARGET="$BLOG_DIR/public/agent-status.json"

# Ensure directory exists and copy
mkdir -p "$BLOG_DIR/public"
cp "$STATUS_FILE" "$STATUS_TARGET"

# Commit changes
cd "$BLOG_DIR"
git add public/agent-status.json
git commit -m "chore: update agent status - $TIMESTAMP"
git push origin main

echo "✅ Blog updated with latest status at public/agent-status.json"
