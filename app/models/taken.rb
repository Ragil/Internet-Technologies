class Taken < ActiveRecord::Base
	belongs_to:survey

	validates_associated :survey, :message => "Taken not attached to a survey."
	validates_presence_of :ip, :message => "IP cannot be empty."
end
