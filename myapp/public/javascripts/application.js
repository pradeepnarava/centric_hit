var loader = jQuery("<center><img src='/images/loading.gif' /></center>");

function customerdetail(id){
    if(id==""){return false}
    loader.prependTo("#customer_div")
      jQuery.ajax({
       type: "POST",
       url: "/customer_orders/customer_detail",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });   
}

function copyaddress(){
  jQuery('#customer_order_delivery_address').val(jQuery('#customer_order_office_address').val());
  jQuery('#customer_order_ecc_no').val( jQuery('#customer_order_h_ecc_no').val());
  jQuery('#customer_order_vat_no').val( jQuery('#customer_order_h_vat_no').val());
}

function serialdetail(id,row){
    if(id==""){return false}
    loader.prependTo("#customer_div")
      jQuery.ajax({
       type: "POST",
       url: "/customer_orders/serial_detail",
       dataType: 'script',
    data: {
          'id' : id,
          'row' :row
        },
     success: function(){loader.remove();}
     });       
}
function customerserial(id,row){
    if(id==""){return false}
    loader.prependTo("#customer_div")
      jQuery.ajax({
       type: "POST",
       url: "/deliverychallans/serial_detail_delivery",
       dataType: 'script',
    data: {
          'id' : id,
           'row' :row
        },
     success: function(){loader.remove();}
     });
}

function customer_po(id){
    if(id==""){return false}
    loader.prependTo("#customer_div")
      jQuery.ajax({
       type: "POST",
       url: "/deliverychallans/customer_po",
       dataType: 'script',
    data: {
          'id' : id
          
        },
     success: function(){loader.remove();}
     });
}

function total_price(row){ 
    rpkg  = jQuery("#"+row+"_customer_order_rate_per_kilo").val();
    twt  = jQuery("#"+row+"_customer_order_rate_pcs").val();
    jQuery("#"+row+"_customer_order_total_amount").val(rpkg*twt);
}

function total_pcs_mts(row){    
    length= jQuery("#"+row+"_customer_order_h_length").val();
    od  = jQuery("#"+row+"_customer_order_h_od").val();
    mtr  = jQuery("#"+row+"_customer_order_rate_mtr").val();
    thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    i  = ((od-thikness)*thikness)/40549;  
    jQuery("#"+row+"_customer_order_rate_pcs").val(Number(mtr*length).toFixed(3));
    jQuery("#"+row+"_customer_order_rate_mt").val(Number(mtr/i).toFixed(3));
    
}

function total_mtr_mts(row){    
    pcs  = jQuery("#"+row+"_customer_order_rate_pcs").val();
    length= jQuery("#"+row+"_customer_order_h_length").val();
    od  = jQuery("#"+row+"_customer_order_h_od").val();
    thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    i  = ((od-thikness)*thikness)/40549;
    jQuery("#"+row+"_customer_order_rate_mt").val(Number(pcs/(length*i)).toFixed(3));
    jQuery("#"+row+"_customer_order_rate_mtr").val(Number(pcs/length).toFixed(3));
}


function total_mtr_pcs(row){    
    mtonnes  = jQuery("#"+row+"_customer_order_rate_mt").val();
    length= jQuery("#"+row+"_customer_order_h_length").val();
    od  = jQuery("#"+row+"_customer_order_h_od").val();
    thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    i  = ((od-thikness)*thikness)/40549;
    jQuery("#"+row+"_customer_order_rate_mtr").val(Number(((od-thikness)*thikness*0.2465*mtonnes)/10000).toFixed(3));
    jQuery("#"+row+"_customer_order_rate_pcs").val(Number(i*mtonnes*length).toFixed(3));
}


function total_weight(row){
    quantity  = jQuery("#"+row+"_customer_order_quantity").val();
    length= jQuery("#"+row+"_customer_order_h_length").val();
    od  = jQuery("#"+row+"_customer_order_h_od").val();
    thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    i  = ((od-thikness)*thikness*length*0.02465*quantity)/1000;
    jQuery("#"+row+"_customer_order_total_weight").val(Number(i).toFixed(3));
    jQuery("#"+row+"_customer_order_balance").val(quantity);
  
}

function total_amount(row){
    quantity  = jQuery("#"+row+"_customer_order_quantity").val();
    rate_pcs= jQuery("#"+row+"_customer_order_rate_pcs").val();
      i  = quantity*rate_pcs;
    jQuery("#"+row+"_customer_order_total_amount").val(Number(i).toFixed(3));
}

function total_cal_od(){
 height  = jQuery("#"+"serialize_height").val();
  width  = jQuery("#"+"serialize_width").val();
    i  = ((width*2.0)+(height*2.0))/3.14;
 jQuery("#"+"serialize_od").val(Number(i).toFixed(3));
}



function cal_bal_quantity(){
 order_qty  = jQuery("#"+"salesplan_order_quantity").val();
  stock_qty  = jQuery("#"+"salesplan_stock_quantity").val();
    i  =  order_qty-stock_qty;
 jQuery("#"+"salesplan_balance_quantity").val(Number(i).toFixed(3));
}

function cal_bal_wt(){
 order_wt  = jQuery("#"+"salesplan_order_wt").val();
  stock_wt  = jQuery("#"+"salesplan_stock_wt").val();
    i  =  order_wt-stock_wt;
 jQuery("#"+"salesplan_balance_wt").val(Number(i).toFixed(3));
}


function specification_to_predespatch(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/predespatchtcs/specification_to_predespatch",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });
}

function salesplan_customer_order(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/salesplans/order_detail",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });
}


function coildetail(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/slittings/coil_detail",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });       
}

function get_process_coilwt(){
 wt = Number(jQuery('#coil_wt').val());
 p = Number(jQuery('#slitting_division_part').val());
    if (p > 0){}else{p = 1;}
   
    jQuery('#slitting_process_coil_wt').val(Number(wt/p).toFixed(3));
}

function get_slitwt(row){
 pcwt  = jQuery("#slitting_process_coil_wt").val();
 swth  = jQuery("#"+row+"_slitting_slit_width").val();
 cwth  = jQuery("#coil_width").val();
 jQuery("#"+row+"_slitting_slit_weight").val(Number((pcwt/cwth)*swth).toFixed(3));
}

function get_totalwt(row){
 swt  = jQuery("#"+row+"_slitting_slit_weight").val();
 slt  = jQuery("#"+row+"_slitting_no_of_slits").val();
 jQuery("#"+row+"_slitting_weight").val(Number(swt*slt).toFixed(3));
}

function get_scrap(){
 cwth = jQuery("#coil_width").val();
 totalwt = 0;
 for (i=1;i<10;i++){
     nslit = jQuery("#"+i+"_slitting_no_of_slits").val();
     swdth = jQuery("#"+i+"_slitting_slit_width").val();
     totalwt = totalwt + (Number(swdth) * Number(nslit));
 }
 jQuery("#slitting_scrap").val(Number(cwth-totalwt).toFixed(3));
}
function livia_datepicker(){
    jQuery(function() {
        jQuery(".date_picker").datepicker({
            showOn: 'both',
            buttonImage: '/images/calendar_n.gif',
            buttonImageOnly: true,
            dateFormat: 'mm/dd/yy',
            onSelect: function(value,date){
                var today=new Date();
                var newdate=new Date(value);
                jQuery('.date_picker').value =(newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear    ();
            }
        });
    });
}


function slitproductioncoildetail(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/slittingproductions/coil_detail",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });       
}

function uncoilerdetail(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/uncoiler_reports/coil_detail",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });       
}
function print_section(id){
 jQuery("#"+id).printElement({printMode:'popup'});
}

function db_date_change(){
    jQuery('#report_dates').change(function(){
        jQuery('#date_div')
        if (jQuery(this).val() == '5'){
            jQuery("#date_checked").attr("checked", "checked");
            jQuery('#date_div').show()
        }else{
            jQuery('#date_div').hide()
        }
    });
}

function stopagedetail(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/tube_mill_stoppage_reports/stopage_detail",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });       
}

function totaltime(){
   fromh = jQuery("#tube_mill_stoppage_report_from_4i").val();
   fromm = jQuery("#tube_mill_stoppage_report_from_5i").val();
   toh = jQuery("#tube_mill_stoppage_report_to_4i").val();
   tom = jQuery("#tube_mill_stoppage_report_to_5i").val();   
   
   from = (Number(fromh)*60)+Number(fromm)
   to = (Number(toh)*60)+Number(tom)
   
   jQuery("#tube_mill_stoppage_report_total_time").val(Number(to-from)); 
}