require 'rails_helper'

RSpec.describe User, type: :model do
  [:email, :password, :api_key].each do |attribute|
    it { should validate_presence_of attribute }
  end

  it { should validate_uniqueness_of :email }

  it { should have_secure_password }
end
