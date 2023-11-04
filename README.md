
# multi-cluster-aws-rds-terraform


This project is an **AWS Cloudformation Deployment Demo** using EKS and the [multi-k8s](https://github.com/StephenGrider/multi-k8s) image by [Stephen Grider](https://www.linkedin.com/in/stephengrider/). The EKS application is a react application for a Fibionacci calculator. 


EKS cluster contains the following deployments and services: 

- **Server**
- **Client**
- **Worker**
- **Nginx Ingress**
- **Horizontal Autoscaler**
- **Cloudwatch Agent**

Additionaly to EKS, the following AWS Services are deployed and conected to the EKS deployments 

- **Postgres RDS Database**
- **Elasticache Redis Node**

![App Screenshot](https://raw.githubusercontent.com/braulioarredondo/multi-cluster-aws-rds-terraform/master/images/app.png)

![Insights](https://raw.githubusercontent.com/braulioarredondo/multi-cluster-aws-rds-terraform/master/images/insights.png)

![Resources](https://raw.githubusercontent.com/braulioarredondo/multi-cluster-aws-rds-terraform/master/images/resources.png)
## Arquitecture

Deployment uses the next instances types and sizes for the infrastructure.

| Resource |    Number     | Type/Size               |
| :-------- | :------- | :------------------------- |
| **VPC** | `1` | **/16** |
| **Public Subnet** | `2` | **/24** |
| **Private Subnet** | `2` | **/24** |
| **EC2 Instance** | `2` | **t3.small** |
| **RDS Instance** |`1` | **db.t3.micro** |
| **Elasticache Node** |`1`| **cache.t2.micro** |





## Deployment

Repo includes Github Actions to deploy the application using the provided Terraform manifests. Before start with the deployment you have to create the following **DynamoDB tables** in the selected region (us-east-1 by default):

| Table |    Partition key |
| :-------- | :--------- 
| **terraform-multi-k8s** | `LockID` |
| **eks-cluster-autoscaler** | `LockID` |
| **eks-cloudwatch-agent** | `LockID` | 
| **terraform-lbc-nginx** | `LockID` | 
| **terraform-rds** |`LockID` | 
| **terraform-redis** | `LockID` |
| **terraform-eks-application** |`LockID`| 

If you'll fork or use the Github Actions template please provide the following variables.

`AWS_ACCESS_KEY_ID` (secret)

`AWS_SCRET_ACCESS_KEY` (secret)  

`PG_PASSWORD`(secret)

Workflow builds at diferent steps the next terraform manifests in the same order.

1. **VPC and EKS** *(01-ekscluster-terraform-manifests)*
2. **Autoscaler** *(02-cluster-autoscaler-terraform-manifests)*
3. **Cloudwatch Agent** *(03-cloudwatchagent-terraform-manifests)*
4. **Nginx Ingress** *(04-nginx-ingress-terraform-manifests)*
5. **RDS Instance** *(05-rds-terraform-manifests)*
6. **Redis Node** *(06-redis-terraform-manifests)*
7. **K8s Application** *(07-eks-fibonacci-calculator-manifests)*


Finally, you have to create a S3 bucket to allocate the remote state of each deployment. By default, manifests are using **`terraform-multi-k8s`** bucket. 

***IMPORTANT!!*** Remember that bucket names must be unique, so the default one may be in use by any account. You have to update the variable **`bucket`** in the **`backend`** block of each **`010-versions.tf`** file in the above folders. 

Since this is not deployed using cloudformation, the best way to deploy and destroy the resources is ussing Gitlab Actions. By default any change in the master branch will trigger the deploy action; if you want to delete the resources, run the workflow manually and seledct the **Terraform_Destroy** option. 

![Workflow](https://raw.githubusercontent.com/braulioarredondo/multi-cluster-aws-rds-terraform/master/images/workflow.png)

![Workflow Option](https://raw.githubusercontent.com/braulioarredondo/multi-cluster-aws-rds-terraform/master/images/workflow_option.png)

![Destroy](https://raw.githubusercontent.com/braulioarredondo/multi-cluster-aws-rds-terraform/master/images/destroy.png)
## 🛠 Skills
Javascript, AWS, IAC, Terraform, Docker, EKS, K8s


## 🔗 Links
[![website](https://img.shields.io/badge/Braulio_Arredondo-black?style=for-the-badge&logo=read.cv)](https://braulioarredondo.com/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/braulio-arredondo)



## Authors

- [@braulioarredondo](https://www.github.com/braulioarredondo)