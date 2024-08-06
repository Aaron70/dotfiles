clear
read -p "You want to configure git? y/n"
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  exit 0
fi

clear 
echo "Installing GCM (github-credential-manager)..."
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure

clear
echo "Applying git configurations..." 
git config --global core.editor $EDITOR
git config --global credential.credentialStore gpg
git config --global credential.guiprompt false
read -p "Enter your github email: " email
git config --global user.email $email
read -p "Enter your github username: " username 
git config --global user.name $username

pass init gcm

rm dotnet-install.sh
