
provider "aws" {
	region = "ap-south-1"
	profile = "jayanth"
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydatabase"
  username             = "jayanth"
  password             = "jayanth041"
  parameter_group_name = "default.mysql5.7"
  auto_minor_version_upgrade = false
  skip_final_snapshot = true
  publicly_accessible = true
  #vpc_security_group_ids = ["sg-049b1cfdc4fa569f5"]
}
output "first"{
 value = aws_db_instance.mysql
}


provider "kubernetes" {
  config_context_cluster   = "minikube"
}

resource "kubernetes_deployment" "wordpress" {
  metadata {
    name = "wordpress"
    labels = {
      prod = "wordpress"
      data = "mysql"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        prod = "wordpress"
        data = "mysql"
      }
    }

    template {
      metadata {
        labels = {
         prod = "wordpress"
         data = "mysql"
        }
      }

      spec {
        container {
          image = "wordpress"
          name  = "myword"
        }
      }
    }
  }
}

resource "kubernetes_service" "exploring" {
  metadata {
    name = "wpexploring"
  }
  spec {
    selector = {
         prod = "wordpress"
         data = "mysql"
    }
    
    port {
      port        = 80
      
    }

    type = "NodePort"
  }
}