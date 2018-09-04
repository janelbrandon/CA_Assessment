
class Exercise
    attr_accessor :name, :sets,:setcount,:rows,:weight,:reps,:table
    def initialize(name,sets)
        @name=name
        @sets=sets
        @setcount=0
        @rows=[]
    end
    def sets
        return @sets
    end
    def setcount
        @setcount+=1
        puts "It's now time for Set #{@setcount} of #{@name}"
        puts "Please enter the weights (in kg) for Set #{@setcount} of #{@name}"
        @weight=gets.chomp.to_f
        puts "Start! When you are finished please enter the number of reps you're able to do in this set."
        @reps=gets.chomp.to_i
    end
    def input
        return ["#{@name}","#{@setcount}","#{@weight}kg","#{@reps}"]
    end
end

def report(rows)
    current_time = DateTime.now
    time_log = DateTime.now-current_time
    table = Terminal::Table.new :headings => ['Exercise', 'Set', 'Weight', 'Reps'], 
    :title => "Exercise Log #{current_time.strftime "%d/%m/%Y"}",
    :rows => rows
    puts `clear`    
    puts table
end