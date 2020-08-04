# -*- encoding : utf-8 -*-
module BraspagRest
  class ChargebackSplit < Hashie::IUTrash
    include Hashie::Extensions::Coercion

    property :merchant_id, from: 'MerchantId'
    property :chargeback_amount, from: 'ChargebackAmount'

  end
end
