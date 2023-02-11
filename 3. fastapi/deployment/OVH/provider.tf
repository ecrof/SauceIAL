# provider.tf file with the minimum version, european endpoint (“ovh-eu”) and keys you got in this guide previously.

# Configure the OVHcloud Provider
provider "ovh" {
  version            = "~> 0.11"
  endpoint           = "ovh-eu"
  application_key    = "<your_access_key>"
  application_secret = "<your_application_secret>"
  consumer_key       = "<your_consumer_key>"
}
