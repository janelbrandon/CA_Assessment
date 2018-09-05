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