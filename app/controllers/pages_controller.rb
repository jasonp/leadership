class PagesController < ApplicationController
  def index
  end
  
  def gateway
    twc = session[:temporary_worksheet_code]
    @worksheet = Worksheet.where(temporary_worksheet_code: twc).first
    
    
  end
  
end
