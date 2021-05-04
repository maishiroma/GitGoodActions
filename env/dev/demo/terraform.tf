resource aws_instance test {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  metadata_options {
    https_tokens = "required"
  }

  ebs_block_devices {
    encrypted = true
    tags = {
      Name = "block"
    }
  }

  tags = {
    Name      = "something"
    Component = "another"
  }
}

resource aws_ebs_volume test {
  name      = "adas"
  encrypted = false
}

resource aws_ebs_volume test_2 {
  name      = "another"
  encrypted = false
}

provider aws {
  version = "= 2.68.0"
  region  = "us-west-2"

  assume_role {
    role_arn = "asdasdasd"
  }
}

terraform {
  required_version = ">= 0.12"
}