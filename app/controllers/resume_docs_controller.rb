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
end
