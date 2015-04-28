module Braille
  class Translator

    def call(group_of_words)
      group_of_words.split(' ').map do |word|
        translate_word(word)
      end.join('⠀')
    end

    def translate_word(word)
      if /\d+/.match(word)
        translate_number(word)
      else
        word.split('').map do |char|
          translate_character(char)
        end.join
      end
    end

    def translate_number(number_in_letters)
      '⠼' + number_in_letters.tr('1234567890','⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚')
    end

    def translate_character(character)
      case character
      when ('a'..'z')             then character.tr('abcdefghijklmnopqrstuvwxyz', '⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚⠅⠇⠍⠝⠕⠏⠟⠗⠎⠞⠥⠧⠺⠭⠽⠵')
      when ('A'..'Z')             then '⠨' + translate_character(character.downcase)
      when /á|é|í|ó|ú|ü|ñ/        then character.tr('áéíóúüñ','⠷⠮⠌⠬⠾⠳⠻')
      when /.|;|¡|!|:|"|\'|(|)|-/ then character.tr('.;¡!:"\'()-','⠄⠆⠖⠖⠒⠦⠦⠣⠜⠤')
      else ''
      end
    end

# ⠁ a, 1    ⠞ t   ⠷ á
# ⠃ b, 2    ⠥ u   ⠮ é
# ⠉ c, 3    ⠧ v   ⠌ í
# ⠙ d, 4    ⠺ w   ⠬ ó
# ⠑ e, 5    ⠭ x   ⠾ ú
# ⠋ f, 6    ⠽ y   ⠳ ü
# ⠛ g, 7    ⠵ z
# ⠓ h, 8    ⠨ Signo de mayúsculas
# ⠊ i, 9    ⠼ Signo de número
# ⠚ j, 0    ⠄ Punto (.) (punto 3)
# ⠅ k   ⠂ Coma (,) (punto 2)
# ⠇ l
# ⠢ Signos de interrogación (¿?)
# ⠍ m   ⠆ Punto y coma (;)
# ⠝ n   ⠖ Signos de exclamación (¡ !)
# ⠻ ñ   ⠒ Dos puntos (:)
# ⠕ o   ⠦ Comillas (de cualquier tipo)
# ⠏ p   ⠣ Abrir paréntesis "("
# ⠟ q   ⠜ Cerrar paréntesis ")"
# ⠗ r   ⠤ Guion (-)
# ⠎ s   ⠀ Espacio (ningún punto)

  end
end