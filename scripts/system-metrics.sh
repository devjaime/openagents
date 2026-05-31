#!/bin/bash
# System metrics collector for Mac mini
# Output: /tmp/openclaw-metrics.json

OUTPUT_FILE="/tmp/openclaw-metrics.json"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Get disk space
DISK_INFO=$(df -h / | tail -1 | awk '{print $2, $3, $4, $5}' | while read total used free percent; do echo "{\"total\":\"$total\",\"used\":\"$used\",\"free\":\"$free\",\"percent\":\"$percent\"}"; done)

# Get memory (macOS)
MEMORY_INFO=$(vm_stat | head -10 | tail -6 | awk '{print $NF}' | while read pages; do echo "$pages"; done 2>/dev/null || echo "{\"total\":\"N/A\",\"used\":\"N/A\",\"free\":\"N/A\"}")
# Simpler memory check for macOS
MEMORY_TOTAL=$(sysctl -n hw.memsize 2>/dev/null | awk '{printf "%.0f", $1/1024/1024/1024}')
MEMORY_FREE=$(vm_stat | grep "Pages free" | awk '{print $3}' | tr -d '.')
MEMORY_ACTIVE=$(vm_stat | grep "Pages active" | awk '{print $3}' | tr -d '.')
MEMORY_WIRED=$(vm_stat | grep "Pages wired" | awk '{print $4}' | tr -d '.')

# Get CPU load
CPU_LOAD=$(uptime | awk -F'load averages:' '{print $2}' | xargs)
UPTIME_INFO=$(uptime | awk -F'up' '{print $2}' | awk -F',' '{print $1}')

# Get top processes by CPU
TOP_CPU=$(ps aux --no-headers 2>/dev/null | sort -k3 -rn | head -5 | awk '{printf "{\"pid\":%s,\"name\":\"%s\",\"cpu\":%s,\"mem\":%s},", $2, $11, $3, $4}' | sed 's/,$//')

# Get top processes by Memory
TOP_MEM=$(ps aux --no-headers 2>/dev/null | sort -k4 -rn | head -5 | awk '{printf "{\"pid\":%s,\"name\":\"%s,\"cpu\":%s,\"mem\":%s},", $2, $11, $3, $4}' | sed 's/,$//')

# Get disk usage by folder (top 10 largest)
DISK_FOLDERS=$(du -sh ~/.* / 2>/dev/null | sort -hr | head -10 | awk '{printf "{\"size\":\"%s\",\"path\":\"%s\"},", $1, $2}' | sed 's/,$//')

# Get docker stats if available
DOCKER_RUNNING=$(docker ps 2>/dev/null | tail -n +2 | wc -l | tr -d ' ')
DOCKER_IMAGES=$(docker images 2>/dev/null | tail -n +2 | wc -l | tr -d ' ')

# Get git repos status
GIT_STATUS="[]"
if [ -d "/Users/devjaime/.openclaw/workspace/projects" ]; then
  cd /Users/devjaime/.openclaw/workspace/projects
  REPOS=$(find . -maxdepth 2 -name ".git" -type d 2>/dev/null | while read repo; do
    DIR=$(dirname "$repo")
    cd "$DIR"
    BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
    UNPUSHED=$(git log origin/main..HEAD 2>/dev/null | wc -l | tr -d ' ')
    DIRTY=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    LAST_COMMIT=$(git log -1 --format="%ai" 2>/dev/null | cut -d' ' -f1)
    echo "{\"name\":\"$(basename $DIR)\",\"branch\":\"$BRANCH\",\"unpushed\":$UNPUSHED,\"dirty\":$DIRTY,\"lastCommit\":\"$LAST_COMMIT\"},"
    cd - > /dev/null
  done | sed 's/,$//')
  GIT_STATUS="[$REPOS]"
fi

# Create JSON output
cat > "$OUTPUT_FILE" << EOF
{
  "timestamp": "$TIMESTAMP",
  "system": {
    "uptime": "$UPTIME_INFO",
    "cpuLoad": "$CPU_LOAD"
  },
  "memory": {
    "totalGB": "$MEMORY_TOTAL",
    "freePages": "$MEMORY_FREE",
    "activePages": "$MEMORY_ACTIVE",
    "wiredPages": "$MEMORY_WIRED"
  },
  "disk": $DISK_INFO,
  "topCPU": [$TOP_CPU],
  "topMem": [$TOP_MEM],
  "diskFolders": [$DISK_FOLDERS],
  "docker": {
    "running": $DOCKER_RUNNING,
    "images": $DOCKER_IMAGES
  },
  "gitRepos": $GIT_STATUS
}
EOF

echo "✅ Metrics collected: $OUTPUT_FILE"
cat "$OUTPUT_FILE"
