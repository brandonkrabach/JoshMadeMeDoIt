#!/bin/bash

# Make executable: chmod +x setup_venv.sh

echo "🔎 Checking if Homebrew is installed..."
if ! command -v brew >/dev/null 2>&1; then
    echo "🚀 Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "✅ Homebrew installed."
else
    echo "✅ Homebrew already installed."
fi

echo "🔎 Checking if Python 3 is installed..."
if ! command -v python3 >/dev/null 2>&1; then
    echo "🚀 Python 3 not found. Installing Python 3 via Homebrew..."
    brew install python
    echo "✅ Python 3 installed."
else
    echo "✅ Python 3 already installed."
fi

echo "🔎 Checking if pip3 is installed..."
if ! command -v pip3 >/dev/null 2>&1; then
    echo "🚀 pip3 not found. Installing pip3..."
    python3 -m ensurepip --upgrade
    echo "✅ pip3 installed."
else
    echo "✅ pip3 already installed."
fi

echo "🛠 Creating virtual environment if it doesn't exist..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✅ Virtual environment created."
else
    echo "✅ Virtual environment already exists. Skipping creation."
fi

echo "⚡ Activating virtual environment..."
source venv/bin/activate
echo "✅ Venv activated."

echo "🔎 Checking if Flask is installed in venv..."
if ! pip show flask > /dev/null 2>&1; then
    echo "📦 Flask not found. Installing Flask..."
    pip install flask
else
    echo "✅ Flask is already installed."
fi

echo "📝 Updating requirements.txt..."
pip freeze > requirements.txt
echo "✅ requirements.txt updated."

echo "🎉 Setup complete. Your environment is ready!"
echo "🔁 To manually activate later: source venv/bin/activate"