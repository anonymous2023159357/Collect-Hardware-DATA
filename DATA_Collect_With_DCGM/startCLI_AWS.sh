#!/bin/bash
# Get arguments
INSTANCE_TYPE=$1

IMAGE_ID="MY_IMAGE_ID"
AWS_KEY="MY_AWS_KEY"
SUBNET_ID="MY_SUBNET_ID"
SG_ID="MY_SG_ID"

# Launch instance & get informations
echo 'launch instance'
LAUNCH_INFO=$(aws ec2 run-instances --image-id $IMAGE_ID --count 1 --instance-type $INSTANCE_TYPE \
--key-name $AWS_KEY --subnet-id $SUBNET_ID --security-group-ids $SG_ID --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ys-dcgmi}]')   
sleep 60
echo 'get instance info'
INSTANCE_ID=$(echo $LAUNCH_INFO | jq -r '. | .Instances[0].InstanceId')
INSTANCE_DNS=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID | jq -r '. | .Reservations[0].Instances[0].PublicDnsName')
echo $INSTANCE_DNS

# Instance setting and train start
AWS_KEY="MY_AWS_KEY"
ssh -o "StrictHostKeyChecking no" -i $AWS_KEY ubuntu@$INSTANCE_DNS 'git clone https://github.com/anonymous2023159357/Collect-Hardware-DATA.git'
ssh -i $AWS_KEY -t ubuntu@$INSTANCE_DNS 'cd /home/ubuntu/Collect-Hardware-DATA/&& sudo bash ./start.sh'
