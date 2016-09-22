require 'spec_helper'

describe User do

  before do
    @user = User.new(first_name: "Example User",last_name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  it { should respond_to(:last_name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:email) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password)}

end
