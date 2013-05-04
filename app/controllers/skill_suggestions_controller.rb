class SkillSuggestionsController < ApplicationController
  # GET /skill_suggestions
  # GET /skill_suggestions.json
  def index
    @skill_suggestions = SkillSuggestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skill_suggestions }
    end
  end

  # GET /skill_suggestions/1
  # GET /skill_suggestions/1.json
  def show
    @skill_suggestion = SkillSuggestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill_suggestion }
    end
  end

  # GET /skill_suggestions/new
  # GET /skill_suggestions/new.json
  def new
    @skill_suggestion = SkillSuggestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill_suggestion }
    end
  end

  # GET /skill_suggestions/1/edit
  def edit
    @skill_suggestion = SkillSuggestion.find(params[:id])
  end

  # POST /skill_suggestions
  # POST /skill_suggestions.json
  def create
    @skill_suggestion = SkillSuggestion.new(params[:skill_suggestion])

    respond_to do |format|
      if @skill_suggestion.save
        format.html { redirect_to @skill_suggestion, notice: 'Skill suggestion was successfully created.' }
        format.json { render json: @skill_suggestion, status: :created, location: @skill_suggestion }
      else
        format.html { render action: "new" }
        format.json { render json: @skill_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skill_suggestions/1
  # PUT /skill_suggestions/1.json
  def update
    @skill_suggestion = SkillSuggestion.find(params[:id])

    respond_to do |format|
      if @skill_suggestion.update_attributes(params[:skill_suggestion])
        format.html { redirect_to @skill_suggestion, notice: 'Skill suggestion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_suggestions/1
  # DELETE /skill_suggestions/1.json
  def destroy
    @skill_suggestion = SkillSuggestion.find(params[:id])
    @skill_suggestion.destroy

    respond_to do |format|
      format.html { redirect_to skill_suggestions_url }
      format.json { head :no_content }
    end
  end
  
	def ajax_add_skill
		bid = params[:bid]
		guid = params[:private_guid]
		skill = params[:skill]
		skill_suggestion = SkillSuggestion.new(:bid => bid, :resume_doc_guid => guid, :skill => skill)
		skill_suggestion.save();
		render :json => {}.to_json
	end
	
	def ajax_remove_skill
		bid = cookies[:bid]
		id = params[:id]
		skill_suggestion = SkillSuggestion.find_by_id_and_bid(id, bid)
		if skill_suggestion
			skill_suggestion.destroy
		end
		render :json => {}.to_json
	end
end
