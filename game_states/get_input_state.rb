require_relative '../state/state'

class GetInputState < State

    def initialize(validation)
        @validation = validation
    end

    def update(state_manager, game)
        set_exiting()
        input = gets.chomp
        @validation.call(input)
    end

end