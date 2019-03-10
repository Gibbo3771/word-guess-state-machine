require_relative '../state/render_state'

class PlayAgainState < RenderState

    def initialize()
        super
        @input = nil
    end

    def pre_enter(state_manager, game)
        clear_terminal()
        add(-> {
            pretty_print("Would you like to play again? [y/N]")
            print "> "
        })
    end

    def update(state_manager, game)
        super
        if !valid?()
            state_manager.change_state(GetInputState.new(-> (input) {set_input(input)}))
            return
        end
        puts @input
        sleep 2
        if @input == "y"
            state_manager.clean_up_states()
            state_manager.change_state(SetupState.new())
        elsif @input == "n"
            state_manager.clean_up_states()
            game.running = false
            set_exiting()
        end
    end

    def set_input(input)
        @input = input.downcase()
    end

    def valid?()
        return false if @input == nil
        return true if @input == "y" || @input == "n"
        return false
    end

end