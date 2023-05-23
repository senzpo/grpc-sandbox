class MarketplaceEntrypoint < Marketplace::Service
  def create_product(product, _call)
    p = Product.new(product.to_h.slice(:name))
    p.save!
    Marketplace::Identity.new id: p.id
  end

  def delete_product(identity, _call)
    Product.find_by!(id: identity.id).destroy!
  end

  def get_product(identity, _call)

  end

  def get_products(search_request, _call)
    Marketplace::Product.new
  end
end
