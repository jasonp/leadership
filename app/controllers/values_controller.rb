class ValuesController < ApplicationController

  def create

    @val = Value.new(value_params)
    @val.save
    @temporary_worksheet_code = params[:value][:temporary_worksheet_code]

    # create new open value to replace the one we just closed
    @value = Value.new

    respond_to do |format|
     format.js
    end
  end


  private

    def value_params
      params.require(:value).permit(:content, :temporary_worksheet_code)
    end

end
