files = Dir["#{__dir__}/data/*.txt"]

wardrobe =
  files.map do |file|
    content = File.readlines(file, chomp: true)
    temperatures = content[2].scan(/\-?\d+/).map(&:to_i)
    content[2] = temperatures[0]..temperatures[1]
    content
  end

puts "Сколько градусов за окном? (можно с минусом)"
user_input = STDIN.gets.to_i

suitable_garments =
  wardrobe.select { |garment| garment[2].include?(user_input) }

types = suitable_garments.map { |garment| garment[1] }
types.uniq!

uniq_suitable_garments =
  types.map do |type|
    suitable_garments
      .select { |garment| garment[1] == type }
      .sample
  end

uniq_suitable_garments.each do |garment|
  puts "#{garment[0]} (#{garment[1]}) #{garment[2]}"
end