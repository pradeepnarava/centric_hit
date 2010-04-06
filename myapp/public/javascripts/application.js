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