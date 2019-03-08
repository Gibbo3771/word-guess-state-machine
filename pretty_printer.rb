def pretty_print(word, speed=0)
    word.split('').each { |char|
        print char
        sleep speed
    }
    puts
end

def pretty_print_reverse(word, speed=0)
    dismantled = String.new(word)
    word.split('').each { |char|
        system ('clear')
        dismantled.chop!
        print dismantled
        sleep speed
    }
end

def pretty_print_yoyo(word, speed=0, start_printed=true)
    if start_printed
        print word
        pretty_print_reverse(word, speed)
        pretty_print(word, speed)
        return
    end
    pretty_print(word, speed)
    pretty_print_reverse(word, speed)    
end

while true do
sleep 0.5
pretty_print_yoyo("Hello bawbag!", 0.05, true)
sleep 0.5
end