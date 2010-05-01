class Stoppage < ActiveRecord::Base
  has_many :tube_mill_stoppage_reports
  
  #STOPAGE_TYPE = {"Operational" =>'1', "Mechanical" =>'2',"Electrical"=>'3',"Others" =>'4'}
  STOPAGE_TYPE = [["Operational" ,0], 
    ["Mechanical",1],
    ["Electrical",2],
    ["Others" ,3]]
  
end
