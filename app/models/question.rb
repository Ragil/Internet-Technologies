class Question < ActiveRecord::Base
	belongs_to:survey
	has_many:questions
	has_many:choices
end
