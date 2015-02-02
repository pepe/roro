require 'domain_spec_helper'

RSpec.describe Domain do
  include Domain

  before do
    (1..4).each do |i|
      store.command(:beans).try { create(name: "#{i}. bean", position: "#{i} #{i}") }
    end
  end

  it 'returns three last beans for main page' do
    expect(store.read(:beans).main_page.to_a.size).to eq 3
  end

  it 'returns last created as first' do
    expect(store.read(:beans).main_page.first.id).to eq 4
  end
end
