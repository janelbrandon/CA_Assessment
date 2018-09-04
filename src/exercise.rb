require_relative '../src/class.rb'
require 'terminal-table'
require 'date'

rows=[]
continue="yes"

titlerow=[["Welcome to Exercise Log App!"]] 

title = Terminal::Table.new :rows => titlerow
puts title

puts "This is an app that tracks your exercises as you do them. Enjoy your workout!"
puts "To start, enter your first exercise!"
name=gets.chomp.upcase
puts "Enter the number of sets for #{name}"
setsno=gets.chomp.to_i
exercise=Exercise.new(name,setsno)
exercise.sets.times do
    report(rows)
    exercise.setcount
    rows << exercise.input
end

report(rows)
until continue=="no"
    report(rows)
    puts "Do you want to continue to exercise? Please enter yes or no :)"
    continue=gets.chomp.downcase
    if continue=="yes"
        puts "Enter your next exercise"
        name=gets.chomp.upcase
        puts "Enter the number of sets for #{name}"
        setsno=gets.chomp.to_i
        exercise=Exercise.new(name,setsno)
        exercise.sets.times do
            report(rows)
            exercise.setcount
            rows << exercise.input
        end 
    else
        puts "Please enter yes or no only!"
    end
end
report(rows)
puts "Thanks for using the app! Here is your exercise log!"