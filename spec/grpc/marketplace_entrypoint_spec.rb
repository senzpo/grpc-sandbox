require 'rails_helper'

RSpec.describe 'MarketplaceEntrypoint' do
  it 'creates product' do
    expect do
      MarketplaceEntrypoint.new.create_product(Marketplace::Product.new(name: 'Some name'), nil)
    end.to change { Product.count }.by(1)
  end

  it 'delete product' do
    product = Product.create!(name: 'Some name')
    expect do
      MarketplaceEntrypoint.new.delete_product(Marketplace::Identity.new(id: product.id), nil)
    end.to change { Product.count }.by(-1)
  end

  it 'get product' do
    product = Product.create!(name: 'Some name')
    result = MarketplaceEntrypoint.new.get_product(Marketplace::Identity.new(id: product.id), nil)
    expect(result).to be_instance_of(Marketplace::Product)
  end

  it 'get products' do
    product = Product.create!(name: 'Some name')
    result = MarketplaceEntrypoint.new.get_products(Marketplace::SearchRequest.new, nil) {}
    expect(result).to be_instance_of(Enumerator)
  end

  # TODO: nil value, error format
end