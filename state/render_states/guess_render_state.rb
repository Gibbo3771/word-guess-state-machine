require_relative('./render_state')
require_relative('../game_states/guess_state')

class GuessRenderState < RenderState

    def enter(state_manager, game)
        super(state_manager, game)
        add(-> {
            pretty_print("Secret word - #{game.word.filtered}", 0.05)
        })
        add(-> {
            pretty_print("Guess a letter", 0.05)
            print "> "
        })
    end

    def update(state_manager, game)
        clear()
        super(state_manager, game)
        state_manager.change_state(GuessState.new("Stephen"))
    end

end