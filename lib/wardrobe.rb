class Wardrobe
  def self.from_dir(path)
    files = Dir[File.join(path, "*.txt")]
    garments = files.map { |file| Garment.from_file(file) }

    new(garments)
  end

  def initialize(garments)
    @garments = garments
  end

  def for_temperature(value)
    @garments_for_temp = @garments.select do |garment|
      garment.suits_for?(value)
    end
  end

  def uniq_by_type!
    @garments = types.map do |type|
      @garments_for_temp
        .select { |garment| garment.type == type }
        .sample
     end
  end

  def types
    @garments.map(&:type).uniq
  end

  def to_s
    @garments.join("\n")
  end
end
