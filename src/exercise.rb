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
    def weight(weight)
        @weight=weight
    end
    def reps(reps)
        @reps=reps
    end
end
array=[]
x=0

puts "Enter exercise"
name=gets.chomp
puts "Enter number of sets for #{name}"
setsno=gets.chomp.to_i
exercise1=Exercise.new(name,setsno)
exercise1.sets.times do
puts "Please enter the weights in kg for this set."
exercise1.weight(gets.chomp.to_f)
puts "Please enter the number of reps for the exercise for this set"
exercise1.reps(gets.chomp.to_i)
puts "It is now time for your next set"
x+=1
array.push("#{exercise1.name} Set #{x} Weight x Reps y")
end

puts "#{array}"

