class LoyaltiesController < ApplicationController
  def new
     @worksheet = Worksheet.find(params[:worksheet_id])
     @loyalty = Loyalty.new
  end
  
  def create

    @loy = Loyalty.new(loyalty_params)
    @loy.save

   # create new open loyalty to replace the one we just closed
    @loyalty = Loyalty.new
    
    # identify the stakeholder for the AJAX
    @stakeholder = Stakeholder.find(loyalty_params[:stakeholder_id])

    respond_to do |format|
     format.js
    end
  end


  private

    def loyalty_params
      params.require(:loyalty).permit(:content, :stakeholder_id)
    end
  
  
end
