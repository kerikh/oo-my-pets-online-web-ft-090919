require 'pry'
class Owner
  attr_reader :name, :species, :cat 
  @@all = []
  

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self

  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self} 
  end 

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    Cat.all.each {|cat| cat.mood ="happy"}
  end 
  
  def sell_pets
    owners_pets = cats || dogs
    if owners_pets.clear
     cats.each {|cat| cat.mood = "nervous"} 
     dogs.each {|dog| dog.mood = "nervous"}
     cats.each {|cat| cat.owner = nil}
     dogs.each {|dog| dog.owner = nil} 
    end
  end 

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)." 
   
  end
  
  
end