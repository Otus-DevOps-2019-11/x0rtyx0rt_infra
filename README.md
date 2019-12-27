#________________HW_make_x0rtyx0rt_infra
x0rtyx0rt Infra repository

#Вложеный туннель на someinternalhost
#ssh -i ~/.ssh/appuser -A appuser@34.77.49.2 ssh 10.132.0.4

#________________HW_VPN
bastion_IP = 34.77.49.2
someinternalhost_IP = 10.132.0.4



#________________HW_testAPP
testapp_IP = 35.204.180.21
testapp_port = 9292

###glcoud_add instance && deploy_APP###
gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure \
--metadata-from-file startup-script=startup_script

###gcloud_del FW_Rule
gcloud compute firewall-rules delete default-puma-server
###gcloud_add FW_rule
gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --target-tags=puma-server
