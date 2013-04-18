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
