require_relative('../../pretty_printer')
require_relative('../render_state')
require_relative('./get_input_state')
require_relative('./evaluate_win_condition_state')

class EnterSecretState < RenderState

    def initialize()
        super
        @input = nil
    end

    def pre_enter(state_manager, game)
        super
        clear_terminal()
        if !valid?()
            add(-> {
                pretty_print("Enter a secret word:", 0.05)
                print "> "
            })
        end
    end

    def update(state_manager, game)
        super
        if valid?()
            game.word.set(@input)
            set_exiting()
            state_manager.change_state(EvaluateWinConditionState.new())
        else
            @input = nil
            state_manager.change_state(GetInputState.new(-> (input) {set_input(input)}))
        end
    end

    def exit(state_manager, game)
        clear_render_objects()
    end
    
    def set_input(input)
        @input = input
    end

    def valid?()
        return if @input == nil
        return @input.length > 1
    end

end