class ReposFilesController < ApplicationController
  def create
  	@file = ReposFile.create( repos_file_params )

  	redirect_to repos_files_path
  end
  
  def index
	  @files = ReposFile.all
	  @file = ReposFile.new
  end

  private

  def repos_file_params
  	params.require(:repos_file).permit(:file)
	end
end
