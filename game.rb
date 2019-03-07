require('./word')
require('./player')
require 'date'
require('./pretty_printer')
require('./character_library')

class Game

    attr_reader :running
    def initialize()
        @running = true
        @game_state = :setup
        @player = Player.new("Stephen")
        @input = ""
        @drawables = []
        @first_pretty_print = true
    end

    def update()
        while @running do
            draw()
            case @game_state
            when :setup
                new_game()
            when :guess
                @input, input_valid = get_input()
                if input_valid
                    @game_state = @word.try_to_match_and_replace(@input)
                end
            when :guess_already_tried
                sleep 1.5
                @game_state = :guess
            when :found
                sleep 1.5
                @game_state = :check_win_condition
                @first_pretty_print = false
            when :not_found
                sleep 1.5
                @game_state = :check_win_condition
                @first_pretty_print = false
                @player.decrease_lifes() 
            when :check_win_condition
                if !(@player.has_lifes?())
                    @game_state = :lost
                elsif @word.fully_revealed?()
                    @game_state = :won
                else
                    @game_state = :guess
                end
            when :won
                @input, input_valid = get_input()
                @game_state = @input.upcase() == "Y" ? :setup : :exiting
            when :lost
                @input, input_valid = get_input()
                @game_state = @input.upcase() == "Y" ? :setup : :exiting
            when :exiting
                @running = false
            end
        end
        clear()
    end

    def new_game()
        @input, input_valid = get_input()
        @word = Word.new(@input)
        @game_state = :guess
        @player = Player.new(@player.name)
        first_pretty_print = true
    end

    def get_input()
        i = gets.chomp
        return i, false if i.length == 0 || i.length > 1
        return i, true
    end

    def draw()
        clear()
        display_info() if @game_state != :setup
        # Yuck
        case @game_state
        when :setup
            @drawables.push(-> {
                pretty_print("Enter a secret word:", 0.05)
                print "> "
            })
        when :guess
            @drawables.push(-> {pretty_print("Secret word - #{@word.filtered}", @first_pretty_print ? 0.05 : 0)})
            @drawables.push(-> {
                pretty_print("Guess a letter", 0.05)
                print "> "
            })
        when :guess_already_tried
            @drawables.push(-> {pretty_print("Already tried to guess #{@input}!", 0.05)})
        when :found
            @drawables.push(-> {puts "Secret word - #{@word.filtered}"})
            @drawables.push(-> {pretty_print("Nice!", 0.05)})
        when :not_found
            @drawables.push(-> {pretty_print("Secret word - #{@word.filtered}", @first_pretty_print ? 0.05 : 0)})
            @drawables.push(-> {pretty_print("Oops #{", try again!" if @player.has_lifes?()}", 0.05)})
        when :won
            @drawables.push(-> {pretty_print( "Secret word - #{@word.filtered}", 0.05)})
            @drawables.push(-> {pretty_print( "You won!", 0.05)})
            @drawables.push(-> {
                puts "New game? [y/N]"
                print "> "
            })
        when :lost
            @drawables.push(-> {pretty_print("Secret word - #{@word.word}", 0.08)})
            @drawables.push(-> {pretty_print("You lost :(!", 0.05)})
            @drawables.push(-> {
                pretty_print("New game? [y/N]", 0.05)
                print "> "
            })
        end
        for drawable in @drawables do
            drawable.call()
        end
        @drawables.clear()
    end

    def display_info
        @drawables.push(-> {
            pretty_print("Lives: #{@player.get_total_lifes()}", 0)
        })
        
    end

    def clear()
        system('clear')
    end

end