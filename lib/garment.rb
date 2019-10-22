class Garment
  attr_reader :name, :type, :temperature_range

  def self.from_file(file)
    content = File.readlines(file, chomp: true)
    temperatures = content[2].scan(/\-?\d+/).map(&:to_i)
    temperature_range = temperatures[0]..temperatures[1]

    new(content[0], content[1], temperature_range)
  end

  def initialize(name, type, temperature_range)
    @name = name
    @type = type
    @temperature_range = temperature_range
  end

  def suits_for?(value)
    temperature_range.include?(value)
  end

  def to_s
    "#{name} (#{type}) #{temperature_range}"
  end
end
