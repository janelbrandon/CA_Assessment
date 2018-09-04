puts "Welcome to Exercise App!"

class Exercise
    attr_accessor :name, :sets, :weight, :reps
    def initialize(name)
        @name=name
        @weight=weight
        @reps=reps
    end
    def sets
        @sets=sets
    end
end

puts "Enter exercise"
exercise=Exercise.new(gets.chomp)

puts "#{exercise(@name)}"
