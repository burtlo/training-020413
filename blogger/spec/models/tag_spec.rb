require 'spec_helper'

describe Tag do
  
  it "should have taggings" do
    subject.should respond_to :taggings
  end

  it "should have articles" do
    subject.should respond_to :articles
  end
  
end
