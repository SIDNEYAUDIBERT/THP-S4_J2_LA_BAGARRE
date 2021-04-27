require "time"

class Player

  attr_accessor :name
  attr_accessor :life_points


  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end


  def show_state
    print("#{@name} a #{@life_points} points de vie" )
  end


  def gets_damage(damage)
    @life_points -= damage
    if @life_points < 0 
       @life_points = 0
      puts("Le joueur #{@name} a été tué !")
    end
  end


  def attacks(nommm)
    puts("#{@name} attaque #{nommm.name}" )
    dommage = compute_damage
    puts("Il lui inflige #{dommage} points de dommages" )
    puts "--------------------------------"
    nommm.gets_damage(dommage)
  end


  def compute_damage
    return rand(1..6)
  end


end



class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 100
    @weapon_level = 1
  end


  def show_state
    puts("#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}" )
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    de = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{de}"
    if de > @weapon_level
        @weapon_level = de
        puts "Bravo, tu as trouvé une meilleure arme !"
        puts "--------------------------------"
    else 
        puts "Crotte, elle n'est pas meilleure que ton arme actuelle..."
        puts "--------------------------------"
    end
  end


  def search_health_pack
    de2 = rand(1..6)
    if de2 == 1
      puts "Tu n'as rien trouvé..."
    end

    if de2 >= 2 && de2 <= 5

      @life_points += 50
        if @life_points > 100
          @life_points = 100
        end
        puts "Tu as trouvé un pack de +50 points de vie !"
    end


    if de2 == 6
      @life_points += 80
        if @life_points > 100
          @life_points = 100
        end
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
    
  end

end