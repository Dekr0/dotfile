# npm
inpm() {
    npm init
    echo "Typescript?"
    select yn in "y" "n"; do
        case $yn in
            y ) npm install typescript --save-dev && mkdir src; break;;
            n ) break;;
        esac 
    done
    echo "Prettier?"
    select yn in "y" "n"; do
        case $yn in
            y ) npm install --save-dev --save-exact prettier postcss && cp $HOME/Templates/js/.prettierrc .; break;;
            n ) break;;
        esac 
    done
    select yn in "y" "n"; do
        case $yn in
            y ) npm install --save-dev eslint eslint-plugin-import && cp $HOME/Templates/js/.eslintrc.json .; break;;
            n ) break;;
        esac 
    done
    echo "Tailwind?"
    select yn in "y" "n"; do
        case $yn in
            y ) npm install --save-dev tailwindcss && cp $HOME/Templates/js/tailwind.config.js .; break;;
            n ) break;;
        esac 
    done
    echo "Vite"
    select yn in "y" "n"; do
        case $yn in
            y ) npm install --save-dev vite && cp $HOME/Templates/js/vite.config.js .; break;;
            n ) break;;
        esac 
    done
}
