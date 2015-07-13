require 'rails_helper'

describe Question do

  it { should belong_to :user }
  it { should have_many :candidates }
  it { should validate_presence_of :name }
  
end
