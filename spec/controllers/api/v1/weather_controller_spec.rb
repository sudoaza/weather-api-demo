require 'rails_helper'

RSpec.describe Api::V1::WeatherController, type: :controller do

  describe '#coordinates' do
    context 'success' do
      before do
        get :coordinates, params: {lat: -34.61, lon: -58.38}, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'has name' do
        expect(json['name']).not_to be_nil
      end
      it 'has main' do
        expect(json['main']).not_to be_nil
      end
      context 'weather' do
        let(:subject) { json['weather'] }
        it { is_expected.not_to be_nil }
        it { is_expected.not_to be_empty}
      end
    end
    context 'bad coordinates' do
      before do
        get :coordinates, params: {lat: 999, lon: 999}, as: :json
      end
      it { is_expected.to respond_with :bad_request }
    end
  end

end
