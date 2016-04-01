class ValuesController < ApplicationController

  def create
     
  end


  private

    def value_params
      params.require(:value).permit(:content)
    end

end
