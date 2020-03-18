require 'sinatra'
require 'sinatra/reloader'

get '/' do
  phrase = params['phrase']
  value = params['value'].to_i
  encrypted = caesar_cipher(phrase, value) if phrase && value
  erb :index, :locals => {:encrypted => encrypted}
end

def caesar_cipher(str, n)
  character_array = str.split("").map {|char| char.ord}
  character_array.each_with_index do |char, index|
      if (97..122).include? char
          if char + n > 122
              character_array[index] = char+n-26
          elsif char + n < 97
              character_array[index] = char+n+26
          else
              character_array[index] = char + n
          end
      elsif (65..90).include? char
          if char + n > 90
              character_array[index] = char+n-26
          elsif char + n < 65
              character_array[index] = char+n+26
          else
              character_array[index] = char + n
          end
      end
  end
  character_array.map{|char| char.chr}.join("")
end