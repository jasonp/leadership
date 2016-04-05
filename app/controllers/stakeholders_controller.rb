class StakeholdersController < ApplicationController

  def new
    @worksheet = Worksheet.find(params[:worksheet_id])
    @stakeholder = @worksheet.stakeholders.build
    
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
    @stake = Stakeholder.new(stakeholder_params)
    @stake.save
    
    @worksheet = Worksheet.find(stakeholder_params[:worksheet_id])

    # create new open stakeholder to replace the one we just closed
    @stakeholder = @worksheet.stakeholders.build

    respond_to do |format|
     format.js
    end
  end
  
  
  private 
  
    def stakeholder_params
      params.require(:stakeholder).permit(:name, :worksheet_id)
    end

end
