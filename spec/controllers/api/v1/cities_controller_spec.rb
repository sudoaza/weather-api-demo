require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  describe '#search' do
    context 'When it works' do
      before do
        get :search, params: { q: 'Buenos Aires'}, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'is a list of cities' do
        expect(json).to be_a Array
      end
      context 'a city' do
        let(:subject) { json.first }
        it 'has id' do
          expect(subject['id']).to_not be_nil
        end
        it 'has name' do
          expect(subject['name']).to_not be_nil
        end
        it 'has country code' do
          expect(subject['sys']['country']).to_not be_nil
        end
        context 'coordinates' do
          it 'has it' do
            expect(subject['coord']).to_not be_nil
          end
          it 'has latitude' do
            expect(subject['coord']['lat']).to_not be_nil
          end
          it 'has longitude' do
            expect(subject['coord']['lon']).to_not be_nil
          end
        end
      end
    end
    context 'When it finds nothing' do
      before do
        get :search, params: { q: 'supercalifragilisticexpialidocious'}, as: :json
      end
      it { is_expected.to respond_with :ok }
      it 'returns an empty list' do
        expect(json).to eq []
      end
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
      it 'returns the city weather' do
        expect(json).to be_a Hash
      end
      context 'weather' do
        def weather
          json['weather']
        end
        it 'has it' do
          expect(weather).to_not be_nil
        end
        it 'is a list' do
          expect(weather).to be_a Array
        end
        it 'has main' do
          expect(weather.first['main']).to_not be_nil
        end
      end
      context 'main' do
        def main
          json['main']
        end
        it 'is a hash' do
          expect(main).to be_a Hash
        end
        it 'has temp' do
          expect(main['temp']).to_not be_nil
        end
        it 'has pressure' do
          expect(main['pressure']).to_not be_nil
        end
        it 'has humidity' do
          expect(main['humidity']).to_not be_nil
        end
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
