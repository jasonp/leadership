class WorksheetsController < ApplicationController
  def new
    @worksheet = Worksheet.new
  end
  
  def create
    @worksheet = Worksheet.new(worksheet_params)
    
    if @worksheet.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def index
  end
  
  private
  
    def worksheet_params
      params.require(:worksheet).permit(:change_needed)
    end
end
