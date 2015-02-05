require 'domain_spec_helper'

RSpec.describe Domain::Store do
  include Domain::Store

  describe '.main_page' do
    let(:main_page) { store.read(:beans).main_page }

    it 'returns three last beans for main page' do
      expect(main_page.to_a.size).to eq 3
    end

    it 'returns last created as first' do
      expect(main_page.first.id).to eq 4
    end
  end

  describe '.all' do
    let(:all) { store.read(:beans).all }

    it 'returns all beans' do
      expect(all.to_a.size).to eq 4
    end

    it 'returns the oldest first' do
      expect(all.first.id).to eq 1
    end
  end

  describe '.by_id' do
    let(:by_id) { store.read(:beans).by_id(1).first }

    it 'returns first bean' do
      expect(by_id).to eq Domain::Bean.new(id: 1, name: '1. bean',
                                           position: '1 1')
    end
  end
end
