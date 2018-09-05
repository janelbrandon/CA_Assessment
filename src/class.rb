# TO define string for error handling of integers and floats
class String
    def numeric?
      Float(self) != nil rescue false
    end
    def is_i?
        /\A[-+]?\d+\z/ === self
    end
end

# To define class for error handling
class NonNumericArgumentError < StandardError
end

class NonIntegerArgumentError < StandardError
end

# Arguments for error handling

def validate_numarg (num)
    raise NonNumericArgumentError, "Please specify a number" if !num.numeric?
    num
end

def validate_intarg (num)
    raise NonIntegerArgumentError, "Please specify a number" if !num.is_i?
    num
end

# Definition of exercise class and methods.
class Exercise
    attr_accessor :name, :sets,:setcount,:rows,:weight,:reps
    # we start with name and sets to initialize the exercise class, it also resets everything if same variable is used.
    def initialize(name,sets)
        @name=name
        @sets=sets
        @setcount=0
        @rows=[]
    end
    def sets
        return @sets
    end
    # method used to get record each weight and reps for each set
    def setcount
            @setcount+=1
            puts "It's now time for Set #{@setcount} of #{@name}"
            begin
                puts "Please enter the weights (in kg) for Set #{@setcount} of #{@name}"
                @weight=gets.chomp
                @weight = validate_numarg(@weight).to_f
            rescue NonNumericArgumentError
                puts "Please put a number for weights! :)"
                retry
            end
            begin
                puts "Start! When you are finished please enter the number of reps you're able to do for Set #{@setcount}"
                @reps=gets.chomp
                @reps = validate_intarg(@reps).to_i
            rescue NonIntegerArgumentError
                puts "Please put a whole number for reps! :)"
            retry
            end
    end
    # method used to push the instance variables name, setcount, weight and reps into the array for the table
    def input
        return ["#{@name}","#{@setcount}","#{@weight}kg","#{@reps}"]
    end
end

# method to display the tables. this uses terminal-table gem, please see terminal-table gem for more documentation
def report(rows)
    current_time = DateTime.now
    time_log = DateTime.now-current_time
    table = Terminal::Table.new :headings => ['Exercise', 'Set', 'Weight', 'Reps'], 
    :title => "Exercise Log #{current_time.strftime "%d/%m/%Y"}",
    :rows => rows
    puts `clear`    
    puts table
end