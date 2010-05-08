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


function change_tubesize(value){

    if(value==""){return false}
    loader.prependTo("#customer_div")
      jQuery.ajax({
       type: "POST",
       url: "/serializes/change_tubesize",
       dataType: 'script',
    data: {
          'value' : value
          
        },
         
     success: function(){loader.remove();}
     });
   
}


function total_price(row){ 
    var rpkg  = jQuery("#"+row+"_customer_order_rate_per_kilo").val();
    var twt  = jQuery("#"+row+"_customer_order_rate_pcs").val();
    jQuery("#"+row+"_customer_order_total_amount").val(rpkg*twt);
}

function total_pcs_mts(row){    
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var mtr  = jQuery("#"+row+"_customer_order_rate_mtr").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness)/40549;  
    jQuery("#"+row+"_customer_order_rate_pcs").val(Number(mtr*length).toFixed(3));
    jQuery("#"+row+"_customer_order_rate_mt").val(Number(mtr/i).toFixed(3));
    
}

function total_mtr_mts(row){    
    var pcs  = jQuery("#"+row+"_customer_order_rate_pcs").val();
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness)/40549;
    jQuery("#"+row+"_customer_order_rate_mt").val(Number(pcs/(length*i)).toFixed(3));
    jQuery("#"+row+"_customer_order_rate_mtr").val(Number(pcs/length).toFixed(3));
}


function total_mtr_pcs(row){    
    var mtonnes  = jQuery("#"+row+"_customer_order_rate_mt").val();
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness)/40549;
    jQuery("#"+row+"_customer_order_rate_mtr").val(Number(((od-thikness)*thikness*0.2465*mtonnes)/10000).toFixed(3));
    jQuery("#"+row+"_customer_order_rate_pcs").val(Number(i*mtonnes*length).toFixed(3));
}


function total_weight(row){
    var quantity  = jQuery("#"+row+"_customer_order_quantity").val();
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness*length*0.02465*quantity)/1000;
    jQuery("#"+row+"_customer_order_total_weight").val(Number(i).toFixed(3));
    jQuery("#"+row+"_customer_order_balance").val(quantity);
  
}

function total_amount(row){
    var quantity  = jQuery("#"+row+"_customer_order_quantity").val();
    var rate_pcs= jQuery("#"+row+"_customer_order_rate_pcs").val();
      var i  = quantity*rate_pcs;
    jQuery("#"+row+"_customer_order_total_amount").val(Number(i).toFixed(3));
}

function total_cal_od(){
  var height  = jQuery("#"+"serialize_height").val();
  var width  = jQuery("#"+"serialize_width").val();
   var i  = ((width*2.0)+(height*2.0))/3.14;
 jQuery("#"+"serialize_od").val(Number(i).toFixed(3));
}



function cal_bal_quantity(){
 var order_qty  = jQuery("#"+"salesplan_order_quantity").val();
  var stock_qty  = jQuery("#"+"salesplan_stock_quantity").val();
    var i  =  order_qty-stock_qty;
 jQuery("#"+"salesplan_balance_quantity").val(Number(i).toFixed(3));
}

function cal_bal_wt(){
var order_wt  = jQuery("#"+"salesplan_order_wt").val();
 var stock_wt  = jQuery("#"+"salesplan_stock_wt").val();
   var i  =  order_wt-stock_wt;
 jQuery("#"+"salesplan_balance_wt").val(Number(i).toFixed(3));
}



function deliverydetail(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/taxinvoices/deliverydetail",
       dataType: 'script',
    data: {
          'id' : id
        },
     success: function(){loader.remove();}
     });
}


function deliverychallan_detail(id,row){
    if(id==""){return false}
    //loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/taxinvoices/deliverychallan_detail",
       dataType: 'script',
    data: {
          'id' : id,
           'row' :row
        },
     success: function(){loader.remove();}
     });
}

function total_tariff_value(row){
    var meters  = jQuery("#"+row+"_taxinvoice_meters").val();
    var rate_mtrs= jQuery("#"+row+"_taxinvoice_rs_mtrs").val();
      var i  = meters*rate_mtrs;
    jQuery("#"+row+"_taxinvoice_total_tariff_value").val(Number(i).toFixed(3));
}

function total_amount_tax(totalrow){

    var tariffval = 0;
    for (j=1;j<=totalrow;j++){
       tariffval = tariffval + jQuery("#"+j+"_taxinvoice_total_tariff_value").val();
     jQuery("#"+j+"_taxinvoice_amount").val(Number(tariffval).toFixed(3));
}
  //return tariffval;
      //jQuery("#"+j+"_taxinvoice_amount").val(Number(tariffval).toFixed(3));
  

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
var wt = Number(jQuery('#coil_wt').val());
var p = Number(jQuery('#slitting_division_part').val());
    if (p > 0){}else{p = 1;}
   
    jQuery('#slitting_process_coil_wt').val(Number(wt/p).toFixed(3));
}

function get_slitwt(row){
 var pcwt  = jQuery("#slitting_process_coil_wt").val();
 var swth  = jQuery("#"+row+"_slitting_slit_width").val();
 var cwth  = jQuery("#coil_width").val();
 jQuery("#"+row+"_slitting_slit_weight").val(Number((pcwt/cwth)*swth).toFixed(3));
}

function get_totalwt(row){
 var swt  = jQuery("#"+row+"_slitting_slit_weight").val();
 var slt  = jQuery("#"+row+"_slitting_no_of_slits").val();
 jQuery("#"+row+"_slitting_total_weight").val(Number(swt*slt).toFixed(3));
}

function get_scrap(){
 var cwth = jQuery("#coil_width").val();
 var totalwt = 0;
 for (i=1;i<10;i++){
     var nslit = jQuery("#"+i+"_slitting_no_of_slits").val();
     var swdth = jQuery("#"+i+"_slitting_slit_width").val();
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

function predespatch_lot(id){
    if(id==""){return false}
    loader.prependTo("#detail")
      jQuery.ajax({
       type: "POST",
       url: "/predespatchtcs/predespatch_lot",
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
   var fromh = jQuery("#tube_mill_stoppage_report_from_4i").val();
   var fromm = jQuery("#tube_mill_stoppage_report_from_5i").val();
   var toh = jQuery("#tube_mill_stoppage_report_to_4i").val();
   var tom = jQuery("#tube_mill_stoppage_report_to_5i").val();   
   
   var from = (Number(fromh)*60)+Number(fromm);
   var to = (Number(toh)*60)+Number(tom);
   
   jQuery("#tube_mill_stoppage_report_total_time").val(Number(to-from)); 
}

function common_flash_message(){
  jQuery(document).ready(function() {
    jQuery('#notice')
    .fadeIn('slow')
    .animate({
      opacity: 1.0
    }, 8000)
    .fadeOut('slow', function() {
      jQuery('#notice').remove();
    });
  });
}