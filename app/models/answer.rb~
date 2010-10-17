class Answer < ActiveRecord::Base
	belongs_to:question

	validates_associated :question, :message => "Answer not attached to a question."
end
