class Worksheet < ActiveRecord::Base
  
  has_many :values
  has_many :stakeholders
end
