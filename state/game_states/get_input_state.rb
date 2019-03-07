require_relative('../state')

class GetInputState < State

    def initialize(validation_state)
        @validation_state = validation_state
    end

    def update(state_manager, game)
        input = gets.chomp
        @validation_state.set_input(input)
        state_manager.change_state(@validation_state)
    end

end