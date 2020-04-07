require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    subject {
      described_class.new(:name => "bobby", :email => "bobby@email.com", :password => "password", :password_confirmation => "password")
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without mismatching password" do
      subject.password_confirmation = "notPassword"
      expect(subject).to_not be_valid
    end

    it "is not valid when emails are identical" do 
      described_class.create(:name => "uno", :email => "bobby@email.com", :password => "password", :password_confirmation => "password")
      expect(subject).to_not be_valid
    end

    it "is not valid when the password is less than 3 characters in length" do 
      subject.password = "qw"
      subject.password_confirmation = "qw"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end


    describe '.authenticate_with_credentials' do
      # examples for this class method here
      it "it passes if email and password match" do
        user = User.create(:name => "bobby", :email => "bobby@email.com", :password => "password", :password_confirmation => "password")
        @authUser = User.authenticate_with_credentials("bobby@email.com", "password")
        expect(@authUser).to_not be_nil
      end

      it "it passes if there are space before and after the email and doesn't matter the case of the email" do
        user = User.create(:name => "bobby", :email => "bobby@email.com", :password => "password", :password_confirmation => "password")
        @authUser = User.authenticate_with_credentials(" boBBy@email.com ", "password")
        expect(@authUser).to_not be_nil
      end

    end




  end
end
