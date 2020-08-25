module BraspagRest
  class Customer < Hashie::IUTrash
    include Hashie::Extensions::Coercion

    property :name, from: 'Name'
    property :identity, from: 'Identity'
    property :identity_type, from: 'IdentityType'
    property :email, from: 'Email'
    property :ip_address, from: 'IpAddress'
    property :phone, from: 'Phone'
    property :birthdate, from: 'Birthdate'
    property :address, from: 'Address', with: ->(values) { BraspagRest::Address.new(values) }
    property :delivery_address, from: 'DeliveryAddress', with: ->(values) { BraspagRest::Address.new(values) }
    property :billing_address, from: 'BillingAddress', with: ->(values) { BraspagRest::Address.new(values) }

    coerce_key :address, BraspagRest::Address
    coerce_key :delivery_address, BraspagRest::Address
    coerce_key :billing_address, BraspagRest::Address
  end
end
