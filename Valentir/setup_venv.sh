#!/bin/bash

echo "🛠 Creating virtual environment if it doesn't exist..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists. Skipping creation."
fi

echo "⚡ Activating virtual environment..."
source venv/bin/activate
echo "✅Venv activated."

echo "🔎 Checking if Flask is installed..."
if ! pip show flask > /dev/null 2>&1; then
    echo "📦 Flask not found. Installing Flask..."
    pip install flask
else
    echo "✅ Flask is already installed."
fi

echo "📝 Updating requirements.txt..."
pip freeze > requirements.txt

echo "✅ Setup complete. Virtual environment ready."
echo "🔁 To activate manually later: source venv/bin/activate"