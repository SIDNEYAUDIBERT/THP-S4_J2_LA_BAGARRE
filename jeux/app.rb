require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")


puts "Assistons maintenant au combat entre #{player1.name} et #{player2.name}"
puts "Voici l'état de nos joueurs :"
puts player1.show_state
puts player2.show_state

puts "Passons à la phase d'attaque :"
puts "--------------------------------"

while player1.life_points > 0 && player2.life_points > 0 

player1.attacks(player2)

if player2.life_points <= 0
  break
end

player2.attacks(player1)

if player1.life_points <= 0
  break
end

puts "--------------------------------"
puts "Voici l'état de nos joueurs :"
puts player1.show_state
puts player2.show_state
puts "--------------------------------"

end
