require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  describe '#search' do
    context 'When it works' do
      before do
        get :search, params: { q: 'Buenos Aires'}, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'returns a list of cities'
      context 'a city' do
        it 'has id'
        it 'has name'
        it 'has country code'
        context 'coordinates' do
          it 'has it'
          it 'has latitude'
          it 'has longitude'
        end
      end
    end
    context 'When it finds nothing' do
      before do
        get :search, params: { q: 'supercalifragilisticexpialidocious'}, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'returns an empty list'
    end
    context 'When requesting without a query' do
      before do
        get :search, as: :json
      end
      it { is_expected.to respond_with :bad_request }
    end
  end

  describe '#current' do
    context 'When the id exists' do
      before do
        get :current, params: { id: 2950159 }, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'returns the city weather'
      context 'weather' do
        it 'has it'
        it 'is a list'
        it 'has main'
      end
      context 'main' do
        it 'has it'
        it 'has temp'
        it 'has pressure'
        it 'has humidity'
      end
    end
    context 'When the id doesn\'t exist' do
      before do
        get :current, params: { id: 9**9 }, as: :json
      end
      it { is_expected.to respond_with :not_found }
    end
    context 'When requesting without a id' do
      before do
        get :search, as: :json
      end
      it { is_expected.to respond_with :bad_request }
    end
  end
end
