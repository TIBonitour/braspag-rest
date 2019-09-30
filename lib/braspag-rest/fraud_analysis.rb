# -*- encoding : utf-8 -*-
module BraspagRest
  class FraudAnalysis < Hashie::IUTrash
    include Hashie::Extensions::Coercion

    STATUS_ACCEPTED = 1
    STATUS_REJECTED = 2

    property :sequence, from: 'Sequence'
    property :sequence_criteria, from: 'SequenceCriteria'
    property :finger_print_id, from: 'FingerPrintId'
    property :capture_on_low_risk, from: 'CaptureOnLowRisk'
    property :void_on_high_risk, from: 'VoidOnHighRisk'
    property :browser, from: 'Browser'
    property :cart, from: 'Cart'
    property :merchant_defined_fields, from: 'MerchantDefinedFields'
    property :provider, from: 'Provider'

    property :status, from: 'Status'
    property :fraud_analysis_reason_code, from: 'FraudAnalysisReasonCode'
    property :factor_code, from: 'FactorCode'
    property :score, from: 'Score'

    property :status_description, from: 'StatusDescription'
    property :total_order_amount, from: 'TotalOrderAmount'
    property :transaction_amount, from: 'TransactionAmount'
    property :is_retry_transaction, from: 'IsRetryTransaction'

    # Response
    property :id, from: 'Id'

    coerce_key :browser, BraspagRest::FraudAnalyses::Browser
    coerce_key :cart, BraspagRest::FraudAnalyses::Cart
    coerce_key :merchant_defined_fields, Array[BraspagRest::FraudAnalyses::MerchantDefinedFields]

    def accepted?
      status.to_i.eql?(STATUS_ACCEPTED)
    end

    def rejected?
      status.to_i.eql?(STATUS_REJECTED)
    end
  end
end
