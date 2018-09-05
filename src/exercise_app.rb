# this requires to source the class and methods from another file
require_relative 'utilities.rb'
require_relative 'exercise.rb'
# this also requires terminal-table gem to be installed. it also uses the inhouse date library of ruby
require 'terminal-table'
require 'date'
# this is for recording history, but for this version displaying the history is not yet implemented. to come in future version.
require 'json'

# setting of variables. workout will be used to store the exercise data and continue will be used as condition 
workout=[]
continue="yes"

# this is for recording history, but for this version displaying the history is not yet implemented. 
# this reads/creates the JSON file
begin
    history = JSON.parse(File.read('history.json'))
rescue
    history = []
    File.write('history.json', JSON.dump(history))
end

# start screen
puts `clear`  
titlerow=[["Welcome to Exercise Log App!"]] 
title = Terminal::Table.new :rows => titlerow
puts title
puts "This is an app that tracks your exercises as you do them. Enjoy your workout!"
puts "Please make sure to use proper lifting techniques and stretch to warm up :)"

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
    report(workout)
    exercise.setcount
# this pushes the exercise name, set, weights and reps into the exercise log array
    workout << exercise.input
# this pushes the date, exercise name, set, weights and reps into the history
    history << exercise.hist_input
end

until continue=="no"
    # user is asked if user wants to continue to exercise. until user says no, application will continue.
    puts "Do you want to continue to exercise? Please enter yes or no :)"
    continue=gets.chomp.downcase
    if continue=="yes"
        report(workout)
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
            report(workout)
            exercise.setcount
            workout << exercise.input
            history << exercise.hist_input
        end 
    else
        puts "Please enter yes or no only!"
    end
end

# program ends with displaying the log
report(workout)
puts "Thanks for using the app! See above for your exercise log for this session!"
puts "Great job on finishing your workout!"
puts "Remember to cool down after your workout :)"
# code below is for storing the history. history display is not yet implemented.
File.write('history.json', JSON.dump(history))
# history_report(history)