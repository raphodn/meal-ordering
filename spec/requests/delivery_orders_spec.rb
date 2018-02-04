require 'rails_helper'

RSpec.describe 'Delivery Orders API', type: :request do
  # initialize test data
  let!(:meals) { create_list(:meal, 10) }
  let(:meal_id) { meals.first.id }
  let!(:delivery_orders) { create_list(:delivery_order, 2) }
  let(:delivery_order_id) { delivery_orders.first.order_id }

  # Test suite for GET /orders
  describe 'GET /orders' do
    # make HTTP get request before each example
    before { get '/orders' }

    it 'returns orders' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /orders/:order_id
  describe 'GET /orders/:order_id' do
    # make HTTP get request before each example
    before { get "/orders/#{delivery_order_id}" }

    context 'when the record exists' do
      it 'returns the order' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['order_id']).to eq(delivery_order_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the record does not exist' do
      let(:delivery_order_id) { 'random' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  #

end
