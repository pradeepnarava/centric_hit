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
  def slitting_show
    scrap=0
    @scrap=[]
   @slitting_value = Slitting.find(:all,:conditions => ["rawmaterial_id=#{params[:id]}"])
   @slitting_value.each do |obj|
     scrap=scrap + obj.scrap.to_i
   end
   @scrap[0]=scrap
   render :layout=>false
  end
  def slitting_production_rpt
   #@raw=Rawmaterial.find :all
  end
  
  def slitting_production_show
    @slitting_prod=Slittingproduction.find(params[:id])
    @slitting_prod_details=Slittingproduction.find(:all,:conditions=>["rawmaterial_id=#{params[:raw_id]}"])
    render :layout=>false
  end
  
  def slitting_production_show_rpt
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
    @coils = Slittingproduction.all.collect { |sl| sl.rawmaterial}.uniq
   @slitting_pro=Slittingproduction.find :all
  end
  def uncoiler_rpt
    @slitting_pro=Slittingproduction.find :all
    @slitting_prooduction=Slittingproduction.find_by_id(params[:report][:slittingproduction_id])
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    conditions_hash = {:date_start => start_date,:date_end =>end_date} if start_date!='' && end_date!=''
    search = "STR_TO_DATE(created_at,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    @uncoiler_value = UncoilerReport.find(:all, :conditions => [search,conditions_hash], :group => 'date')
    #@uncoiler_value.each do  |obj|
      #obj.slittingproduction.group_by(&:raw)
    #end
  end
  
  def uncoiler_show
    @uncoiler=UncoilerReport.find(params[:id])
#    @uncoiler_details=UncoilerReport.find(:all,:conditions=>"STR_TO_DATE(date,'%Y-%m-%d')=#{params[:created_date].to_date})
    @uncoiler_details=UncoilerReport.all
    @uncoiler_details.select do |obj|
      obj.created_at == params[:created_date].to_date
    end
    render :layout=>false
  end

  def delivery
    @delivery=Deliverychallan.find :all
  end
  
  def delivery_rpt
    @delivery_all=Deliverychallan.find :all
    @delivery=Deliverychallan.find_by_id(params[:report][:deliverychallan_id])
    @address=Taxinvoice.find_by_deliverychallan_id(params[:report][:deliverychallan_id])
    render :layout=>false
  end
  
  def taxinvoice_new
    @customer = Taxinvoice.find(:all,:group => 'customer_id')
  end
  
  def taxinvoice_show
    
    @customer = Taxinvoice.find(:all,:group => 'customer_id')
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    conditions_hash = {:customer_id => params[:report][:customer_id]}
    conditions_hash = {:date_start => start_date,:date_end =>end_date} if start_date!='' && end_date!=''
    search = 'customer_id = :customer_id'
    search += " AND STR_TO_DATE(tc_date,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    @taxinvoice_value = Taxinvoice.find(:all, :conditions => [search,conditions_hash])
    
  end
  
  def taxinvoice_rpt
    @tax_invoice = Taxinvoice.find(:all,:conditions=>["invoice_no=#{params[:invoice_id].to_i}"],:group => 'invoice_no')
    render :layout=>false;
  end
  
  def pre_despatch
    @customer = Predespatchtc.find(:all,:group => 'customer_id')
  end
  
  def pre_despatch_rpt
    @customer = Predespatchtc.find(:all,:group => 'customer_id')
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    conditions_hash = {:customer_id => params[:report][:customer_id]}
    conditions_hash = {:date_start => start_date,:date_end =>end_date} if start_date!='' && end_date!=''
    search = 'customer_id = :customer_id'
    search += " AND STR_TO_DATE(tc_date,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    @predespatch = Predespatchtc.find(:all, :conditions => [search,conditions_hash])
    
  end
  
  def tube_mill_performance_rpt
    start_date,end_date= duration_dates(params[:report][:dates],params[:start_date],params[:end_date])
    conditions_hash = {:date_start => start_date,:date_end =>end_date} if start_date!='' && end_date!=''
    search = "STR_TO_DATE(created_at,'%Y-%m-%d') Between :date_start AND :date_end" if start_date!='' && end_date!=''
    @tube_mill_performance_reports = TubeMillPerformanceReport.find(:all, :conditions => [search,conditions_hash])
  end
  
  def tubemill_show
    @tube_mill_performance_report = TubeMillPerformanceReport.find(params[:id])
    render :layout=>false;
  end
  
  def pre_despatch_view
    @predespatchtc = Predespatchtc.find(params[:id])
    render :layout=>false
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
