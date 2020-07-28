data "terraform_remote_state" "aws_demo" {
  backend = "local"

  config = {
    path = "${path.module}/../terraform.tfstate"
  }
}

provider "bigip" {
  address = data.terraform_remote_state.aws_demo.outputs.f5_ui
  username = data.terraform_remote_state.aws_demo.outputs.f5_user
  password = data.terraform_remote_state.aws_demo.outputs.f5_password
}

resource "bigip_do"  "do-example" {
     do_json = "${file("example.json")}"
     timeout = 15
}
