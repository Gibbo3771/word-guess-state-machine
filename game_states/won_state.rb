require_relative '../state/render_state'

class WonState < RenderState

    def pre_enter(state_manager, game)
        clear_terminal()
        add(-> {
            pretty_print("Secret word - #{game.word.filtered}")
        })
        add(-> {
            pretty_print("Yay! You won. Congrats!", 0.075)
            print "> "
        })
    end

    def update(state_manager, game)
        super
        set_exiting()
        sleep 2
        state_manager.change_state(PlayAgainState.new())
    end

end