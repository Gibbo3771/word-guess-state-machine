require_relative('./guess_state')
require_relative('./won_state')
require_relative('./lost_state')
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
            set_exiting()
            state_manager.change_state(WonState.new())
        elsif !(game.player.has_lifes?())
            state_manager.change_state(LostState.new())
        else
            state_manager.change_state(GuessState.new())    
        end
    end

    def exit(state_manager, game)
        super
    end
end