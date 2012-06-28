class Candidate < ActiveRecord::Base
  attr_accessible :name
  has_many :votes
  has_many :voters, :through => :votes
end
