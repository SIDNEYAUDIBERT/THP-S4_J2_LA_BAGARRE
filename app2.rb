require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'


puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Entrez votre nom :"
print ">"
nom = gets.chomp



user = HumanPlayer.new(nom)
p2 = Player.new("Josiane")
p3 = Player.new("José")


ennemies = [p2, p3]

while user.life_points > 0 && (p2.life_points > 0 || p3.life_points > 0)

puts "--------------------------------"
puts "Tu as #{user.life_points} point de vie"
puts "--------------------------------"
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner"
puts "--------------------------------"
puts "Attaquer un joueur en vue :"
puts "#{p2.show_state} - 0"
puts " #{p3.show_state} - 1"

puts "--------------------------------"
puts "Entrez votre choix :"
print ">"
choix = gets.chomp


if choix == "a" 
    user.search_weapon

elsif choix == "s"
    user.search_health_pack

elsif choix == "0"
    user.attacks(p2)

elsif choix == "1"
    user.attacks(p3)

else puts "Nan par contre faut pas appuyer sur ce genre de touche. Je suis pas d'accord."
     puts "--------------------------------"
end

puts "--------------------------------"
if p2.life_points > 0 || p3.life_points > 0 
puts "Les autres joueurs t'attaquent !"
end


ennemies.each do |p|
  if p.life_points > 0
     p.attacks(user)
  end
end


end


puts "Bravo, tu as terminé le jeu !"