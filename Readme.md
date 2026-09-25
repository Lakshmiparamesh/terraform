
1. Configure AWS CLI credentials:
   ```bash
   aws configure
   ```

2. Create EC2 key pairs in both regions:
   ```bash
   aws ec2 create-key-pair --key-name my-key-mumbai --region ap-south-1 --query 'KeyMaterial' --output text | Out-File -Encoding ascii my-key-mumbai.pem
   aws ec2 create-key-pair --key-name my-key-virginia --region us-east-1 --query 'KeyMaterial' --output text | Out-File -Encoding ascii my-key-virginia.pem
   ```

3. Fetch the latest Amazon Linux 2023 AMI ID per region and update `variables.tf`:
   ```bash
   aws ec2 describe-images --owners amazon --filters "Name=name,Values=al2023-ami-*-x86_64" --query 'sort_by(Images, &CreationDate)[-1].ImageId' --region ap-south-1
   aws ec2 describe-images --owners amazon --filters "Name=name,Values=al2023-ami-*-x86_64" --query 'sort_by(Images, &CreationDate)[-1].ImageId' --region us-east-1
   ```

4. Initialize Terraform:
   ```bash
   terraform init
   ```

5. Review the execution plan:
   ```bash
   terraform plan
   ```

6. Apply the configuration:
   ```bash
   terraform apply
   ```

7. Verify both instances are running in the AWS Console (EC2 → Instances, per region).

8. Destroy resources after verification to avoid ongoing charges:
   ```bash
   terraform destroy
   ```

## Outputs

On successful apply, Terraform prints the public IP addresses of both instances:

```
instance_region1_public_ip = "<mumbai-ip>"
instance_region2_public_ip = "<virginia-ip>"
```
