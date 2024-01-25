require_relative '../lib/mairie_christmas'

describe "the get_townhall_urls method" do
  it "should return an array of hash" do
      expect(get_townhall_urls).not_to be_nil
      expect(get_townhall_urls).to be_a(Array)
      expect(get_townhall_urls.length).to be > 10
  end

  it "should contain some URLs present in the array" do 
      expect(get_townhall_urls).to include("http://annuaire-des-mairies.com/95/arthies.html")
      expect(get_townhall_urls).to include("http://annuaire-des-mairies.com/95/wy-dit-joli-village.html")
  end
end