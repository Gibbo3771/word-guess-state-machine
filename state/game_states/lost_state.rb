require_relative('../../pretty_printer')
require_relative('../render_state')
require_relative('./play_again_state')

class LostState < RenderState

    def pre_enter(state_manager, game)
        clear_terminal()
        add(-> {
            pretty_print("Secret word - #{game.word.unfiltered}")
        })
        add(-> {
            pretty_print("Oh no, you ran out of lifes :(!", 0.075)
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