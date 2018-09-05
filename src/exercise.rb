# Definition of exercise class and methods.
class Exercise
    attr_accessor :name, :sets,:setcount,:weight,:reps
    # we start with name and sets to initialize the exercise class, it also resets everything if same variable is used.
    def initialize(name,sets)
        @name=name
        @sets=sets
        @setcount=0
    end
    def sets
        return @sets
    end
    # method used to get record each weight and reps for each set
    def setcount
            @setcount+=1
            if @setcount==1
                puts "When you're ready, you can start with Set #{@setcount} of #{@name} :)"
            else
                puts "Good job on that set!"
                puts "When you're ready, you can start with Set #{@setcount} of #{@name} :)"
            end
            begin
                puts "Please enter the weights (in kg) for this set"
                @weight=gets.chomp
                @weight = validate_numarg(@weight).to_f
            rescue NonNumericArgumentError
                puts
                puts "Please put a number for weights! :)"
                retry
            end
            begin
                puts "Go for it!"
                puts "When you are finished please enter the number of reps you're able to do for this set"
                @reps=gets.chomp
                @reps = validate_intarg(@reps).to_i
            rescue NonIntegerArgumentError
                puts
                puts "Please put a whole number for reps! :)"
            retry
            end
    end
    # method used to push the instance variables name, setcount, weight and reps into the array for the table
    def input
        return ["#{@name}","#{@setcount}","#{@weight}kg","#{@reps}"]
    end
    # this method is to push the data to the history record. display of history is not yet implement in this version.
    def hist_input
        return ["#{DateTime.now.strftime "%d/%m/%Y"}","#{@name}","#{@setcount}","#{@weight}kg","#{@reps}"]
    end
end