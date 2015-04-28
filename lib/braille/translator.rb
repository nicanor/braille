module Braille
  class Translator

    #⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚⠅⠇⠍⠝⠕⠏⠟⠗⠎⠞⠥⠧⠺⠭⠽⠵⠀

    def call(word)
      #word.tr('abcdefghijklmnopqrstuvwxyz', '⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚⠅⠇⠍⠝⠕⠏⠟⠗⠎⠞⠥⠧⠺⠭⠽⠵')
      word.split('').map do |char|
        translate_character(char)
      end.join
    end

    def translate_character(character)
      case character
      when ('a'..'z') then character.tr('abcdefghijklmnopqrstuvwxyz', '⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚⠅⠇⠍⠝⠕⠏⠟⠗⠎⠞⠥⠧⠺⠭⠽⠵')
      when ('A'..'Z') then '⠨' + translate_character(character.downcase)
      when ' ' then '⠀'
      else ''
      end
    end

  end
end