require 'rails_helper'

describe Candidate do

  it { should belong_to :user }
  it { should belong_to :question }
  it { should validate_presence_of :name }
  it { should validate_presence_of :image_path }

end
