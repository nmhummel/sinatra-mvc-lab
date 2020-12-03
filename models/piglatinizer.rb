# Build a PigLatinizer model (in your models directory) that converts a string into pig latin.

class PigLatinizer

    def piglatinize(user_phrase) # i love programming
        user_phrase.split(" ").map{ |word| single_word(word)}.join(" ")
    end

    # word examples: pork, apple, glass, people, spray, I 
    def single_word(user_phrase)
        if user_phrase.downcase.start_with?("a", "e", "i", "o", "u")
            "#{user_phrase}" + "way"
        else
            vowel = user_phrase.split('').find {|v| v == "a" || v == "e" || v == "i" || v == "o" || v == "u"}
            s = StringScanner.new(user_phrase) # makes sure it's a string
            s.scan_until(/[aeiou]/) # scan word until vowel is reached
            "#{vowel}" + "#{s.post_match}" + "#{s.pre_match}" + "ay" # o+rk+p+ay
        end
    end

end