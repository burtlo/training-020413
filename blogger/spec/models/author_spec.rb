require 'spec_helper'

describe Author do
  context "when validating an author" do
    before do
      subject.valid?
    end

    context "when the username is blank" do
      it "should not be valid" do
        subject.errors[:username].should_not be_empty
        expect(subject.errors[:username]).to_not be_empty
      end
    end
  end
end
