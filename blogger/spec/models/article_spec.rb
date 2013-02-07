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

    context "when the article has no tags" do
      let(:given) { [ ] }
      let(:expected) { "" }

      it_behaves_like "the correct tag list"
    end

    context "when the article has one tag" do
      let(:given) { [ "First Tag" ] }
      let(:expected) { "First Tag" }

      it_behaves_like "the correct tag list"
    end

    context "when the article has two tags" do
      let(:given) { [ "First Tag", "Second Tag" ] }
      let(:expected) { "First Tag, Second Tag" }

      it_behaves_like "the correct tag list"
    end

  end

  describe "#tag_list=" do
    context "when given an empty string" do
      it "should have one tag" do
        subject.tag_list = ""
        expect(subject.tags.length).to eq 0
      end
    end
    context "when given a string with one tag" do
      it "should have one tag" do
        subject.tag_list = "First Tag"
        expect(subject.tags.length).to eq 1
        expect(subject.tags.first.name).to eq "First Tag"
      end
    end

    context "when the article already has the tag provided" do
      it "should not add the new tag" do
        subject.tags.build name: "First Tag"
        subject.tag_list = "First Tag"
        expect(subject.tags.length).to eq 1
        expect(subject.tags.first.name).to eq "First Tag"
      end
    end

    context "when a tag is already defined in the database" do
      it "should not create a new tag with the same name" do
        first_tag = Tag.create name: "First Tag"
        subject.tag_list = "First Tag"
        expect(subject.tags.first.name).to eq "First Tag"
        expect(subject.tags.first).to eq first_tag
      end
    end

    context "when given a string with two tag" do
      it "should have two tags" do
        subject.tag_list = "First Tag, Second Tag"
        expect(subject.tags.length).to eq 2

        tag_names = subject.tags.map { |tag| tag.name }.sort
        expect(tag_names).to eq [ "First Tag", "Second Tag" ]
      end

      context "when there are two similar tags" do
        it "should have one tag" do
          subject.tag_list = "First Tag, First Tag"
          expect(subject.tags.length).to eq 1
          expect(subject.tags.first.name).to eq "First Tag"
        end
      end

      context "when the article already has a list of tags" do
        context "when the article is given a smaller list of tags" do
          it "should update the list of tags to be the smaller list of tags" do
            subject.tag_list = "First Tag, Second Tag, Third Tag"
            subject.tag_list = "Second Tag"
            expect(subject.tags.length).to eq 1
            expect(subject.tags.first.name).to eq "Second Tag"
          end
        end
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