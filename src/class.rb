class Exercise
    attr_accessor :name, :sets, :weight, :reps
    def initialize(name,sets)
        @name=name
        @sets=sets
    end
    def sets
        return @sets
    end
    # def weight(weight)
    #     @weight=weight
    # end
    # def reps(reps)
    #     @reps=reps
    # end
end