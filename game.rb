class Game

    attr_reader :game_state_manager
    attr_writer :running, :input
    attr_accessor :player, :word

    @running
    @player
    @word

    def initialize()
        @game_state = :setup
        @drawables = []
        @game_state_manager = StateManager.new(self)
        @game_state_manager.change_state(SetupState.new())

    end

    def update()
        while @running do
            @game_state_manager.update()
        end
    end

end