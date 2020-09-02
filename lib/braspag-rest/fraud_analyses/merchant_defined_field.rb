module BraspagRest
  module FraudAnalyses
    class MerchantDefinedFields < Hashie::IUTrash
      property :key, from: 'Key'
      property :value, from: 'Value'
    end
  end
end
