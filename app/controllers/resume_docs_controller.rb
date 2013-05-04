class ResumeDocsController < ApplicationController
  # GET /resume_docs
  # GET /resume_docs.json
  def index
    @resume_docs = ResumeDoc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resume_docs }
    end
  end

  # GET /resume_docs/1
  # GET /resume_docs/1.json
  def show
    @resume_doc = ResumeDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resume_doc }
    end
  end

  # GET /resume_docs/new
  # GET /resume_docs/new.json
  def new
    @resume_doc = ResumeDoc.new
    @resume_doc.private_guid = "RR"+(0...15).map{65.+(rand(25)).chr}.join

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume_doc }
    end
  end

  # GET /resume_docs/1/edit
  def edit
    @resume_doc = ResumeDoc.find(params[:id])
  end

  # POST /resume_docs
  # POST /resume_docs.json
  def create
    @resume_doc = ResumeDoc.new(params[:resume_doc])

    respond_to do |format|
      if @resume_doc.save
        format.html { redirect_to @resume_doc, notice: 'Resume doc was successfully created.' }
        format.json { render json: @resume_doc, status: :created, location: @resume_doc }
      else
        format.html { render action: "new" }
        format.json { render json: @resume_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resume_docs/1
  # PUT /resume_docs/1.json
  def update
    @resume_doc = ResumeDoc.find(params[:id])

    respond_to do |format|
      if @resume_doc.update_attributes(params[:resume_doc])
        format.html { redirect_to @resume_doc, notice: 'Resume doc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_docs/1
  # DELETE /resume_docs/1.json
  def destroy
    @resume_doc = ResumeDoc.find(params[:id])
    @resume_doc.destroy

    respond_to do |format|
      format.html { redirect_to resume_docs_url }
      format.json { head :no_content }
    end
  end
  
  # PUT /resume_docs/1
  # PUT /resume_docs/1.json
  def ajax_set_safe_html
    @resume_doc = ResumeDoc.find(params[:id])

    @resume_doc.safe_resume_html = params[:html]
    @resume_doc.save
  	respond_to do |format|
			format.js
	  end
  end
  
  def ajax_add_note
  	if params[:id]
	  	@resume_feedback = ResumeFeedback.find(params[:id])
  	end
  	if @resume_feedback == nil
  		@resume_feedback = ResumeFeedback.new()
  	end
  	@resume_feedback.resume_doc_guid = params[:private_guid]
		@resume_feedback.name = params[:poster_name]
		@resume_feedback.feedback_type = 'note'
		@resume_feedback.note = params[:note]
		@resume_feedback.bid = params[:bid]
		@resume_feedback.json_data = params[:json_data]
		@resume_feedback.save

  	respond_to do |format|
			format.js
	  end
  end
  
  def ajax_add_annotation
  	if params[:id]
	  	@resume_feedback = ResumeFeedback.find(params[:id])
  	end
  	if @resume_feedback == nil
  		@resume_feedback = ResumeFeedback.new()
  	end
  	@resume_feedback.resume_doc_guid = params[:private_guid]
		@resume_feedback.name = params[:poster_name]
		@resume_feedback.feedback_type = 'annotation'
		@resume_feedback.note = params[:note]
		@resume_feedback.bid = params[:bid]
		@resume_feedback.json_data = params[:json_data]
		@resume_feedback.save

  	respond_to do |format|
			format.js
	  end
  end
  
  def ajax_get_feedback
  	private_guid = params[:guid]
  	@feedback = {}
  	
		if !private_guid.blank?
			feedbacks = ResumeFeedback.where(:resume_doc_guid => private_guid)
		
			feedbacks.each do |f|
				if @feedback[f.bid]
					@feedback[f.bid] << f
				else
					@feedback[f.bid] = [f]
				end
			end
		end
		
  	resp = {}
		resp["html"] = render_to_string(:action => "feedback", :layout => false, :locals=>{:feedback => @feedback})
		render :json => resp.to_json, :callback => params[:callback]
  end
  
  def ajax_get_skills
  	private_guid = params[:guid]
  	skills = SkillSuggestion.find_all_by_resume_doc_guid(private_guid) 	
		
  	resp = {}
		resp["html"] = render_to_string(:action => "skills", :layout => false, :locals=>{:skills => skills})
		render :json => resp.to_json, :callback => params[:callback]
  end
  
end
