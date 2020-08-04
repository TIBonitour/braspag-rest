# -*- encoding : utf-8 -*-
module BraspagRest
  class Chargeback < Hashie::IUTrash
    include Hashie::Extensions::Coercion

    property :id, from: 'Id'
    property :case_number, from: 'CaseNumber'
    property :amount, from: 'Amount'
    property :status, from: 'Status'
    property :date, from: 'Date'
    property :raw_data, from: 'RawData'
    property :reason_code, from: 'ReasonCode'
    property :reason_message, from: 'ReasonMessage'
    
    property :chargeback_split_payments, from: 'ChargebackSplitPayments'

    coerce_key :chargeback_split_payments, Array[BraspagRest::ChargebackSplitPayment]

  end
end
