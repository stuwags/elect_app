class Vote < ActiveRecord::Base
  attr_accessible :candidate_id
  belongs_to :voter
  belongs_to :admin
  belongs_to :candidate


	validates_uniqueness_of :voter_id
	validates_presence_of :candidate_id, :voter_id
end
