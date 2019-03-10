require('./character_library')

class Word

    attr_reader :unfiltered, :filtered
    def initialize()
        @character_library = CharacterLibrary.new()
    end

    def set(word)
        @unfiltered = word.upcase
        @filtered = filter(word)
    end

    def filter(word)
        return word.gsub(/\S/, '*')
    end

    def try_to_match_and_replace(char)
        char.upcase!
        return :tried if @character_library.already_tried?(char)
        @character_library.add_to_library(char)
        found_character_index = @unfiltered.index(char)
        return_code = found_character_index == nil
        while found_character_index != nil do
            @filtered[found_character_index] = char
            found_character_index = @unfiltered.index(char, found_character_index + 1)
        end
        return return_code ? :not_found : :found
    end

    def fully_revealed?
        return !(@filtered.include?("*"))
    end

    def reveal
        @filtered = @filtered.replace(@unfiltered)
    end

end