class Choice < ActiveRecord::Base
	belongs_to:question

	validates_associated :question, :message => "Choice not attached to a question."
	validates_presence_of :description, :message => "Description cannot be empty."
	
end
