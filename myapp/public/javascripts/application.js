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
    var mtr  = Number(jQuery("#"+row+"_customer_order_rate_mtr").val()).toFixed(2);
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness)/40549;  
    jQuery("#"+row+"_customer_order_rate_pcs").val(Number(mtr*length).toFixed(2));
    jQuery("#"+row+"_customer_order_rate_mt").val(Number(mtr/i).toFixed(2));
    
}

function total_mtr_mts(row){    
    var pcs  = Number(jQuery("#"+row+"_customer_order_rate_pcs").val()).toFixed(2);
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness)/40549;
    jQuery("#"+row+"_customer_order_rate_mt").val(Number(pcs/(length*i)).toFixed(2));
    jQuery("#"+row+"_customer_order_rate_mtr").val(Number(pcs/length).toFixed(2));
}


function total_mtr_pcs(row){    
    var mtonnes  = Number(jQuery("#"+row+"_customer_order_rate_mt").val()).toFixed(2);
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness)/40549;
    //jQuery("#"+row+"_customer_order_rate_mtr").val(Number(((od-thikness)*thikness*0.2465*mtonnes)/10000).toFixed(2));
    jQuery("#"+row+"_customer_order_rate_mtr").val(Number(i*mtonnes).toFixed(2));
    jQuery("#"+row+"_customer_order_rate_pcs").val(Number(i*mtonnes*length).toFixed(2));
}

/*calculate qty per pices and MT also their weight on behalf of meters*/
function total_qty_pcs_mt_and_weights(row){
    var quantity  = jQuery("#"+row+"_customer_order_qty_mtr").val();
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();

    var qty_pc  = Number(quantity).toFixed(3)/length;
    jQuery("#"+row+"_customer_order_qty_pcs").val(Number(qty_pc).toFixed(0));
    
    var qty_mt = ((od-thikness)*thikness*0.0246615*length)*qty_pc/1000;
    jQuery("#"+row+"_customer_order_qty_mt").val(Number(qty_mt).toFixed(3));
    
    //total_weight(row);
    total_amount(row);
    /*weight also need to calculate*/

}

/*calculate qty per meters and MT also their weight on behalf of pices*/
function total_qty_mt_mtr_and_weights(row){
    var quantity  = jQuery("#"+row+"_customer_order_qty_pcs").val();
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();

    var qty_mtr  = Number(quantity).toFixed(3)*length;
    jQuery("#"+row+"_customer_order_qty_mtr").val(Number(qty_mtr).toFixed(3));
    
    var qty_mt = ((od-thikness)*thikness*0.0246615*length)*quantity/1000;
    jQuery("#"+row+"_customer_order_qty_mt").val(Number(qty_mt).toFixed(3));
    
    //total_weight(row);
    total_amount(row);
    /*weight also need to calculate*/

}


/*calculate qty per meters and pices also their weight on behalf of MT*/
function total_qty_pcs_mtr_and_weights(row){
    var quantity  = jQuery("#"+row+"_customer_order_qty_mt").val();
    var length = jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();

    var qty_pc = Number(quantity).toFixed(3)/((od-thikness)*thikness*0.0246615*length/1000);

    jQuery("#"+row+"_customer_order_qty_pcs").val(Number(qty_pc).toFixed(0));
    
    var qty_mtr  = Number(qty_pc).toFixed(0)*Number(length).toFixed(3);
    jQuery("#"+row+"_customer_order_qty_mtr").val(Number(qty_mtr).toFixed(3));
    //total_weight(row);
    total_amount(row);
    /*weight also need to calculate*/

}

function total_weight(row){
    var quantity  = jQuery("#"+row+"_customer_order_qty_mtr").val();
    var length= jQuery("#"+row+"_customer_order_h_length").val();
    var od  = jQuery("#"+row+"_customer_order_h_od").val();
    var thikness  = jQuery("#"+row+"_customer_order_h_thikness").val();
    var i  = ((od-thikness)*thikness*length*0.02465*quantity)/1000;
    jQuery("#"+row+"_customer_order_total_weight").val(Number(i).toFixed(3));
    jQuery("#"+row+"_customer_order_balance").val(quantity);
  
}

function total_amount(row){
//    var qty_pcs  = jQuery("#"+row+"_customer_order_quantity_pcs").val();
//    var rate_pcs= jQuery("#"+row+"_customer_order_rate_pcs").val();
//
//    var qty_mtr  = jQuery("#"+row+"_customer_order_quantity_mtr").val();
//    var rate_mtr= jQuery("#"+row+"_customer_order_rate_mtr").val();

    var qty_mt  = jQuery("#"+row+"_customer_order_qty_mt").val();
    var rate_mt= jQuery("#"+row+"_customer_order_rate_mt").val();    
    var quantity  = jQuery("#"+row+"_customer_order_qty_mtr").val();

    //jQuery("#"+row+"_customer_order_total_amount_mtr").val(Number(qty_mtr*rate_mtr).toFixed(3));
    //jQuery("#"+row+"_customer_order_total_amount_pcs").val(Number(qty_pcs*rate_pcs).toFixed(3));
    jQuery("#"+row+"_customer_order_total_amount").val(Number(qty_mt*rate_mt).toFixed(2));
    jQuery("#"+row+"_customer_order_balance").val(quantity);
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
       tariffval = tariffval +Number( jQuery("#"+j+"_taxinvoice_total_tariff_value").val());
    
     jQuery("#"+"taxinvoice_amount").val(Number(tariffval).toFixed(3));
}
  
}
function total_before_duty(){
    var amount  = Number(jQuery("#"+"taxinvoice_amount").val());
      var packing_forwarding = Number(jQuery("#"+"taxinvoice_packing_forwarding").val());
      var i  = (amount)+(packing_forwarding);
         jQuery("#"+"taxinvoice_total_before_duty").val(Number(i).toFixed(3));
}

function total_all_duty(){
    var total_before_duty  = Number(jQuery("#"+"taxinvoice_total_before_duty").val());
      var excise_duty= Number(jQuery("#"+"taxinvoice_excise_duty").val());
       var ed_cess= Number(jQuery("#"+"taxinvoice_ed_cess").val());
       var sah_ed_cess= Number(jQuery("#"+"taxinvoice_sah_ed_cess").val());
      var x  =total_before_duty *(excise_duty/100);
      var y  =x *(ed_cess/100);
      var z  =x *(sah_ed_cess/100);
      var i = total_before_duty+x+y+z

    jQuery("#"+"taxinvoice_total_all").val(Number(i).toFixed(3));
}
function grand_total(){
    var total_all  = Number(jQuery("#"+"taxinvoice_total_all").val());
       var vat_cst= Number(jQuery("#"+"taxinvoice_vat_cst").val());
          var i = total_all+((total_all)*(vat_cst/100))
    jQuery("#"+"taxinvoice_grand_total").val(Number(i).toFixed(3));
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
// var cwth = jQuery("#coil_width").val();
// var totalwt = 0;
// for (i=1;i<10;i++){
//     var nslit = jQuery("#"+i+"_slitting_no_of_slits").val();
//     var swdth = jQuery("#"+i+"_slitting_slit_width").val();
//     totalwt = totalwt + (Number(swdth) * Number(nslit));
// }
// jQuery("#slitting_scrap").val(Number(cwth-totalwt).toFixed(3));

    var cwt = jQuery("#slitting_process_coil_wt").val();
    var totalwt = 0;
    for(i=1;i<10;i++){
        totalwt = Number(jQuery("#"+i+"_slitting_total_weight").val()) + totalwt;
    }
    jQuery("#slitting_scrap").val(Number(cwt-totalwt).toFixed(3));
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

function get_slitwt_on_edit(){
 var pcwt  = jQuery("#slitting_process_coil_wt").val();
 var swth  = jQuery("#slitting_slit_width").val();
 var cwth  = jQuery("#coil_width").val();
 jQuery("#slitting_slit_weight").val(Number((pcwt/cwth)*swth).toFixed(3));
}

function get_totalwt_on_edit(){
 var swt  = jQuery("#slitting_slit_weight").val();
 var slt  = jQuery("#slitting_no_of_slits").val();
 jQuery("#slitting_total_weight").val(Number(swt*slt).toFixed(3));
}

function get_scrap_on_edit(){
// var cwth = jQuery("#coil_width").val();
// var totalwt = 0;
// for (i=1;i<10;i++){
//     var nslit = jQuery("#"+i+"_slitting_no_of_slits").val();
//     var swdth = jQuery("#"+i+"_slitting_slit_width").val();
//     totalwt = totalwt + (Number(swdth) * Number(nslit));
// }
// jQuery("#slitting_scrap").val(Number(cwth-totalwt).toFixed(3));

    var cwt = jQuery("#slitting_process_coil_wt").val();
    var totalwt = 0;
        totalwt = Number(jQuery("#slitting_total_weight").val()) + totalwt;
    jQuery("#slitting_scrap").val(Number(cwt-totalwt).toFixed(3));
}
