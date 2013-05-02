class ResumeFeedbacksController < ApplicationController
  # GET /resume_feedbacks
  # GET /resume_feedbacks.json
  def index
    @resume_feedbacks = ResumeFeedback.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resume_feedbacks }
    end
  end

  # GET /resume_feedbacks/1
  # GET /resume_feedbacks/1.json
  def show
    @resume_feedback = ResumeFeedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resume_feedback }
    end
  end

  # GET /resume_feedbacks/new
  # GET /resume_feedbacks/new.json
  def new
    @resume_feedback = ResumeFeedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume_feedback }
    end
  end

  # GET /resume_feedbacks/1/edit
  def edit
    @resume_feedback = ResumeFeedback.find(params[:id])
  end

  # POST /resume_feedbacks
  # POST /resume_feedbacks.json
  def create
    @resume_feedback = ResumeFeedback.new(params[:resume_feedback])

    respond_to do |format|
      if @resume_feedback.save
        format.html { redirect_to @resume_feedback, notice: 'Resume feedback was successfully created.' }
        format.json { render json: @resume_feedback, status: :created, location: @resume_feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @resume_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resume_feedbacks/1
  # PUT /resume_feedbacks/1.json
  def update
    @resume_feedback = ResumeFeedback.find(params[:id])

    respond_to do |format|
      if @resume_feedback.update_attributes(params[:resume_feedback])
        format.html { redirect_to @resume_feedback, notice: 'Resume feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_feedbacks/1
  # DELETE /resume_feedbacks/1.json
  def destroy
    @resume_feedback = ResumeFeedback.find(params[:id])
    @resume_feedback.destroy

    respond_to do |format|
      format.html { redirect_to resume_feedbacks_url }
      format.json { head :no_content }
    end
  end
end
