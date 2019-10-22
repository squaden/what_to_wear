require 'rspec'
require 'wardrobe'
require 'garment'

describe Wardrobe do
  before(:all) do
    @wardrobe = Wardrobe.from_dir("#{__dir__}/fixtures")
  end

  describe '#types' do
    it 'returns uniq clothes_types' do
      expect(@wardrobe.types).to eq ['Головной убор', 'Обувь', 'Верхняя одежда', 'Штаны']
    end
  end
end
