FILE="$HOME/Desktop/vtasks.zip"

if [[ -f "$FILE" ]]; then
    # file exists – do your stuff here
    echo "Rebuilding vTasks..."
    ditto -xk ~/Desktop/vtasks.zip ~/Desktop/vtasks/
    sed -i '' '/<script type="importmap">/,/<\/script>/d' ~/Desktop/vtasks/index.html
    sed -i '' '/<link rel="stylesheet" href="\/index.css">/d' ~/Desktop/vtasks/index.html 
    sed -i '' '/<link rel="icon" type="image\/svg+xml" href=".\/vite.svg" \/>/d' ~/Desktop/vtasks/index.html
    rm -rf ~/Desktop/vtasks/.github
    cp -Rf ~/Desktop/vtasks/* ~/github/vtasks/
    rm -rf ~/Desktop/vtasks
    rm -rf ~/Desktop/vtasks.zip
    npm run build
    echo "Complete. Starting server..."
else
    echo "Nothing to do. Restarting dev server..."
fi
killport 5173
npm run dev