require 'rspec'
require 'nokogiri'
require 'open-uri'

$page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

def crypto_symbols
  crypto_symbols_path = $page.xpath('//td[contains(@class, "by__symbol")]') 
  crypto_symbols_array = [] 

  crypto_symbols_path.each do |symbol|    # on va chercher chaque symbole et l'ajouter (<<) dans une array
    crypto_symbols_array << symbol.text    # .text pour récup le texte correspondant
  end
  return crypto_symbols_array
end
# puts crypto_symbols

def crypto_values
  crypto_values_path = $page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span')
  crypto_values_array = []

  crypto_values_path.each do |value|    # on va chercher chaque valeur et l'ajouter (<<) dans une array
    crypto_values_array << value.text.delete("$, ")    # .text pour récup le texte correspondant + .delete("$, ") pour supprimer le $ comme demandé
  end
  return crypto_values_array
end
# puts crypto_values 

def perform
  crypto_hash = Hash[crypto_symbols.zip(crypto_values)]     # on réuni les 2 array dans un hash
  crypto_hash.each{|key,value| puts "#{key} => #{value}"}
end

perform