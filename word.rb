require('./character_library')

class Word

    attr_reader :word, :filtered
    def initialize()
        @character_library = CharacterLibrary.new()
    end

    def set(word)
        @word = word.upcase
        @filtered = filter(word)
    end

    def filter(word)
        return word.gsub(/\S/, '*')
    end

    def try_to_match_and_replace(char)
        char.upcase!
        return :guess_already_tried if @character_library.already_tried?(char)
        @character_library.add_to_library(char)
        found_character_index = @word.index(char)
        did_find = found_character_index != nil ? :found : :not_found
        while found_character_index != nil do
            @filtered[found_character_index] = char
            found_character_index = @word.index(char, found_character_index + 1)
        end
        return did_find
    end

    def fully_revealed?
        return !(@filtered.include?("*"))
    end

    def reveal
        @filtered = @filtered.replace(@word)
    end

end