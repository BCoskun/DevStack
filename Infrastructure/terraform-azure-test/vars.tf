variable "location" {
  default = "East US"
}

variable "prefix" {
  default = "c25testproject"
}

variable "ssh-source-address" {
  default = "*"
}

variable "sql-admin" {
  type = object({
    username = string
    password = string
    sys-name = string 
  })
  
  default = {
      username = "mradministrator"
      password = "&TFJMKLE1=+FF"
      sys-name = "mssqlserver-c25-demo" 
    }
}

variable "postgresql-admin"  {
  type = object({
    username = string
    password = string
    sys-name = string
  })
  
  default = {
      username = "psqladmin"
      password = "ZJ08#D&:$7VU"
      sys-name = "psqlserver-c25-demo"
    }
}
