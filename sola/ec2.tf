data "aws_ami" "redhat" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-7.9_HVM-20220512-x86_64-1-Hourly2*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309956199498"]
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.redhat.id
  instance_type          = "t3.micro"
  key_name               = "classkey2"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
systemctl enable httpd    
echo "The page was created by the user data" | sudo tee /var/www/html/index.html
EOF

  tags = {
    Name = "application"
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.web.id
  vpc      = true
}
