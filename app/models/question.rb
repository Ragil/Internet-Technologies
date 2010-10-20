class Question < ActiveRecord::Base
	belongs_to:survey

	validates_associated :survey, :message => "Not attached to a survey."
	
	has_many:answers
	has_many:choices

	validates_presence_of :description, :message => "Description cannot be empty."
	validates_length_of :description, :minimum => 1, :message => "Description cannot be empty."
end
