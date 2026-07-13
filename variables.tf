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
  # --- Unconfirmed validation candidates, derived from azurerm_spring_cloud_gateway_custom_domain's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: spring_cloud_gateway_id
  #   source:    [from validate.SpringCloudGatewayID] !ok
  # path: spring_cloud_gateway_id
  #   source:    [from validate.SpringCloudGatewayID] err != nil
  # path: thumbprint
  #   condition: length(value) > 0
  #   message:   must not be empty
}

