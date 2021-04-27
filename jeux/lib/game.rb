require "pry"

class User

  attr_accessor :email
  attr_accessor :age
  @@all_users = []


    def initialize(email_to_save, age_to_save)
      @email = email_to_save
      @age = age_to_save
      @@all_users << email
      @@all_users << age
    end

    def self.all
      return @@all_users
    end


    def self.find_by_email(mail)

      for i in 0..@@all_users.length - 1 
        
        if @@all_users[i] == mail
          agee = @@all_users[i + 1]
        end
      end

      puts "Voici l'âge du User trouvé : #{agee}"

    end

  
end


binding.pry
puts "end of file"