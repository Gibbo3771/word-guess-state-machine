class CharacterLibrary

    def initialize
        @characters = []
    end

    def already_tried?(char)
        return @characters.include?(char)
    end

    def add_to_library(char)
        @characters.push(char)
        puts @characters
    end

    def get_characters()
        return Array.new(@characters)
    end

end