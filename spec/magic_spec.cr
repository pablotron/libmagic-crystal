require "./spec_helper"

describe Magic do
  # TODO: Write tests

  it "works" do
    magic = Magic::Magic.new
    magic.file(__FILE__).should eq("text/plain; charset=us-ascii")
  end
end
