class StakeholdersController < ApplicationController

  def new
    @worksheet = Worksheet.find(params[:worksheet_id])
    @stakeholder = @worksheet.stakeholders.build
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
