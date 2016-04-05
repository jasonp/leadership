class PagesController < ApplicationController
  def index
  end
  
  def gateway
    twc = session[:temporary_worksheet_code]
    @worksheet = Worksheet.where(temporary_worksheet_code: twc).first
    
    
  end
  
  private
  
    def worksheet_params
      params.require(:worksheet).permit(:email, :permission_to_contact)
    end
  
end
