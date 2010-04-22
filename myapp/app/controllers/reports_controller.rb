class ReportsController < ApplicationController
  def raw_rpt

  end
  def rawmaterial_rpt
  @rawmaterial = Rawmaterial.find(:all,:conditions=>["status=#{params[:report][:status]}"])
  end
end
