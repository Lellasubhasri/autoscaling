resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.role.id
}

resource "aws_iam_role" "role" {
  name = "test_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  
  roles      = [aws_iam_role.role.name]
 #arn:aws:iam::aws:policy/CloudWatchFullAccess
  #policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

output "sri" {

  value = [aws_iam_role.role.name]
  
}

# 1. create iam  policy
# create iam role
# iam policy attachment 




# resource "aws_autoscaling_group" "master_asg" {
#   lifecycle { create_before_destroy = true }
#   vpc_zone_identifier = ["${var.master_subnet_id}"]
#   name = "dcos-master-autoscaling-group"
#   max_size = "${var.asg_max}"
#   min_size = "${var.asg_min}"
#   wait_for_elb_capacity = false
#   force_delete = true
#   launch_configuration = "${var.master_lc_id}"
#   load_balancers = ["${var.master_elb_name}"]
#   tag {
#     key = "Name"
#     value = "${var.project_tag}-master"
#     propagate_at_launch = "true"
#   }
# }