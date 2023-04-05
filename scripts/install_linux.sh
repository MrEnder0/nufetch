#Test for existing install
NUFETCH=~/.nufetch/nufetch.nu
if [ -f "$NUFETCH" ]; then
    read -p "$NUFETCH already exists would you like to re-install (1) or un-install (2): default 1" some_input
    if [ $option = "1" || $option = "" ]; then
        rm -r ~/.nufetch/*
        curl -o ~/.nufetch/nufetch.nu https://raw.githubusercontent.com/MrEnder0/nufetch/master/src/nufetch.nu
        curl -o ~/.nufetch/nufetch_config.nu https://raw.githubusercontent.com/MrEnder0/nufetch/master/src/nufetch_config.nu
        chmod +x ~/.nufetch/nufetch.nu

        echo "Finished reinstalling Nufetch"
    else
        rm -r ~/.nufetch/*
        echo "Finished uninstalling Nufetch"
    fi
else 
    echo "Could not find Nufetch installing..."
    # Download files and install
    mkdir ~/.nufetch
    curl -o ~/.nufetch/nufetch.nu https://raw.githubusercontent.com/MrEnder0/nufetch/master/src/nufetch.nu
    curl -o ~/.nufetch/nufetch_config.nu https://raw.githubusercontent.com/MrEnder0/nufetch/master/src/nufetch_config.nu
    chmod +x ~/.nufetch/nufetch.nu

    # Add alias to .bashrc to run nufetch from anywhere
    echo -e "\nalias nufetch='~/.nufetch/nufetch.nu'" >> ~/.bashrc

    echo "Nufetch has been installed; Reload your terminal and run 'nufetch' to use!"
    echo "If Nufetch does not work make sure you have nu properly installed."
fi