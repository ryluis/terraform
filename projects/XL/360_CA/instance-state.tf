## run below resource to control the state of ec2 instance
resource "aws_ec2_instance_state" "start_tableau_instances" {
  count = length(local.list_of_existing_tableau_instance_id)

  instance_id = local.list_of_existing_tableau_instance_id[count.index]

  state = "running"
}

resource "aws_ec2_instance_state" "stop_tableau_instances" {
  count = length(local.list_of_existing_tableau_instance_id)

  instance_id = local.list_of_existing_tableau_instance_id[count.index]

  state = "stopped"
}