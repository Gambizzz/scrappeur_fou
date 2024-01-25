require_relative '../lib/dark_trader'

describe "the crypto_symbols method" do
  it "should return an array containing some crypto symbols" do
    expect(crypto_symbols).to include("BTC") 
    expect(crypto_symbols).to include("AVAX")
    expect(crypto_symbols).to include("LTC")
  end
end

describe "a coherant array" do
  it "matches two arrays of similar length" do
    expect(crypto_symbols.length).to eq(crypto_values.length)
  end
end

describe "perform method" do
  it "should return a hash" do
  expect(perform()).to be_an_instance_of(Hash)
  end
  it "should not have nil value" do
  expect(perform()).not_to include(nil)
  end
end