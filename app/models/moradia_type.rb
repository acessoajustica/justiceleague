class MoradiaType < ActiveRecord::Base
	validates_presence_of :created_at
  	validates_presence_of :updated_at
end
