# -*- encoding : utf-8 -*-
module BraspagRest
  class ChargebackSplitPayment < Hashie::IUTrash
    include Hashie::Extensions::Coercion

    property :subordinate_merchant_id, from: 'SubordinateMerchantId'
    property :chargeback_amount, from: 'ChargebackAmount'
    property :chargeback_splits, from: 'ChargebackSplits'

    coerce_key :chargeback_splits, Array[BraspagRest::ChargebackSplit]

  end
end
