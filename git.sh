echo "Please enter first name":
read first_name

echo "Please enter last name":
read last_name
git config --global user.name "$first_name $last_name"

echo "Please enter email address":
read email_address
git config --global user.email $email_address

echo "Please enter default editor":
read editor
git config --global core.editor $editor

eval $(ssh-agent -s)

echo "Generaing SSH key"
ssh-keygen -t id_ed25519_personal -C $email_address

ssh-add ~/.ssh/id_ed25519_personal

echo "setting git pull to rebase default"
git config --global pull.rebase true
echo "done"

echo "setting auto setup remote default"
git config --global push.autoSetupRemote
echo "done"
