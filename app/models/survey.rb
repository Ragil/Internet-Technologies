class Survey < ActiveRecord::Base
	belongs_to:user
	has_many:questions
	has_many:takens

	validates_associated :user, :message => "Not associated to a user."
	validates_presence_of :title, :message => "Title cannot be empty."
	validates_length_of :title, :minimum => 1, :message => "Title cannot be empty."
	validates_uniqueness_of :title, :message => "Survey with the same title already exist."
end
