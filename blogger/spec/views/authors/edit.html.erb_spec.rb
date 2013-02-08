require 'spec_helper'

describe "authors/edit" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :username => "MyString",
      :email => "MyString",
      :crypted_password => "MyString",
      :salt => "MyString"
    ))
  end

  it "renders the edit author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => authors_path(@author), :method => "post" do
      assert_select "input#author_username", :name => "author[username]"
      assert_select "input#author_email", :name => "author[email]"
      assert_select "input#author_crypted_password", :name => "author[crypted_password]"
      assert_select "input#author_salt", :name => "author[salt]"
    end
  end
end
