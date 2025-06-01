require_relative "../sub_strings"

RSpec.describe "sub-strings" do
  let(:dictionary) { ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] }

  it "Correctly finds sub-strings with one word and basic dictionary" do
    expect(sub_strings("below", dictionary)).to eq({ "below" => 1, "low" => 1 })
  end

  it "Finds sub-strings using a sentence and basic dictionary" do
    expect(sub_strings("Howdy partner, sit down! How's it going?", dictionary)).to eq({ 
      "down" => 1,
      "go" => 1,
      "going" => 1,
      "how" => 2,
      "howdy" => 1,
      "it" => 2,
      "i" => 3,
      "own" => 1,
      "part" => 1,
      "partner" => 1,
      "sit" => 1
    })
  end

  it "Using an empty word and basic dictionary should return an empty hash" do
    expect(sub_strings("", dictionary)).to eq({})
  end

  it "Handles case-insensitive matching correctly" do
    expect(sub_strings("GOing LOW!", dictionary)).to eq({ "go" => 1, "i" => 1, "going" => 1, "low" => 1 })
  end

  it "Returns empty hash when no dictionary words are found" do
    expect(sub_strings("zebra monkey xylophone", dictionary)).to eq({})
  end
end