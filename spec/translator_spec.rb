# encoding: utf-8
require 'spec_helper'

#⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚⠅⠇⠍⠝⠕⠏⠟⠗⠎⠞⠥⠧⠺⠭⠽⠵
describe Braille::Translator do
  describe ".call" do
    it "changes 'a' to '⠁'" do
      translator = Braille::Translator.new
      expect(translator.call('a')).to eq('⠁')
    end

    it "translates all letters" do
      translator = Braille::Translator.new
      expect(translator.call('abcdefghijklmnopqrstuvwxyz')).to eq('⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚⠅⠇⠍⠝⠕⠏⠟⠗⠎⠞⠥⠧⠺⠭⠽⠵')
    end

    it "translates upcased letters" do
      translator = Braille::Translator.new
      expect(translator.call('ABCDEFGHIJKLMNOPQRSTUVWXYZ')).to eq('⠨⠁⠨⠃⠨⠉⠨⠙⠨⠑⠨⠋⠨⠛⠨⠓⠨⠊⠨⠚⠨⠅⠨⠇⠨⠍⠨⠝⠨⠕⠨⠏⠨⠟⠨⠗⠨⠎⠨⠞⠨⠥⠨⠧⠨⠺⠨⠭⠨⠽⠨⠵')
    end

    it "translates spaces" do
      translator = Braille::Translator.new
      expect(translator.call('a a')).to eq('⠁⠀⠁')
    end

    it "translates strange characters" do
      translator = Braille::Translator.new
      expect(translator.call('áéíóúüñ')).to eq('⠷⠮⠌⠬⠾⠳⠻')
    end

    it "translates numbers" do
      translator = Braille::Translator.new
      expect(translator.call('1234567890')).to eq('⠼⠁⠃⠉⠙⠑⠋⠛⠓⠊⠚')
    end

    it "translates wrong stuff" do
      translator = Braille::Translator.new
      expect(translator.call('Hola   amigo')).to eq('⠨⠓⠕⠇⠁⠀⠁⠍⠊⠛⠕')
    end

    it "translates punctuation signs" do
      translator = Braille::Translator.new
      expect(translator.call('.;¡!:"\'()-')).to eq('⠄⠆⠖⠖⠒⠦⠦⠣⠜⠤')
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