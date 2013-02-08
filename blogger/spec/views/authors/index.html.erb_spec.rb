require 'spec_helper'

describe "authors/index" do
  before(:each) do
    assign(:authors, [
      stub_model(Author,
        :username => "Username",
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      ),
      stub_model(Author,
        :username => "Username",
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      )
    ])
  end

  it "renders a list of authors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
