variable project {
  description = "infra-262406"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "zone"
  default     = "europe-west1-d"
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

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
