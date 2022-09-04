files_path = "/Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/"

zone       = "us-central1-a"
region     = "us-central1"
project_id = "vahan-dev"

vpc_network_name = "default"

instance_name                = "control-serg"
instance_type                = "e2-medium"
image                        = "ubuntu-1804-bionic-v20220824"
nat_address_name             = "master-ip"
disk_size                    = 50
master_service_account_email = "ansible-466@vahan-dev.iam.gserviceaccount.com"

template_name      = "worker-template"
mig_name           = "worker-mig"
base_instance_name = "worker-base"

bucket_name = "ansible-playbook"

load_balancer_ip_name               = "l7-xlb-static-ip"
compute_global_forwarding_rule_name = "l7-xlb-forwarding-rule"
compute_backend_service_name = "l7-xlb-backend-service"
compute_global_forwarding_rule_ip_protocol = "TCP"
load_balancing_scheme                      = "EXTERNAL"
forwarding_rule_port_range                 = "80"
compute_target_http_proxy_name             = "l7-xlb-target-http-proxy"
compute_url_map_name                       = "l7-xlb-url-map"
backend_service_protocol                   = "HTTP"
port_name                                  = "custom-http"
time_out                                   = 10
enable_cdn                                 = false
backend_balancing_mode                     = "UTILIZATION"
backend_capacity_scaler                    = 1.0
compute_health_check_name                  = "l7-xlb-health-check"
health_check_port_specification            = "USE_SERVING_PORT"
