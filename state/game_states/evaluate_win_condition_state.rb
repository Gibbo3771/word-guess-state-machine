require_relative('./guess_state')
require_relative('../state')

class EvaluateWinConditionState < State

    def initialize()
        super
    end

    def enter(state_machine, game)
    end

    def update(state_manager, game)
        super
        if game.word.fully_revealed?()
            # Enter win state
        elsif !(game.player.has_lifes?())
            # Enter lose state
        end
        state_manager.change_state(GuessState.new())
    end

    def exit(state_manager, game)
        super
    end
end