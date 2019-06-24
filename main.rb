require_relative "lib/garment"
require_relative "lib/wardrobe"

wardrobe = Wardrobe.from_dir("#{__dir__}/data")

puts "Сколько градусов за окном? (можно с минусом)"

user_input = STDIN.gets.to_i

wardrobe.for_temperatures!(user_input)

wardrobe.uniq_by_type!

puts wardrobe