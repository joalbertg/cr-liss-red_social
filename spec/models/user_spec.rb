require 'rails_helper'

# the tests are defined by expectations

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_length_of(:username).is_at_least(3).is_at_most(12) }

  describe "#validate_username_regex" do
    it "should not allow username with numbers at the beginning" do
      user = User.new(email:'lisset2@gmail.com', password: '123456', username: '9asda')
      expect(user.valid?).to be_falsy
    end

    it "should not contain special characters" do
      user = User.new(email:'lisset2@gmail.com', password: '123456', username: 'liss**')
      expect(user.valid?).to be_falsy
    end
  end
end
