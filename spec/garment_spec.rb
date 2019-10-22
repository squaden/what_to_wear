require 'rspec'
require 'garment'

describe Garment do
  before(:all) do
    @garment = Garment.from_file("#{__dir__}/fixtures/01.txt")
  end

  it 'returns data from file' do
    expect(@garment.name).to eq 'Шапка-ушанка'
    expect(@garment.type).to eq 'Головной убор'
    expect(@garment.temperature_range).to eq (-40..-10)
  end

  describe '#suits_for?' do
    it 'returns true for temp -10' do
      expect(@garment.suits_for?(-10)).to be_truthy
    end

    it 'returns false for temp 10' do
      expect(@garment.suits_for?(10)).to be_falsey
    end
  end

  describe '#to_s' do
    it 'returns info string' do
      expect(@garment.to_s).to eq 'Шапка-ушанка (Головной убор) -40..-10'
    end
  end
end
