class WorksheetsController < ApplicationController
  def new
    @worksheet = Worksheet.new
    @value = @worksheet.values.build
    @temporary_worksheet_code = (0...18).map { (65 + rand(26)).chr }.join
  end
  
  def create
    @worksheet = Worksheet.new(worksheet_params)
    @temporary_worksheet_code = params[:worksheet][:temporary_worksheet_code]
    
    if @worksheet.save
      @values = Value.where(temporary_worksheet_code: @temporary_worksheet_code)
      @values.each do |v|
        v.worksheet_id = @worksheet.id
        v.save
      end
      
      redirect_to worksheet_path(@worksheet)
    else
      render 'new'
    end
  end

  def index
  end
  
  def show
    @worksheet = Worksheet.find(params[:id])
  end
  
  private
  
    def worksheet_params
      params.require(:worksheet).permit(:change_needed, :temporary_worksheet_code)
    end
end
