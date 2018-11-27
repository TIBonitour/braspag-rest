# -*- encoding : utf-8 -*-
module BraspagRest
  class Response
    attr_reader :gateway_response

    def initialize(gateway_response)
      @gateway_response = gateway_response
    end

    def success?
      (200..207).include?(@gateway_response.code) && body_errors.empty? rescue false
    end

    def body_errors
      detailed_errors(parsed_body)
    end

    def parsed_body
      JSON.parse(@gateway_response.body) rescue {}
    end

    private

    def detailed_errors(body)
      {}.tap do |error_info|
        body.each do |key, value|
          error_info[key] = value.is_a?(Hash) ? detailed_errors(value) : value if key =~ /error/i
        end
      end
    end
  end
end
