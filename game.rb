require('./word')

class Game

    attr_reader :running
    def initialize()
        @running = true

        @word = Word.new("Hello World")
        @word.try_to_match("l")
        puts @word.word, @word.filtered

    end

    def update()
        while @running do
            sleep (1.0/60.0)

        end
    end

end