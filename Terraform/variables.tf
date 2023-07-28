variable "api_url" {
    type = string
}

variable "api_token_id" {
  type = string
}

variable "api_token_secret" {
    type = string
}

variable "tf_user" {
    type = string
}

variable "tf_passwd" {
    type = string
}

variable "ssh_pub_key" {
    type = string
}

variable "target_node" {
    type = string
}

variable "container_passwd" {
    type = string
    default = "password"
}

variable "gateway" {
    type = string
}