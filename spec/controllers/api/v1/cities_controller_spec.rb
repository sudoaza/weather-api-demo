require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :api do
  describe 'Searching cities' do
    context 'When it works' do
      it 'returns a success http code'
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
      it 'returns a success http code'
      it 'returns an empty list'
    end
  end

  describe 'Current weather for a city by id' do
    context 'When the id exists' do
      it 'returns a success http code'
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
  end
end
