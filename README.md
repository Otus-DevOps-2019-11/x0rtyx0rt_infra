#________________HW_make_x0rtyx0rt_infra
x0rtyx0rt Infra repository

#Вложеный туннель на someinternalhost
#ssh -i ~/.ssh/appuser -A appuser@34.77.49.2 ssh 10.132.0.4

#________________HW_VPN
bastion_IP = 34.77.49.2
someinternalhost_IP = 10.132.0.4



#________________HW_testAPP
testapp_IP = 35.204.6.182
testapp_port = 9292

###glcoud_add instance && deploy_APP###
gcloud compute instances create reddit-app2 --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure \
 --metadata-from-file startup-script='#! /bin/bash
#install_ruby
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
#install_mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
#deploy
cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install && puma -d'
