class ReposFilesController < ApplicationController
  skip_before_action :verify_authenticity_token, {only: :create}
  def create
  	@file = ReposFile.create(file: params[:image])
  	redirect_to repos_files_path
    if params[:image].present?
      @file = ReposFile.create(file: params[:image])
    else
      @file = ReposFile.create(repos_file_params)
    end
  end
  
  def index
	  @files = ReposFile.all
	  @file = ReposFile.new
    respond_to do |format|
      format.html{}
      format.json{
        render(
          json: @files.map do |v|    
            {
              id: v.id,
              filename: v.file_file_name,
              content_type: v.file_file_name,
              file_size: v.file_file_size,
              thumb_url: v.file.url(:thumb),
              original_url: v.file.url(:original)
            }
          end
        )
      }
    end
    
  end

  def show
    @file = ReposFile.find(params[:id])
  end

  def destroy
    ReposFile.find(params[:id]).destroy
    redirect_to repos_files_path
  end

  private

  def repos_file_params
  	params.require(:repos_file).permit(:file)
	end
end
