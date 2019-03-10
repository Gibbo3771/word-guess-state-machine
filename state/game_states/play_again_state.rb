require_relative('../../pretty_printer')
require_relative('../render_state')
require_relative('./get_input_state')

class PlayAgainState < RenderState

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
        state_manager.clean_up_states()
        if @input == "y"
            state_manager.change_state(SetupState.new("Stephen"))
        elsif @input == "n"
            game.running = false
        end
    end

    def set_input(input)
        @input = input.downcase()
    end

    def valid?()
        return if @input == nil
        return true if @input == "y" || @input == "n"
        return false
    end

end