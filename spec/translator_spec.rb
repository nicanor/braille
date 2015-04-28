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
      expect(translator.call(' ')).to eq('⠀')
    end
  end
end