# -*- encoding : utf-8 -*-
module BraspagRest
  class FraudAlert < Hashie::IUTrash
    include Hashie::Extensions::Coercion

    property :date, from: 'Date'
    property :reason_code, from: 'ReasonCode'
    property :reason_message, from: 'ReasonMessage'
    property :incoming_chargeback, from: 'IncomingChargeback'

  end
end
