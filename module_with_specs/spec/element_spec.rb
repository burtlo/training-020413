module Element

  def element(name,value)
    define_method name do
      instance_variable_get("@#{name}") || value
    end

    define_method "#{name}=" do |new_value|
      instance_variable_set("@#{name}",new_value)
    end
  end

end

class SpecClass
  extend Element

  element :title, "War and Peace"
  element :author, "Jane Austen"

  # This is essentially what the element macro is building:
  # def title
  #   @title || "War and Peace"
  # end
  #
  # def title=(new_value)
  #   @title = new_value
  # end
end

describe "element macro" do

  let(:subject) { SpecClass.new }

  it "should work" do
    subject.should respond_to :title
    # expect(subject.respond_to?(:title)).to be_true
  end

  let(:expected_title) { "War and Peace" }

  it "has the correct title value" do
    expect(subject.title).to eq expected_title
  end

  it "allows us to set the title" do
    subject.title = "Pride and Prejudice"
    expect(subject.title).to eq "Pride and Prejudice"
  end

  let(:expected_author) { "Jane Austen" }

  it "has the correct default author" do
    expect(subject.author).to eq expected_author
  end
  
  it "allows us to set the author" do
    subject.author = "Malcom X"
    expect(subject.author).to eq "Malcom X"
  end

end