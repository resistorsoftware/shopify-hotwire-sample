WEBHOOKS_HOSTNAME = ENV.fetch("WEBHOOKS_HOSTNAME")

ShopifyApp.configure do |config|
  config.application_name = "A Subtle Web Label Printing"
  config.old_secret = ""
  config.scope = "write_products, read_orders" # Consult this page for more scope options:
  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2022-01"
  config.shop_session_repository = "Shop"
  config.allow_jwt_authentication = true
  config.allow_cookie_authentication = !Rails.configuration.force_iframe
  config.reauth_on_access_scope_changes = true

  config.api_key = ENV.fetch("SHOPIFY_API_KEY", "").presence
  config.secret = ENV.fetch("SHOPIFY_API_SECRET", "").presence
  if defined? Rails::Server
    raise("Missing SHOPIFY_API_KEY. See https://github.com/Shopify/shopify_app#api-keys") unless config.api_key
    raise("Missing SHOPIFY_API_SECRET. See https://github.com/Shopify/shopify_app#api-keys") unless config.secret
    raise("No Webhook Hostname") unless WEBHOOKS_HOSTNAME
  end
  config.webhooks = [
    {topic: "app/uninstalled", address: "https://#{WEBHOOKS_HOSTNAME}/webhooks/app_uninstalled"}
  ]
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
