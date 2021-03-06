terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token  = var.cloudflare_api_token
  account_id = var.cloudflare_account_id
}

resource "cloudflare_worker_route" "base_domain_route" {
  zone_id     = var.cloudflare_zone_id
  pattern     = var.cloudflare_website
  script_name = cloudflare_worker_script.index.name
}

resource "cloudflare_worker_script" "index" {
  name    = "index"
  content = file("./index.js")
}
