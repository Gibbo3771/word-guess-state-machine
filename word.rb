class Word

    attr_reader :word, :filtered
    def initialize(word)
        @word = word.upcase
        @filtered = filter(word)
    end

    def filter(word)
        return word.gsub(/\S/, '*')
    end

    def try_to_match(char)
        char.upcase!
        found_character_index = @word.index(char)
        while found_character_index != nil do
            @filtered[found_character_index] = char
            found_character_index = @word.index(char, found_character_index + 1)
        end
    end

    def fully_revealed?
        return @filtered.include?("*")
    end

end