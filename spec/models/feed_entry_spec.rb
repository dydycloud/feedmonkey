require 'spec_helper'

describe FeedEntry do
  it "has a valid factory" do
    expect(FactoryGirl.build(:feed_entry)).to be_valid
  end

  it "is valid with a name and a url" do
  	expect(FactoryGirl.build(:feed_entry, name: 'feed',url: 'http://www.google.com')).to be_valid
  end

  it "is invalid without a name" do
  	expect(FactoryGirl.build(:feed_entry, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a url" do 
  	expect(FactoryGirl.build(:feed_entry, url: nil)).to have(2).errors_on(:url)
  end

  it "is invalid without a valid url" do
  	expect(FactoryGirl.build(:feed_entry, url: 'myString')).to_not be_valid 
  end
end
