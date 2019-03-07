require_relative('../state')

class GetInputState < State

    def initialize(validation_func, next_if_valid, next_if_invalid)
        @validation_func = validation_func
        @next_if_invalid = next_if_invalid
        @next_if_valid = next_if_valid
    end

    def update(state_manager, game)
        input = gets.chomp
        @validation_func.call(input) ? state_manager.change_state(@next_if_valid) : state_manager.change_state(@next_if_invalid)
    end

end