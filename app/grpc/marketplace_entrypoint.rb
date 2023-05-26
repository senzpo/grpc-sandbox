class MarketplaceEntrypoint < Marketplace::Service
  include GRPC::Core::StatusCodes

  def create_product(product, _call)
    p = Product.new(product.to_h.slice(:name))
    if p.save
      Marketplace::Identity.new id: p.id
    else
      raise GRPC::BadStatus.new_status_exception(INVALID_ARGUMENT, p.errors.full_messages.join(', '), p.errors.messages)
    end
  end

  def delete_product(identity, _call)
    Product.find_by!(id: identity.id).destroy!
  rescue ActiveRecord::RecordNotFound
    raise GRPC::BadStatus.new_status_exception(NOT_FOUND, identity.id.to_s)
  end

  def get_product(identity, _call)
    product = Product.find_by!(id: identity.id)
    Marketplace::Product.new product.attributes.symbolize_keys.slice(:name)
  rescue ActiveRecord::RecordNotFound
    raise GRPC::BadStatus.new_status_exception(NOT_FOUND, identity.id.to_s)
  end

  def get_products(search_request, _call)
    Product.all.map do |product|
      Marketplace::Product.new product.attributes.symbolize_keys.slice(:id, :name)
    end.each
  end
end
