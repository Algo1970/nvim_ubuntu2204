## R-lang setting

### install R, Rstudio
```
#!/bin/sh 
 
# install R, rstudio-server
cd $HOME
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt -y update
sudo apt -y install r-base-core
    
sudo apt -y install gdebi-core
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.5_amd64.deb
sudo apt -y install ./libssl1.0.0_1.0.2n-1ubuntu5.5_amd64.deb
    
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1103-amd64.deb
echo yes | sudo gdebi rstudio-server-1.4.1103-amd64.deb
rm rstudio-server-1.4.1103-amd64.deb
    
# r.snippets setting
mkdir -p ~/.config/rstudio/snippets
cp ~/snippets/r.snippets ~/.config/rstudio/snippets/

# rstudio setting
# mkdir -p .rstudio/monitored/user-settings
cp ~/x1carbon_ubuntu2004/configfiles/rstudio-prefs.json ~/.config/rstudio/ 
```
