```bash
#!/bin/bash
# build.sh: Generate minified Tailwind CSS for the website

echo "Installing Tailwind CSS dependencies..."
npm install -D tailwindcss postcss autoprefixer

echo "Creating Tailwind config..."
npx tailwindcss init -p

echo "Updating tailwind.config.js..."
cat > tailwind.config.js << EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./*.html'],
  theme: { extend: {}, },
  plugins: [],
}
EOL

echo "Creating input.css..."
cat > input.css << EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

echo "Building Tailwind CSS..."
npx tailwindcss -i ./input.css -o ./output.css --minify

echo "Tailwind CSS build complete. Copy output.css to styles.css"
```
