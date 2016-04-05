include WorksheetsHelper
class WorksheetsController < ApplicationController
  
  def new
    @worksheet = Worksheet.new
    @value = @worksheet.values.build
    @temporary_worksheet_code = (0...23).map { (65 + rand(26)).chr }.join
    session[:temporary_worksheet_code] = @temporary_worksheet_code
  end
  
  def edit
    @worksheet = Worksheet.find(params[:id])
    
    # badly coded security feature
    @worksheet_does_not_match = true
    if params[:twc] == @worksheet.temporary_worksheet_code || session[:temporary_worksheet_code] == @worksheet.temporary_worksheet_code
      @worksheet_does_not_match = false
    end
    
    if @worksheet_does_not_match
      flash[:error] = "Uh oh, you're looking for an expired worksheet!"
      redirect_to root_path
    end
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
      
      @stakeholder = @worksheet.stakeholders.build
      redirect_to new_worksheet_stakeholder_path(@worksheet, @stakeholder)
    else
      render 'new'
    end
  end
  
  def update
    @worksheet = Worksheet.find(params[:id])
    @worksheet.update_attributes(worksheet_params)
    
    if @worksheet.save
      redirect_to worksheet_path(@worksheet)
    else
      render 'edit'  
    end
    
  end
  
  def process_gateway
    
  end

  def index
  end
  
  def show
    
    @worksheet = Worksheet.find(params[:id])
    @antifragility_score = calculate_antifragility_score(@worksheet)
    
    #help the view!
    @red_result = "red_result" if @antifragility_score < -3
    @yellow_result = "yellow_result" if @antifragility_score > -4 && @antifragility_score < 4 
    @green_result = "green_result" if @antifragility_score > 3
    
    # badly coded security feature
    @worksheet_does_not_match = true
    if params[:twc] == @worksheet.temporary_worksheet_code || session[:temporary_worksheet_code] == @worksheet.temporary_worksheet_code
      @worksheet_does_not_match = false
    end
    
    if @worksheet_does_not_match
      flash[:error] = "Uh oh, you're looking for an expired worksheet!"
      redirect_to root_path
    end
    
  end
  
  private
  
    def worksheet_params
      params.require(:worksheet).permit(:change_needed, :temporary_worksheet_code, :elephant1, :elephant2, :responsible1, :responsible2, :independent1, :independent2, :develop1, :develop2, :reflection1, :reflection2, :antifragile, :permission_to_contact, :email)
    end
    

end
