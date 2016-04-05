class LoyaltiesController < ApplicationController
  def new
     @worksheet = Worksheet.find(params[:worksheet_id])
     @loyalty = Loyalty.new
     
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
