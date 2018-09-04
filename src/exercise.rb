puts "Welcome to Exercise App!"

class Exercise
    attr_accessor :name, :sets, :weight, :reps
    def initialize(name,sets)
        @name=name
        @sets=sets
    end
    def sets
        return @sets
    end
    # def weight(weight)
    #     @weight=weight
    # end
    # def reps(reps)
    #     @reps=reps
    # end
end
array=[""]
x=0
continue="yes"

puts "Enter exercise"
name=gets.chomp
puts "Enter number of sets for #{name}"
setsno=gets.chomp.to_i
exercise1=Exercise.new(name,setsno)
exercise1.sets.times do
x+=1
puts "It's now time for set #{x}"
puts "Please enter the weights (in kg) for this set."
weight=gets.chomp.to_f
puts "Please enter the number of reps you're able to do in this set."
reps=gets.chomp.to_i
array.push("#{exercise1.name} Set #{x} Weight #{weight} Reps #{reps}")
end


while continue=="yes"
puts "Do you want to continue to exercise? Yes/No"
continue=gets.chomp.downcase
if continue=="yes"
    puts "Enter exercise"
    name=gets.chomp
    puts "Enter number of sets for #{name}"
    setsno=gets.chomp.to_i
    exercise1=Exercise.new(name,setsno)
    exercise1.sets.times do
    x+=1
    puts "It's now time for set #{x}"
    puts "Please enter the weights (in kg) for this set."
    weight=gets.chomp.to_f
    puts "Please enter the number of reps you're able to do in this set."
    reps=gets.chomp.to_i
    array.push("#{exercise1.name} Set #{x} Weight #{weight} Reps #{reps}")
    end  
elsif continue=="no"
    puts "Thanks for using the app!"
    end
end

puts array

