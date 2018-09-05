# this requires to source the class and methods from another file
require_relative 'utilities.rb'
require_relative 'exercise.rb'
# this also requires terminal-table gem to be installed. it also uses the inhouse date library of ruby
require 'terminal-table'
require 'date'

# setting of variables. rows will be used to store the exercise date and continue will be used as condition 
rows=[]
continue="yes"

# start screen
puts `clear`  
titlerow=[["Welcome to Exercise Log App!"]] 
title = Terminal::Table.new :rows => titlerow
puts title
puts "This is an app that tracks your exercises as you do them. Enjoy your workout!"
puts "Please make sure to use proper lifting techniques and stretch to warm up!"

# user is asked for the first exercise
puts "To start, enter your first exercise!"
name=gets.chomp.upcase

# user is asked for sets. the sets should be a whole number otherwise it will return an error and ask for it again.
begin
    puts "Enter the number of sets for #{name}"
    setsno=gets.chomp
    setsno=validate_intarg(setsno).to_i
    rescue 
        puts
        puts "Please enter a whole number for sets!"
        retry
end

# inputs will now be used to set the class. 
exercise=Exercise.new(name,setsno)
# depending on the number of sets it will run the setcount method to log the exercises.
exercise.sets.times do
# this displays the rows. the method has a clear function to clear the screen.
    report(rows)
    exercise.setcount
# this pushes the exercise name, set, weights and reps into the exercise log array
    rows << exercise.input
end

until continue=="no"
    # user is asked if user wants to continue to exercise. until user says no, application will continue.
    puts "Do you want to continue to exercise? Please enter yes or no :)"
    continue=gets.chomp.downcase
    if continue=="yes"
        report(rows)
        puts "Enter your next exercise"
        name=gets.chomp.upcase
        begin
            puts "Enter the number of sets for #{name}"
            setsno=gets.chomp
            setsno=validate_intarg(setsno).to_i
        rescue NonIntegerArgumentError
            puts
            puts "Please enter a whole number for sets!"
            retry
        end
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

# program ends with displaying the log
report(rows)
puts "Great job on finishing your workout!"
puts "Remember to cool down after your workout!"
puts "Thanks for using the app! Here is your exercise log!"
