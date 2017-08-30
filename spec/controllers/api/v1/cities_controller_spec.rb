require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  describe 'Searching cities' do
    context 'When it works' do
      before do
        get :search, params: { q: 'Buenos Aires'}, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'returns a list of cities'
      it 'has city id'
      it 'has city name'
      it 'has city country code'
      context 'coordinates' do
        it 'has it'
        it 'has latitude'
        it 'has longitude'
      end
    end
    context 'When it finds nothing' do
      before do
        get :search, params: { q: 'supercalifragilisticexpialidocious'}, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'returns an empty list'
    end
  end

  describe 'Current weather for a city by id' do
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
        get :current, params: { id: -1 }, as: :json
      end
      it { is_expected.to respond_with :not_found }
    end
  end
end
