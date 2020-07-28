data "terraform_remote_state" "aws_demo" {
  backend = "local"

  config = {
    path = "${path.module}/../terraform.tfstate"
  }
}

provider "bigip" {
  address = "${var.url}"
  username = "${var.username}"
  password = "${var.password}"
}

resource "bigip_do"  "do-example" {
     do_json = "${file("example.json")}"
     timeout = 15
}
