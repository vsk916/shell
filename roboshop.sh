#!bin/bash

AMI_ID=ami-03265a0778a880afb
SG_ID=sg-08efee20dd1ce7f9f
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do 
  if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
  then
      INSTANCE_TYPE=t3.small 
  else
      INSTANCE_TYPE=t2.micro
  fi
   IP_ADDRESS=$(aws ec2 run-instances --image-id "$AMI_ID" --instance-type "$INSTANCE_TYPE" --security-group-ids "$SG_ID" --tag-specification "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateAddress' --output text)

  echo "$i: $IP_ADDRESS"
  
done




