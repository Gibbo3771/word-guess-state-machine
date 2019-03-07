require_relative('../state')

class ValidateSecretWordState < State

    def initialize(valid_state, invalid_state)
        @input = ""
        @valid_state = valid_state
        @invalid_state = invalid_state
    end

    def update(state_manager, game)
        if valid?()
            game.word.set(@input)
            state_manager.change_state(@valid_state)
        else
            state_manager.change_state(@invalid_state)
        end
    end

    def valid?()
        return @input.length > 0
    end

    def set_input(input)
        @input = input
    end

end