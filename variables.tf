variable "spring_cloud_gateway_custom_domains" {
  description = <<EOT
Map of spring_cloud_gateway_custom_domains, attributes below
Required:
    - name
    - spring_cloud_gateway_id
Optional:
    - thumbprint
EOT

  type = map(object({
    name                    = string
    spring_cloud_gateway_id = string
    thumbprint              = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_gateway_custom_domains : (
        v.thumbprint == null || (length(v.thumbprint) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

