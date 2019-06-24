class Garment
  attr_reader :name, :type, :temperatures_range

  def self.from_file(file)
    content = File.readlines(file, chomp: true)
    temperatures = content[2].scan(/\-?\d+/).map(&:to_i)
    temperatures_range = temperatures[0]..temperatures[1]

    new(content[0], content[1], temperatures_range)
  end

  def initialize(name, type, temperatures_range)
    @name = name
    @type = type
    @temperatures_range = temperatures_range
  end

  def suits_for?(temperatures)
    temperatures_range.include?(temperatures)
  end

  def to_s
    "#{name} (#{type}) #{temperatures_range}"
  end
end