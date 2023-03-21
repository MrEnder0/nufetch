# Download files and install
mkdir ~/.nufetch
curl -o ~/.nufetch/nufetch.nu https://raw.githubusercontent.com/MrEnder0/nufetch/master/src/nufetch.nu
curl -o ~/.nufetch/nufetch_config.nu https://raw.githubusercontent.com/MrEnder0/nufetch/master/src/nufetch_config.nu
chmod +x ~/.nufetch/nufetch.nu

# Add alias to .bashrc to run nufetch from anywhere
echo "alias nufetch='~/.nufetch/nufetch.nu'" >> ~/.bashrc

echo "Nufetch has been installed; Reload your terminal and run 'nufetch' to use!"
echo "If Nufetch does not work make sure you have nu properly installed."