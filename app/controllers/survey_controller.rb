class SurveyController < ApplicationController
  def create
  end
	
	def validate_survey
		@survey = Survey.new(params[:userform])
		@user = User.find(:first,:conditions => ["username = ?", session[:user_id]])
		@user.surveys << @survey
		
		if @survey.save
			session[:survey_title] = @survey.title
			redirect_to :action => 'addquestion'
		else
			redirect_to :action => 'create'
		end
	end

  def list
		@survey = Survey.find(:all, :conditions => ["published = ?", 1])
  end

  def view
		@survey = Survey.find(:first, :conditions => ["title = ?", params[:survey_title]])
		if @survey.published == 0
			session[:survey_title] = params[:survey_title]
			redirect_to :action => "addquestion"
		end
		@counter = 0
  end

	def publish
		@survey = Survey.find(:first, :conditions => ["title = ?", params[:survey_title]])
		@survey.update_attributes(:published => 1)
		redirect_to :controller => "account", :action => "myaccount"
	end
	
	def addquestion
		@counter = 0
		@question = Question.new(params[:userform])
		@survey = Survey.find(:first, :conditions => ["title = ?", session[:survey_title]])
		
		if !params[:choice].blank? and !@question.description.blank?

			@survey.questions << @question
			if @question.save
				@choice = Choice.new()
				@choice.description = params[:choice]
				@question.choices << @choice
				if @choice.save
					redirect_to :action => 'addquestion'
				end
			end
		end
	end

end
