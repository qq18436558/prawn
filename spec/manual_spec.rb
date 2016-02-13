require "spec_helper"
require "digest/sha2"

RSpec.describe "Manual" do
  it "contains no unexpected changes" do
    ENV["CI"] ||= "true"

    require File.expand_path(File.join(File.dirname(__FILE__), %w[.. manual contents]))
    s = prawn_manual_document.render

    hash = Digest::SHA512.hexdigest(s)

    expect(hash).to eq "5559f6239ea3df7f41d8cc0e85c56f73dfbf1e939df38a8646b21aee33467a706b7b4fd4c084273dcdd7f451bae8b5e91fad84152261bbd1b9beeacfcc9e9c83"
  end
end
