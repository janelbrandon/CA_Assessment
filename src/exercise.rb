require_relative '../src/class.rb'
require 'terminal-table'

puts "Welcome to Exercise App!"


rows=[]
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
rows << ["#{exercise1.name}","#{x}","#{weight}kg","#{reps}"]
end


while continue=="yes"
puts "Do you want to continue to exercise? Yes/No"
continue=gets.chomp.downcase
if continue=="yes"
    puts "Enter exercise"
    x=0
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
    rows << ["#{exercise1.name}","#{x}","#{weight}kg","#{reps}"]
    end  
elsif continue=="no"
    puts "Thanks for using the app!"
    end
end

table = Terminal::Table.new :headings => ['Exercise', 'Set', 'Weight', 'Reps'], :title => "Exercise Log", :alignment => :center , :rows => rows
puts table


