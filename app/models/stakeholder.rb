class Stakeholder < ActiveRecord::Base
  belongs_to :worksheet
  
  has_many :loyalties
  
end
