require_relative '../state/render_state'

class GuessOutcomeState < RenderState

    def initialize(message)
        super
        @message = message
    end

    def pre_enter(state_manager, game)
        super
        clear_terminal()
        add(-> {
            pretty_print("Lifes: #{game.player.get_current_lifes()}")
        })
        add(-> {
            pretty_print("Secret word - #{game.word.filtered}")
        })
        add(-> {
            pretty_print("#{@message}", 0.05)
        })
    end

    def update(state_manager, game)
        super
        sleep 1
        set_exiting()
    end

    def exit(state_manager, game)
        super
    end
end