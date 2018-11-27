# -*- encoding : utf-8 -*-
require 'spec_helper'

describe BraspagRest::Payment do
  let(:credit_card_payment) do
    {
      'ReasonMessage' => 'Successful',
      'Interest' => 'ByMerchant',
      'Links' => [
        {
          'Href' => 'https=>//apiqueryhomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
          'Method' => 'GET',
          'Rel' => 'self'
        },
        {
          'Method' => 'PUT',
          'Href' => 'https=>//apihomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/capture',
          'Rel' => 'capture'
        },
        {
          'Rel' => 'void',
          'Href' => 'https=>//apihomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/void',
          'Method' => 'PUT'
        }
      ],
      'Tid' => '1016101051753',
      'ServiceTaxAmount' => 0,
      'Country' => 'BRA',
      'AcquirerTransactionId' => '0625101832104',
      'CreditCard' => {
        'ExpirationDate' => '12/2021',
        'SaveCard' => false,
        'Brand' => 'Visa',
        'CardNumber' => '000000******0001',
        'Holder' => 'Teste Holder'
      },
      'ReceivedDate' => '2015-06-25 10:18:32',
      'ProviderReturnCode' => '4',
      'ReasonCode' => 0,
      'ProofOfSale' => '1832104',
      'Capture' => false,
      'Provider' => 'Simulado',
      'Currency' => 'BRL',
      'ProviderReturnMessage' => 'Operation Successful',
      'Amount' => 15_700,
      'BoletoNumber' => '2017091101',
      'CapturedAmount' => 15_800,
      'Type' => 'CreditCard',
      'AuthorizationCode' => '058475',
      'PaymentId' => '1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
      'Authenticate' => false,
      'Installments' => 1,
      'Recurrent' => false,
      'VoidedAmount' => 1245,
      'VoidedDate' => '2015-06-25 10:18:32',
      'Status' => 1
    }
  end

  let(:splitted_credit_card_payment_captured) do
    {
      'ReasonMessage' => 'Successful',
      'Interest' => 'ByMerchant',
      'Links' => [
        {
          'Href' => 'https=>//apiqueryhomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
          'Method' => 'GET',
          'Rel' => 'self'
        },
        {
          'Method' => 'PUT',
          'Href' => 'https=>//apihomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/capture',
          'Rel' => 'capture'
        },
        {
          'Rel' => 'void',
          'Href' => 'https=>//apihomolog.braspag.com.br/v2/sales/1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1/void',
          'Method' => 'PUT'
        }
      ],
      'ServiceTaxAmount' => 0,
      'Country' => 'BRA',
      'AcquirerTransactionId' => '0625101832104',
      'Tid' => '1016101051753',
      'CreditCard' => {
        'ExpirationDate' => '12/2021',
        'SaveCard' => false,
        'Brand' => 'Visa',
        'CardNumber' => '000000******0001',
        'Holder' => 'Teste Holder'
      },
      'ReceivedDate' => '2015-06-25 10:18:32',
      'ProviderReturnCode' => '4',
      'ReasonCode' => 0,
      'ProofOfSale' => '1832104',
      'Capture' => false,
      'Provider' => 'Simulado',
      'Currency' => 'BRL',
      'ProviderReturnMessage' => 'Operation Successful',
      'Amount' => 15_700,
      'BoletoNumber' => '2017091101',
      'CapturedAmount' => 15_800,
      'Type' => 'SplittedCreditCard',
      'AuthorizationCode' => '058475',
      'PaymentId' => '1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1',
      'Authenticate' => false,
      'Installments' => 1,
      'Recurrent' => false,
      'VoidedAmount' => 1245,
      'VoidedDate' => '2015-06-25 10:18:32',
      'Status' => 2,
      'SplitPayments' => [
        {
          'SubordinateMerchantId' => '20943d1a-153f-42b6-93b8-07b9db000651',
          'Amount' => 6000,
          'Fares' => {
            'Mdr' => 2,
            'Fee' => 30
          },
          'Splits' => [
            {
              'MerchantId' => '20943d1a-153f-42b6-93b8-07b9db000651',
              'Amount' => 5850
            },
            {
              'MerchantId' => 'abf26594-b758-4a69-841d-e254285f7068',
              'Amount' => 150
            }
          ]
        },
        {
          'SubordinateMerchantId' => 'a4133798-9fac-4592-b040-d62d8239bd97',
          'Amount' => 4000,
          'Fares' => {
            'Mdr' => 2,
            'Fee' => 30
          },
          'Splits' => [
            {
              'MerchantId' => 'a4133798-9fac-4592-b040-d62d8239bd97',
              'Amount' => 3890
            },
            {
              'MerchantId' => 'abf26594-b758-4a69-841d-e254285f7068',
              'Amount' => 110
            }
          ]
        }
      ]
    }
  end

  let(:splitted_credit_card_payment_authorized) do
    {
      'ServiceTaxAmount' => 0,
      'Installments' => 1,
      'Interest' => 0,
      'Capture' => false,
      'Authenticate' => false,
      'Recurrent' => false,
      'CreditCard' => {
        'CardNumber' => '000000******0001',
            'Holder' => 'Teste Holder',
            'ExpirationDate' => '12/2021',
            'SaveCard' => false,
            'Brand' => 'Visa'
      },
      'Tid' => '1016101051753',
      'ProofOfSale' => '1051753',
      'AuthorizationCode' => '112504',
      'Provider' => 'Simulado',
      'SplitPayments' => [],
      'Amount' => 10_000,
      'ReceivedDate' => '2018-10-16 10:10:51',
      'Status' => 1,
      'IsSplitted' => true,
      'ReturnMessage' => 'Operation Successful',
      'ReturnCode' => '4',
      'PaymentId' => 'c691daf5-a5cf-4e5c-82f8-3deaaaeeb13f',
      'Type' => 'SplittedCreditCard',
      'Currency' => 'BRL',
      'Country' => 'BRA',
      'Links' => [
        {
          'Method' => 'GET',
          'Rel' => 'self',
          'Href' => 'https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/c691daf5-a5cf-4e5c-82f8-3deaaaeeb13f'
        },
            {
              'Method' => 'PUT',
              'Rel' => 'capture',
              'Href' => 'https://apisandbox.cieloecommerce.cielo.com.br/1/sales/c691daf5-a5cf-4e5c-82f8-3deaaaeeb13f/capture'
            },
            {
              'Method' => 'PUT',
              'Rel' => 'void',
              'Href' => 'https://apisandbox.cieloecommerce.cielo.com.br/1/sales/c691daf5-a5cf-4e5c-82f8-3deaaaeeb13f/void'
            }
      ]
    }
  end

  let(:boleto_payment) do
    {
      'Address' => 'N/A, 1',
      'Amount' => 1150,
      'Assignor' => 'Desenvolvedores',
      'BarCodeNumber' => '00093657200000011509999250000000000799999990',
      'BoletoNumber' => '7-4',
      'Country' => 'BRA',
      'Currency' => 'BRL',
      'Demostrative' => '',
      'DigitableLine' => '00099.99921 50000.000005 07999.999902 3 65720000001150',
      'ExpirationDate' => '2015-10-05',
      'Identification' => 'N/A',
      'Instructions' => 'Não pagar após o vencimento.',
      'Links' => [
        {
          'Href' => 'https://apiquerysandbox.braspag.com.br/v2/sales/795cc546-8d3c-4ff3-8548-77320fc4b595',
          'Method' => 'GET',
          'Rel' => 'self'
        }
      ],
      'PaymentId' => '795cc546-8d3c-4ff3-8548-77320fc4b595',
      'Provider' => 'Simulado',
      'ReasonCode' => 0,
      'ReceivedDate' => '2015-10-02 13:11:01',
      'Status' => 1,
      'Type' => 'Boleto',
      'Url' => 'https://sandbox.pagador.com.br/post/pagador/reenvia.asp/795cc546-8d3c-4ff3-8548-77320fc4b595'
    }
  end
  describe '.new' do
    subject(:payment) { BraspagRest::Payment.new(credit_card_payment) }

    it 'initializes a payment using braspag response format' do
      expect(payment.type).to eq('CreditCard')
      expect(payment.amount).to eq(15_700)
      expect(payment.boleto_number).to eq('2017091101')
      expect(payment.captured_amount).to eq(15_800)
      expect(payment.provider).to eq('Simulado')
      expect(payment.installments).to eq(1)
      expect(payment.credit_card).to be_an_instance_of(BraspagRest::CreditCard)
      expect(payment.status).to eq(1)
      expect(payment.id).to eq('1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1')
      expect(payment.transaction_id).to eq('0625101832104')
      expect(payment.proof_of_sale).to eq('1832104')
      expect(payment.authorization_code).to eq('058475')
      expect(payment.reason_code).to eq(0)
      expect(payment.reason_message).to eq('Successful')
      expect(payment.tid).to eq('1016101051753')
    end
  end

  describe '.new_splitted' do
    subject(:payment_splitted) { BraspagRest::Payment.new(splitted_credit_card_payment_captured) }

    it 'initializes a splitted payment using braspag response format' do
      expect(payment_splitted.type).to eq('SplittedCreditCard')
      expect(payment_splitted.amount).to eq(15_700)
      expect(payment_splitted.boleto_number).to eq('2017091101')
      expect(payment_splitted.captured_amount).to eq(15_800)
      expect(payment_splitted.provider).to eq('Simulado')
      expect(payment_splitted.installments).to eq(1)
      expect(payment_splitted.credit_card).to be_an_instance_of(BraspagRest::CreditCard)
      expect(payment_splitted.status).to eq(2)
      expect(payment_splitted.id).to eq('1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1')
      expect(payment_splitted.transaction_id).to eq('0625101832104')
      expect(payment_splitted.proof_of_sale).to eq('1832104')
      expect(payment_splitted.authorization_code).to eq('058475')
      expect(payment_splitted.reason_code).to eq(0)
      expect(payment_splitted.reason_message).to eq('Successful')
      expect(payment_splitted.split_payments[0].subordinate_merchant_id).to eq('20943d1a-153f-42b6-93b8-07b9db000651')
      expect(payment_splitted.split_payments[0].amount).to eq(6000)
      expect(payment_splitted.split_payments[0].fares.mdr).to eq(2)
      expect(payment_splitted.split_payments[0].fares.fee).to eq(30)
      expect(payment_splitted.split_payments[0].splits[0].merchant_id).to eq('20943d1a-153f-42b6-93b8-07b9db000651')
      expect(payment_splitted.split_payments[0].splits[0].amount).to eq(5850)
      expect(payment_splitted.split_payments[0].splits[1].merchant_id).to eq('abf26594-b758-4a69-841d-e254285f7068')
      expect(payment_splitted.split_payments[0].splits[1].amount).to eq(150)
      expect(payment_splitted.split_payments[1].subordinate_merchant_id).to eq('a4133798-9fac-4592-b040-d62d8239bd97')
      expect(payment_splitted.split_payments[1].amount).to eq(4000)
      expect(payment_splitted.split_payments[1].fares.mdr).to eq(2)
      expect(payment_splitted.split_payments[1].fares.fee).to eq(30)
      expect(payment_splitted.split_payments[1].splits[0].merchant_id).to eq('a4133798-9fac-4592-b040-d62d8239bd97')
      expect(payment_splitted.split_payments[1].splits[0].amount).to eq(3890)
      expect(payment_splitted.split_payments[1].splits[1].merchant_id).to eq('abf26594-b758-4a69-841d-e254285f7068')
      expect(payment_splitted.split_payments[1].splits[1].amount).to eq(110)
      expect(payment_splitted.tid).to eq('1016101051753')

    end
  end

  describe '#authorized?' do
    subject(:sale) { BraspagRest::Payment.new(params) }

    context 'when status is 1' do
      let(:params) { { status: 1 } }

      it 'returns authorized' do
        expect(sale).to be_authorized
      end
    end

    context 'when status is not 1' do
      let(:params) { { status: 2 } }

      it 'returns not authorized' do
        expect(sale).not_to be_authorized
      end
    end
  end

  describe '#captured?' do
    subject(:sale) { BraspagRest::Payment.new(params) }

    context 'when status is 2' do
      let(:params) { { status: 2 } }

      it 'returns captured' do
        expect(sale).to be_captured
      end
    end

    context 'when status is not 2' do
      let(:params) { { status: 3 } }

      it 'returns not captured' do
        expect(sale).not_to be_captured
      end
    end
  end

  describe '#cancelled?' do
    subject(:sale) { BraspagRest::Payment.new(params) }

    context 'when status is 10' do
      let(:params) { { status: 10 } }

      it 'returns cancelled' do
        expect(sale).to be_cancelled
      end
    end

    context 'when status is not 10' do
      let(:params) { { status: 3 } }

      it 'returns not cancelled' do
        expect(sale).not_to be_cancelled
      end
    end
  end

  describe '#refunded?' do
    subject(:sale) { BraspagRest::Payment.new(params) }

    context 'when status is 11' do
      let(:params) { { status: 11 } }

      it 'returns refunded' do
        expect(sale).to be_refunded
      end
    end

    context 'when status is not 11' do
      let(:params) { { status: 3 } }

      it 'returns not refunded' do
        expect(sale).not_to be_refunded
      end
    end
  end

  describe '#split' do
    let(:split1) do
      BraspagRest::SplitPayment.new(
        subordinate_merchant_id: 'a4133798-9fac-4592-b040-d62d8239bd97',
        amount:  6000,
        fares:  {
          mdr:  5,
          fee:  30
        }
      )
    end

    let(:split2) do
      BraspagRest::SplitPayment.new(
        subordinate_merchant_id: '20943d1a-153f-42b6-93b8-07b9db000651',
        amount: 4000,
        fares: {
          mdr: 4,
          fee: 15
        }
      )
    end

    context 'payment authorized' do
      subject(:splitted_payment) { BraspagRest::Payment.new(splitted_credit_card_payment_authorized) }

      it 'BraspagRest::NotCapturedError' do
        expect { splitted_payment.split([split1, split2]) }.to raise_error(BraspagRest::NotCapturedError)
      end
    end

    context 'raises payment not of type SplittedCreditCard' do
      subject(:splitted_payment) { BraspagRest::Payment.new(credit_card_payment) }

      it 'raises BraspagRest::NotSplittablePaymentError' do
        expect { splitted_payment.split([split1, split2]) }.to raise_error(BraspagRest::NotSplittablePaymentError)
      end
    end

    context 'captured payment' do
      before { allow(BraspagRest::Request).to receive(:split).and_return(response) }

      subject(:splitted_payment) { BraspagRest::Payment.new(splitted_credit_card_payment_captured) }

      context 'when the gateway returns a successful response' do
        let(:parsed_body) do
          { 'Payment' => { 'Status' => 2, 'PaymentId' => '1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1' } }
        end

        let(:response) { double(success?: true, parsed_body: parsed_body) }

        it 'returns true and fills the sale object with the return' do
          expect(splitted_payment.split([split1, split2])).to be_truthy
          expect(splitted_payment.status).to eq(2)
          expect(splitted_payment.id).to eq('1ff114b4-32bb-4fe2-b1f2-ef79822ad5e1')
        end
      end

      context 'when the gateway returns success and the body contains errors' do
        let(:parsed_body) do
          {
            "Status"=> 1,
            "ReasonCode"=> 37,
            "ReasonMessage"=> "SplitTransactionalError",
            "ProviderReturnCode"=> "BP334",
            "ProviderReturnMessage"=> "Capture aborted by Split transactional error",
            "ReturnCode"=> "BP334",
            "ReturnMessage"=> "Capture aborted by Split transactional error",
            "SplitErrors"=> [
                {
                    "Code"=> 326,
                    "Message"=> "Subordinate merchants cannot be duplicated"
                }
            ],
            "Links"=> []
          }
        end

        let(:response) { double(success?: false, parsed_body: parsed_body, body_errors: { "SplitErrors" => [{"Code"=> 326,"Message"=> "Subordinate merchants cannot be duplicated"}]})}

        it 'returns false and fills the errors attribute' do
          expect(splitted_payment.split([split1, split2])).to be_falsey
          expect(splitted_payment.errors).to eq([{ code: 326, message: 'Subordinate merchants cannot be duplicated' }])
        end
      end

      context 'when the gateway returns a failure and the body is an Array' do
        let(:parsed_body) do
          [{ 'Code' => 123, 'Message' => 'MerchantOrderId cannot be null' }]
        end

        let(:response) { double(success?: false, parsed_body: parsed_body) }

        it 'returns false and fills the errors attribute' do
          expect(splitted_payment.split([split1, split2])).to be_falsey
          expect(splitted_payment.errors).to eq([{ code: 123, message: 'MerchantOrderId cannot be null' }])
        end
      end

      context 'when the gateway returns a failure and the body is a Hash' do
        let(:parsed_body) do
          {
            'Errors' => [
              {
                'Message' => 'No one value can be negative'
              }
            ]
          }
        end

        let(:response) { double(success?: false, parsed_body: parsed_body, body_errors: {"Errors"=>[{"Message"=>"No one value can be negative"}]}) }

        it 'returns false and fills the errors attribute' do
          expect(splitted_payment.split([split1, split2])).to be_falsey
          expect(splitted_payment.errors).to eq([{ code: nil, message: 'No one value can be negative' }])
        end
      end
    end
  end

  describe 'boleto payments' do
    subject(:payment) { BraspagRest::Payment.new(boleto_payment) }

    it 'features boleto-specific attributes' do
      expect(payment.digitable_line).to eq('00099.99921 50000.000005 07999.999902 3 65720000001150')
      expect(payment.barcode_number).to eq('00093657200000011509999250000000000799999990')
      expect(payment.expiration_date).to eq('2015-10-05')
      expect(payment.instructions).to eq('Não pagar após o vencimento.')
      expect(payment.printable_page_url).to eq('https://sandbox.pagador.com.br/post/pagador/reenvia.asp/795cc546-8d3c-4ff3-8548-77320fc4b595')
      expect(payment.boleto_number).to eq('7-4')
    end
  end

  describe 'refunded credit card payment' do
    let(:refunded_credit_card_payment) do
      attributes = credit_card_payment.dup
      attributes['Refunds'] = [{
        'Amount' => 1234,
        'Status' => 11,
        'ReceivedDate' => '2017-09-06T16:22:46.777'
      }]

      attributes['VoidedAmount'] = 1234
      attributes['VoidedDate'] = '2017-09-06T16:22:46.777'
      attributes
    end

    subject(:payment) { BraspagRest::Payment.new(refunded_credit_card_payment) }

    it 'assigns refund references' do
      refund = payment.refunds.first

      expect(payment.refunds.count).to eq 1
      expect(refund).to be_succes
      expect(refund.amount).to eq 1234
      expect(refund.status).to eq 11
      expect(refund.received_date).to eq '2017-09-06T16:22:46.777'
    end
  end
end
