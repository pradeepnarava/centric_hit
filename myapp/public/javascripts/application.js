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

function total_price(row){
 
 rpkg  = jQuery("#"+row+"_customer_order_rate_per_kilo").val();
 twt  = jQuery("#"+row+"_customer_order_total_weight").val();
 jQuery("#"+row+"_customer_order_total_amount").val(rpkg*twt);
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
