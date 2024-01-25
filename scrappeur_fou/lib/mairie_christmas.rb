require 'rspec'
require 'nokogiri'
require 'open-uri'

# Pour récupérer l'email d'une mairie à partir de l'URL d'une mairie
def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))
    town = page.xpath('//html/body/div/main/section[1]/div/div/div/h1').text   # on récup le nom de la ville 
    email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text   # on récup email de la mairie

    complete_array = []    # création d'une array pour tout stocker
    complete_array << {town => email} #  on renvoie un hash contenant nom de ville + email de mairie dans l'array
    puts complete_array
end

# pour récupérer les URLs de chaque ville du Val d'Oise
def get_townhall_urls
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    urls = page.xpath('//*[@class="lientxt"]/@href')    # on récup tous les URLs

    urls_array = []    # création d'une array pour les stocker
    urls.each do |url| 
        url = "http://annuaire-des-mairies.com" + url.text[1..-1]   # on créé une boucle qui affichera chaque URL en version texte.html en partant de l'index 1 jusqu'à -1 (convention quand on ne sait pas combien il y a d'éléments au total)
        urls_array << url        # on renvoie chaque URL correctement écrit dans l'array
    end
    return urls_array
end
# puts get_townhall_urls

def perform     # Dzans cette méthode on va imbriquer les 2 méthodes précédentes
    complete_array = get_townhall_urls 
    complete_array.each do |townhall_url| 
        get_townhall_email(townhall_url)
    end
end 
perform