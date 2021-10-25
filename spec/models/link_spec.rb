require 'rails_helper'

RSpec.describe Link, :type => :model do

  it "is not valid without url" do
    expect(Link.new(url: nil)).to_not be_valid
  end

  it "is not valid without protocal" do
    expect(Link.new(url: "www.google.com")).to_not be_valid
  end

  it "is not valid more than 255 character length" do
    expect(Link.new(url: "www.google.com/dshfjkdhfjkdhfjdsfisfewiureuwireuwr")).to_not be_valid
  end

  subject { described_class.new }

  it "is not valid with same slug length should be more than 3" do
    subject.url = "https://www.google.com"
    subject.slug = "sl"
    expect(subject).to_not be_valid
  end

  it "is valid with valid attributes" do
    subject.url = "https://www.google.com"
    subject.slug = "slug1"
    expect(subject).to be_valid
  end


end
