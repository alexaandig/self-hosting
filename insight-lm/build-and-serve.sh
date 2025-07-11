#!/bin/bash

# Exit on any error
set -e

# === Configuration ===
REPO_URL="https://github.com/alexaandig/insights-lm-2.git"
APP_DIR="$HOME/insight-lm"
BUILD_DIR="$APP_DIR/dist"
DOMAIN="insights-lm.swiftspace.io"  # Change to your actual domain or IP

# === Vite Env Vars (used during build) ===
export VITE_SUPABASE_URL=${VITE_SUPABASE_URL}
export VITE_SUPABASE_ANON_KEY=${VITE_SUPABASE_ANON_KEY}

# === Make sure required tools are available ===
command -v node >/dev/null || { echo "❌ Node.js is not installed"; exit 1; }
command -v npm >/dev/null || { echo "❌ npm is not installed"; exit 1; }
command -v git >/dev/null || { echo "❌ git is not installed"; exit 1; }
command -v caddy >/dev/null || { echo "❌ Caddy is not installed"; exit 1; }

# === Clone or update repo ===
if [ -d "$APP_DIR" ]; then
  echo "📁 Updating existing repo..."
  cd "$APP_DIR"
  git pull
else
  echo "🔄 Cloning repository..."
  git clone "$REPO_URL" "$APP_DIR"
  cd "$APP_DIR"
fi

# === Build the Vite project ===
echo "📦 Installing dependencies..."
npm install

echo "🛠️ Building the project..."
npm run build

# === Create Caddyfile ===
echo "⚙️ Creating Caddyfile..."
cat <<EOF > $HOME/Caddyfile
$DOMAIN {
    root * $BUILD_DIR
    file_server
    try_files {path} /index.html
}
EOF

# === Run Caddy ===
echo "🚀 Serving with Caddy..."
sudo caddy stop || true
sudo caddy start --config $HOME/Caddyfile

echo "✅ Site deployed at: http://$DOMAIN"
