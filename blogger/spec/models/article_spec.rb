require 'spec_helper'

describe Article do

  describe "#tag_list" do
    it "should have the method" do
      subject.should respond_to :tag_list
    end

    shared_examples "the correct tag list" do
      it "should return the tag in the tag list" do
        given.each {|tag_name| subject.tags.build name: tag_name }
        subject.tag_list.should eq expected
      end
    end

    context "when the article has one tag" do
      let(:given) { [ "First Tag" ] }
      let(:expected) { "First Tag" }

      it_behaves_like "the correct tag list"
    end

    context "when the article has two tags" do

      let(:given) { [ "First Tag", "Second Tag" ] }
      let(:expected) { "First Tag, Second Tag" }

      it "should return the two tags in the tag list" do
        given.each {|tag_name| subject.tags.build name: tag_name }
        subject.tag_list.should eq expected
      end
    end

  end

  it "should have comments" do
    subject.should respond_to :comments
  end

  context "when building a comment" do
    it "should have a comment" do
      comment = subject.comments.build author: "Frank", body: "My Comment"
      expect(subject.comments.length).to eq 1
      expect(subject.comments.first.author).to eq comment.author
    end
  end

  it "should have taggings" do
    subject.should respond_to :taggings
  end

  it "should have tags" do
    subject.should respond_to :tags
  end

end