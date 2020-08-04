# -*- encoding : utf-8 -*-
module BraspagRest
  def self.config
    @config ||= BraspagRest::Configuration.new
    yield @config if block_given?
    @config
  end
end
require 'hashie'
require 'rest-client'
require 'braspag-rest/errors/no_voids_given_error'
require 'braspag-rest/errors/not_captured_error'
require 'braspag-rest/errors/not_splittable_payment_error'
require 'braspag-rest/hashie'
require 'braspag-rest/version'
require 'braspag-rest/configuration'
require 'braspag-rest/response'
require 'braspag-rest/request'
require 'braspag-rest/address'
require 'braspag-rest/customer'
require 'braspag-rest/credit_card'
require 'braspag-rest/chargeback_split'
require 'braspag-rest/chargeback_split_payment'
require 'braspag-rest/chargeback'
require 'braspag-rest/fraud_alert'
require 'braspag-rest/fraud_analyses/item'
require 'braspag-rest/fraud_analyses/cart'
require 'braspag-rest/fraud_analyses/browser'
require 'braspag-rest/fraud_analyses'
require 'braspag-rest/fraud_analysis'
require 'braspag-rest/refund'
require 'braspag-rest/split'
require 'braspag-rest/fare'
require 'braspag-rest/split_payment'
require 'braspag-rest/voided_split'
require 'braspag-rest/void_split_payment'
require 'braspag-rest/void'
require 'braspag-rest/payment'
require 'braspag-rest/sale'
require 'braspag-rest/token_manager'
