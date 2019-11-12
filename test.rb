module Sunroof
  def open_sunroof
    puts "Sunroof open!"
  end
end

class Vehicle
  @@vehicles = 0

  def age
    puts "Your #{self.model} is #{years_old} years old."
  end
  
  def self.gas_mileage(gallons, miles)
    puts "Gas mileage for the #{self.model} is #{gallons/miles} MPG."
  end

  def shut_off
    self.speed = 0
    puts "The car is turned off."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new color is #{color}"
  end

  def speed_up(num)
    self.speed += num
    puts "You sped up #{num} mph."
  end

  def brake(num)
    if self.speed - num <= 0
      self.speed = 0
    else
      self.speed -= num
    end
    puts "You slowed down to #{self.speed} mph."
  end

  private
  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  attr_accessor :color, :speed
  attr_reader :year, :model
  NUMBER_OF_DOORS = 2
  include Sunroof
  
  def initialize(year, color, model)
    @year = year
    self.color = color
    @model = model
    self.speed = 0

    @@vehicles += 1
  end

  def to_s
    puts "This car is a #{self.year} #{self.model} and is currently #{self.color}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 4

  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    self.color = color
    @model = model
    self.speed = 0

    @@vehicles += 1
  end
end

car = MyCar.new(2004, "Silver", "Pontiac")
truck = MyTruck.new(1995, "white", "Chevy")

puts car

car.open_sunroof
puts "-----MyCar-----"
puts MyCar.ancestors
puts "-----MyTruck-----"
puts MyTruck.ancestors
puts "-----Vehicle-----"
puts Vehicle.ancestors

puts car.age

class Student
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 85)
puts "Well done!" if joe.better_grade_than?(bob)