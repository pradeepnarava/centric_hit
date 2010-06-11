class ReportsController < ApplicationController
  def raw_rpt

  end
  def rawmaterial_rpt
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    conditions_hash = {:status => params[:report][:status]}
    conditions_hash = conditions_hash.merge({:date_start => start_date,:date_end =>end_date}) if start_date!='' && end_date!=''
    search='status=:status'
    search += " AND STR_TO_DATE(created_at,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    @rawmaterial = Rawmaterial.find(:all, :conditions => [search,conditions_hash])
  end

  def slitting_rpt
   #@raw=Rawmaterial.find :all
  end
  def slitting_show_rpt
    #@raw=Rawmaterial.find :all
    #@raw_material=Rawmaterial.find_by_id(params[:report][:rawmaterial_id])
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    #conditions_hash = {:rawmaterial_id => params[:report][:rawmaterial_id]}
    conditions_hash = {:date_start => start_date,:date_end =>end_date} if start_date!='' && end_date!=''
    #search='rawmaterial_id=:rawmaterial_id'
    search = "STR_TO_DATE(created_at,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    if params[:report][:dates].blank?
      @slitting_value = Slitting.find(:all,:group => "rawmaterial_id")
    else
      @slitting_value = Slitting.find(:all, :conditions => [search,conditions_hash],:group => "rawmaterial_id")
    end
  end
  def slitting_production_rpt
   #@raw=Rawmaterial.find :all
  end
  def slitting_production_show_rpt
    #@raw=Rawmaterial.find :all
    #@raw_material=Rawmaterial.find_by_id(params[:report][:rawmaterial_id])
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    #conditions_hash = {:rawmaterial_id => params[:report][:rawmaterial_id]}
    conditions_hash = {:date_start => start_date,:date_end =>end_date} if start_date!='' && end_date!=''
    #search='rawmaterial_id=:rawmaterial_id'
    search = "STR_TO_DATE(production_date,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    if params[:report][:dates].blank?
      @slitting_value = Slittingproduction.find(:all, :group => 'production_date')
    else
      @slitting_value = Slittingproduction.find(:all, :conditions => [search,conditions_hash], :group => 'production_date')
    end
  end
  def uncol_rpt
   @slitting_pro=Slittingproduction.find :all
  end
  def uncoiler_rpt
    @slitting_pro=Slittingproduction.find :all
    @slitting_prooduction=Slittingproduction.find_by_id(params[:report][:slittingproduction_id])
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    conditions_hash = {:slittingproduction_id => params[:report][:slittingproduction_id]}
    conditions_hash = conditions_hash.merge({:date_start => start_date,:date_end =>end_date}) if start_date!='' && end_date!=''
    search='slittingproduction_id=:slittingproduction_id'
    search += " AND STR_TO_DATE(created_at,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    @uncoiler_value = UncoilerReport.find(:all, :conditions => [search,conditions_hash])
  end
  
  def taxinvoice_rpt
    render :layout=>false;
  end

  def delivery_rpt
    render :layout=>false;
  end

  def duration_dates(parameters,start_date,end_date)
    if parameters == "1months"
      start_date=Date.today.months_ago(1).beginning_of_month
      end_date=Date.today.end_of_month
    elsif parameters == ""
      start_date=""
      end_date=""
    elsif parameters == "3months"
      start_date=Date.today.months_ago(3).beginning_of_month
      end_date=Date.today.end_of_month
    elsif parameters == "6months"
      start_date=Date.today.months_ago(6).beginning_of_month
      end_date=Date.today.end_of_month
    elsif parameters== "12months"
      start_date=Date.today.months_ago(12).beginning_of_month
      end_date=Date.today.end_of_month
    elsif parameters == "9months"
      start_date=Date.today.months_ago(9).beginning_of_month
      end_date=Date.today.end_of_month
    elsif parameters == "2weeks"
      start_date=14.days.ago
      end_date=Date.today
    elsif parameters == "4weeks"
      start_date=28.days.ago
      end_date=Date.today
    elsif parameters == "current_week"
      start_date=Date.today.at_beginning_of_week
      end_date=Date.today.end_of_week
    elsif parameters == 'start_of_year'
      start_date=Date.today.at_beginning_of_year
      end_date=Date.today.end_of_month
    elsif parameters == '5'
      start_date=start_date.to_date.strftime('%Y-%m-%d') if start_date
      end_date=end_date.to_date.strftime('%Y-%m-%d') if end_date
    end
    return start_date,end_date
  end
end
