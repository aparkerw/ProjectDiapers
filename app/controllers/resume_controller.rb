class ResumeController < ApplicationController
	def convert
		require 'RMagick'
		puts "1"
		pdf = Magick::ImageList.new("sample_resume.docx")
		puts "pdf #{pdf.to_json}"
		puts "2"
		thumb = pdf.scale(100, 300)
		puts "3"
		thumb.write "sample_resume.png"
		puts "4"
	end
	
	def critique
		resume_doc_id = params[:id]
		if resume_doc_id
			@resume_doc = ResumeDoc.find(resume_doc_id)
		end
		
		@feedback = {}
		
		if @resume_doc
			feedbacks = ResumeFeedback.where(:resume_doc_guid => @resume_doc.private_guid)
		
			feedbacks.each do |f|
				if @feedback[f.bid]
					@feedback[f.bid] << f
				else
					@feedback[f.bid] = [f]
				end
			end
		end
		
		
		respond_to do |format|
			format.html
		end
	end
	
	def provide_critique
		if cookies[:bid].blank?
			@bid = "BID"+(0...15).map{65.+(rand(25)).chr}.join
			cookies[:bid] = @bid
		else
			@bid = cookies[:bid]
		end
		resume_doc_private_guid = params[:guid]
		if resume_doc_private_guid
			@resume_doc = ResumeDoc.find_by_private_guid(resume_doc_private_guid)
		end
		
		@feedback = {}
		
		if @resume_doc
			feedbacks = ResumeFeedback.where(:resume_doc_guid => @resume_doc.private_guid, :bid => @bid)
		
			feedbacks.each do |f|
				if @feedback[f.bid]
					@feedback[f.bid] << f
				else
					@feedback[f.bid] = [f]
				end
			end
		end
		
		
		respond_to do |format|
			format.html
		end
	end
	
  def same_origin_hook
    respond_to do |format|
	  	format.html { render :layout => nil}
	  end
  end

end
