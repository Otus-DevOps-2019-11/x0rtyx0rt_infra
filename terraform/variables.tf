variable project {
  description = "infra-262406"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "zone"
}

variable public_key_path {
  description = "~/.ssh/appuser.pub"
}

variable private_key_path {
  description = "~/.ssh/appuser"
}

variable disk_image {
  description = "reddit-base"
}
