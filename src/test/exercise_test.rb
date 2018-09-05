require 'test-unit'
require_relative '../exercise.rb'

class ExerciseTest < Test::Unit::TestCase
    def test_name
        exercise = Exercise.new('Squats',2)
        assert_equal('Squats',exercise.name)
    end
    def test_sets
        exercise = Exercise.new('Squats',2)
        assert_equal(2, exercise.sets)
    end
    def test_input
        exercise = Exercise.new('Squats',2)
        assert_equal(["Squats","0","kg",""], exercise.input)
    end
end

