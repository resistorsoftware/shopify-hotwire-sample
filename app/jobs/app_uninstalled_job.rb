class AppUninstalledJob < ApplicationJob
  queue_as :default

  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    raise "No Shop record found for #{shop_domain}..." if shop.nil?

    Shop.delete(shop.id)
    Rails.logger.info { "Shop #{shop_domain} Uninstalled" }
  rescue => e
    Rails.logger.error { "Shop Uninstall Exception: #{e.message}" }
  end
end
