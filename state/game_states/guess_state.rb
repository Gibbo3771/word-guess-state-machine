require_relative('../render_state')
require_relative('./guess_outcome_state')

class GuessState < RenderState

    def initialize()
        super
        @input = nil
        # puts "input - #{@input}"
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
            pretty_print("Guess a letter", 0.05)
            print "> "
        })
    end

    def update(state_manager, game)
        super
        if valid?(game)
            puts @input
            word = game.word
            return_code = word.try_to_match_and_replace(@input)
            case return_code
            when :not_found
                state_manager.change_state(GuessOutcomeState.new("Oops! Didn't find the letter #{@input}."))
                game.player.decrease_lifes()
            when :found
                state_manager.change_state(GuessOutcomeState.new("Nice! Found #{@input}."))
            when :tried
                state_manager.change_state(GuessOutcomeState.new("You already tried #{@input}, duh."))
            end
            set_exiting()
            return
        end
        @input = nil
        state_manager.change_state(GetInputState.new(-> (input) {set_input(input)}))
    end

    def destroy(state_machine, game)
    end

    def set_input(input)
        @input = input
    end

    def valid?(game)
        return false if @input == nil
        return @input.length == 1
    end

end