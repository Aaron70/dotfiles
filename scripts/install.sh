export dotfiles_path=~/dotfiles
export repos_path=~/repos
export scripts_path=$dotfiles_path/scripts

if [ ! -d $dotfiles_path ]; then 
  echo "The dotfiles folder must be within the home folder and be named 'dotfiles'."
  echo "If you want to rename the folder, update the 'dotfiles_path' varialbe on the install script."
  exit 1
fi

chmod +x $scripts_path/install-dependencies.sh
$scripts_path/install-dependencies.sh
if [ $? -ne 0 ]; then
  echo "Something went wrong while installing dependencies..."
  exit 1
fi

