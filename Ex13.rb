# EXTEND THE BUILT IN CLASS

class Array
  def to_shfl
    self.shuffle
  end
end

a = Array.new
(1..10).each { |i| a << i }

puts a.to_shfl

class Integer
  def to_fact
    fac_arr = []
    total = 1
    (1..self).each {|i| fac_arr << i}
    fac_arr.each {|i| total *= i}
    total
  end
end

puts 5.to_fact

class Integer

  def to_rom
    romans = 'M' * (self /1000)  # M: 1000
    # Check if 400 or 900
    if self%1000/100 == 4
      romans = romans + 'CD'
    elsif self%1000/100 == 9
      romans = romans + 'CM'
    else
      romans = romans + 'D' * (self%1000/500)  # D: 500
      romans = romans + 'C' * (self%500/100) # C: 100
    end

    #Check if 40 or 90
    if self%100/10 == 4
      romans = romans + 'XL'
    elsif self%100/10 == 9
      romans = romans + 'XC'
    else  
      romans = romans + 'L' * (self%100/50)  # L: 50
      romans = romans + 'X' * (self%50/10)   # X: 10
    end
    # Check if 4 or 9
    if self%10 == 4
      romans = romans + 'IV'
    elsif self%10 == 9
      romans = romans + 'IX'
    else
      romans = romans + 'V' * (self%10/5)    # V: 5
      romans = romans + 'I' * (self%5/1)   # I: 1
      romans
    end
  end
end

puts 1999.to_rom

# ORANGE TREE CLASS
class OrangeTree
  def initialize
    @height = 0
    @age    = 0
    @capacity = 0
    @orange_count = 0
    @old_fruit = 0
  puts "You have lovingly planted an Orange Tree seed."
  puts "May it bear you many fruits."
  end

  def height
    @height = @age * 100
    puts "You orange tree is #{@height}cms"
    one_year_passes
  end

  def count_the_oranges
    puts "There are #{@orange_count} oranges on the tree."
  end

  def pick_an_orange
    if @orange_count > 0
      @old_fruit -=1
      @orange_count -= 1
      puts "You picked an orange and ate it..."
      puts "OMG!! that was some amazballs sweet orange!"
    else
      puts "Sorry there are no more oranges to pick this year."
      puts "You've picked them all you greedy bastard!"
    end
  end

  private

  def one_year_passes
    if @age <= 10
      @orange_count += @capacity - @old_fruit
      @old_fruit = @capacity
      @age += 1
      fruit
    else
      puts "Your Orange Tree is old and dies."
      exit
    end
  end

  def fruit
    if @age == 3
      @capacity = 2
    elsif @age > 3
      @capacity **= 3
    else
      @capacity = 0
    end
  end
end

plant = OrangeTree.new
plant.height
plant.height
plant.height
plant.count_the_oranges
plant.height
plant.count_the_oranges
plant.pick_an_orange
plant.pick_an_orange
plant.pick_an_orange
plant.count_the_oranges
plant.height
plant.count_the_oranges

# INTERACTIVE BABY DRAGON
class Dragon
  def initialize name
    @name = name
    @asleep = false
    @stuff_in_belly     = 10 # He doesn't need to go.
    @stuff_in_intestine =  0 # He's full.
  end

  def feed
  puts "You feed #{@name}." 
  @stuff_in_belly = 10 
  passage_of_time
  end

  def walk
    puts "You walk #{@name}." 
    @stuff_in_intestine = 0 
    passage_of_time
  end

  def put_to_bed
    puts "You put #{@name} to bed." 
    @asleep = true
    3.times do
      if @asleep 
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly."
    end 
  end

  def toss
    puts "You toss #{@name} up into the air."
    puts 'He giggles, which singes your eyebrows.' 
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts 'He briefly dozes off...'
    passage_of_time
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end 
  end

  private
  # "private" means that the methods defined here are
  # methods internal to the object. (You can feed your 
  # dragon, but you can't ask him whether he's hungry.) 
  def hungry?
    # Method names can end with "?".
    # Usually, we do this only if the method 
    # returns true or false, like this: 
    @stuff_in_belly <= 2
  end

  def poopy? 
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0
      #  Move food from belly to intestine.
      @stuff_in_belly     = @stuff_in_belly     - 1
      @stuff_in_intestine = @stuff_in_intestine + 1
    else # Our dragon is starving! 
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!' 
      end
        puts "#{@name} is starving!  In desperation, he ate YOU!"
        exit # This quits the program. 
    end
    if @stuff_in_intestine >= 10 
      @stuff_in_intestine = 0
      puts "Whoops! #{@name} had an accident..."
    end
    
    if hungry? 
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts "#{@name}'s stomach grumbles..." 
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
        puts "#{@name} does the potty dance..."
    end
  end
end

puts "You wife has just given birth to a beautiful...WHAT!?! DRAGON?!?"
puts "Well, ok I can keep an open mind. What would you like to call your baby?"
name = gets.chomp
baby = Dragon.new name
puts "You've taken a short flight home on your new baby dragon."

while true
  puts "What would you like to do? Please choose the following:"
  puts " 'feed', 'walk', 'bed', 'toss', 'rock', 'quit'"
  action = gets.chomp
  case action
    when 'feed' then baby.feed
    when 'walk' then baby.walk
    when 'bed' then baby.put_to_bed
    when 'toss' then baby.toss
    when 'rock' then baby.rock
    when 'quit' then exit
    else puts "I don't understand #{action}."
  end
end