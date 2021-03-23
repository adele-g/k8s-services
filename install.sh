minikube delete
cd ~
rm -rf /goinfre/lnymella/.minikube
rm -rf ~/goinfre/.minikube
brew remove minikube
brew install minikube
cd ~
brew unlink minikube
brew link minikube
mkdir -p .minikube
mv .minikube /goinfre/lnymella/.minikube
ln -s /goinfre/lnymella/.minikube .minikube
echo "😋 Minikube has been installed"
