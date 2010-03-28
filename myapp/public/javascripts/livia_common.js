/* for matters view*/
function showHideLitigation(show) {
  if (show) {
    jQuery('#litigation').show();
    jQuery("#matter_type").html('');
    jQuery("<center><img src='/images/loading.gif' /></center>").appendTo("#matter_type");
    jQuery.get("/matters/get_matter_types", {
      "matter_types_for" : "litigation"
    }, function(data){
      jQuery("#matter_type").html(data);
    });
  } else {
    jQuery('#litigation').hide();
    jQuery("#matter_type").html('');
    jQuery("<center><img src='/images/loading.gif' /></center>").appendTo("#matter_type");
    jQuery.get("/matters/get_matter_types", {
      "matter_types_for" : "non_litigation"
    }, function(data){
      jQuery("#matter_type").html(data);
    });
  }
}
  
function openDocPop() {
  window.open(
    "/documents/new",
    "docs",
    "height=400,width=700,status=no,menubar=no,location=no,toolbar=no,scrollbars=yes"
    );
}
  
/*start - scripts for the contact views*/
/*call at the time of contact edit view load*/
function contact_edit_init(){
  jQuery('#account_id').attr("disabled", true);
}


 jQuery(function() {
 // unobtrusive javascripts
 // Contact --Index -- by Sanil
 jQuery(".selContact").click(function() {
    getContactsAll(this.value)
  });
 // Contact --new
  jQuery("#account_selector").click(function() {
  account_combo_toggle(this.value)
   return false
  });
  jQuery("#contact_do_not_call").click(function() {
      //jQuery(".warningSpan").attr("onclick","showalert()");
  });
});


/*for contact controller*/
function account_combo_toggle() {
  var content = jQuery("#account_selector").text();
  if(content == "Create New") {
    var value_sel = "Select Existing"
    jQuery("#account_selector").text(value_sel);
    jQuery("#account_id").attr('disabled',true)
    jQuery("#account_id").hide();
    jQuery("#account_name").val();
    jQuery("#account_name").attr('disabled',false)
    jQuery("#account_name").show();
  }else {
    var value_create = "Create New"
    jQuery("#account_selector").text(value_create);
    jQuery("#account_name").attr('disabled',true)
    jQuery("#account_name").hide();
    jQuery("#account_id").attr('disabled',false)
    jQuery("#account_id").show();
  }
}

function contact_combo_toggle() {
  var content = jQuery("#contact_selector").text();
  if(content == "Create New") {
    jQuery('#contact_lead_type_1').attr('disabled', false);
    var value_sel = "Select Existing"
    jQuery("#contact_selector").text(value_sel);
    jQuery("#contact_name").attr('disabled',false)
        jQuery(".disundis").attr("disabled", false);
    jQuery("#contact_name").show();
    jQuery("#contact_id").attr('disabled', true);

  }else {
    var value_create = "Create New"
    jQuery("#contact_selector").text(value_create);
    jQuery('#contact_lead_type_1').attr('disabled', true);
    jQuery(".disundis").attr("disabled", "disabled");
    jQuery("#contact_name").hide();
    jQuery("#contact_id").attr('disabled', false);
  }
}

/*In contact for change_status*/
function validate_reason(){
  var oppname=jQuery('#notes_comment').val();
  if (oppname==""){
    jQuery('#nameerror').html("<div class='errorCont'>Please specify the reason</div>");
    return false;
  }
  else{
    return true;
  }
}

/*In contact for _create_opportunity*/
function validate_name(){
  var oppname=jQuery('#opportunity_name').val();
  if (oppname==""){
    jQuery('#nameerror').html("<div class='errorCont'>Please enter Opportunity Name</div>");
    return false;
  }
  else{
    return true;
  }
}
/*end - scripts for the contact views*/


/*start - scripts for the campaign views*/

function switch_create_campaign(selector){
  if (selector=='new')
  {
    jQuery('#existing_campaign').hide();
    jQuery('#campaign_id').disabled=true;
    jQuery('#campaign_name').val="";
  }
  else
  {
    jQuery('#existing_campaign').show();
    jQuery('#campaign_id').disabled=false;
  }
}

function campaign_datepicker(){
  jQuery(function() {
    jQuery("#campaign_start").datepicker({
      showOn: 'button',
      buttonImage: '/images/calendar_n.gif',
      buttonImageOnly: true,
      onSelect: function(value,date){
        var today=new Date();
        var newdate=new Date(value);
        $('campaign_start').value =(newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear	();
      }
      });
    jQuery("#campaign_end").datepicker({
      showOn: 'button',
      buttonImage: '/images/calendar_n.gif',
      buttonImageOnly: true,
      onSelect: function(value,date){
        var today_end=new Date();
        var enddate=new Date(value);
        $('campaign_end').value =(enddate.getMonth()+1)+'/'+enddate.getDate()+'/'+enddate.getFullYear	();
      }
      });
  });

}

function new_product_licence_datepicker(){
  jQuery(function() {
    jQuery("#datepicker_product_licence_start_at").datepicker({
      showOn: 'button',
      buttonImage: '/images/calendar_n.gif',
      buttonImageOnly: true,
      onSelect: function(value,date){
        var today=new Date();
        var newdate=new Date(value);
        $('datepicker_product_licence_start_at').value =(newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear	();
      }
      });
    jQuery("#datepicker_product_licence_end_at").datepicker({
      showOn: 'button',
      buttonImage: '/images/calendar_n.gif',
      buttonImageOnly: true,
      onSelect: function(value,date){
        var today_end=new Date();
        var enddate=new Date(value);
        $('datepicker_product_licence_end_at').value =(enddate.getMonth()+1)+'/'+enddate.getDate()+'/'+enddate.getFullYear	();
      }
      });
  });

}


function getCampaigns(type) {
  //var selContact = jQuery("input[name='selContact']:checked").val();
  document.location.href = "/campaigns?mode_type="+type;

}

function validateFile(){
  var filename=document.getElementById("import_file").value;
  if (filename=="")
  {
    alert("Please input a filename");
    return false;
  }
  else
  {
    arr = filename.split(".");
    exten = arr[arr.length -1].toUpperCase()
    if (!(exten =="CSV"))
    {
      alert("Please input CSV file only");
      return false;
    }
  }

}

function campaign_check_all(){
    
    var recs = jQuery(".records");
    for (var i=0; i<recs.length; i++) {
      recs[i].checked = jQuery("#check_all:checked").val();
    }
    
}

function validateImportFile(){
  var filename=document.getElementById("import_file").value;
  if (filename=="")
  {
    alert("Please select a file to import");
    return false;
  }
  else
  {
    arr = filename.split(".");
    exten = arr[arr.length -1].toUpperCase()
    if (!(exten =="CSV" || exten =="VCF"))
    {
      alert("Please specify valid filename");
      return false;
    }
  }

}
  
function campaign_check_all_cont(){
  
    var recs = jQuery(".recordscampmem");
    for (var i=0; i<recs.length; i++) {
      recs[i].checked = jQuery("#check_all_cont:checked").val();
    }
      
}

function campaign_status_change(){   
  notes_div = jQuery('#notes');
  notes_div.show();
}

function edit_campaign_datepicker(){
  jQuery.noConflict();
  jQuery(
    function() {
      jQuery("#campaign_start").datepicker({
        showOn: 'button',
        buttonImage: '/images/calendar.gif',
        buttonImageOnly: true,
        onSelect: function(value,date){
          var today=new Date();
          var newdate=new Date(value);
          $('campaign_start').value =(newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear	();
        }
        });
      jQuery("#campaign_end").datepicker({
        showOn: 'button',
        buttonImage: '/images/calendar.gif',
        buttonImageOnly: true,
        onSelect: function(value,date){
          var today_end=new Date();
          var enddate=new Date(value);
          $('campaign_end').value =(enddate.getMonth()+1)+'/'+enddate.getDate()+'/'+enddate.getFullYear	();
        }
        });
    });
}   

function campaign_opportunity_datepicker(){
  jQuery.noConflict();
  jQuery(function() {
    jQuery("#campaign_closure_date").datepicker({
      showOn: 'button',
      buttonImage: '/images/calendar_n.gif',
      buttonImageOnly: true,
      onSelect: function(value,date)

      {
        var today=new Date();
        var newdate=new Date(value);
        jQuery('campaign_closure_date').value =(newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear	();
      }
      });
  });
}

function ValidateForm(){
  var email_id = jQuery("#email_id").val();
  if ((email_id==null)||(email_id=="")){
    alert("Please Enter your Email ID")
    return false
  }
  if (echeck(email_id)==false){
    email_id=""
    return false
  }
  return true
}
 
function opportunity_status_change(selected, selected_value) {
  if(selected != selected_value)
    jQuery("#reason").show();
  else
    jQuery("#reason").hide();
  var val = jQuery('#opportunity_stage :selected').text();
  if (val == "Closed/Won") {
    jQuery("#opp_matter").show();
  } else {
    jQuery("#opp_matter").hide();
  }
}

function edit_opportunity_datepicker(){
  jQuery.noConflict();
  jQuery(function() {
    jQuery("#datepicker_opportunity_edit").datepicker({
      showOn: 'button',
      buttonImage: '/images/calendar.gif',
      buttonImageOnly: true,
      onSelect: function(value,date){
        var today=new Date();
        var newdate=new Date(value);
        jQuery('#datepicker_opportunity_edit').value =(newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear();
      }
      });
  });
}

function new_opportunity_datepicker(){
  jQuery.noConflict();
  jQuery(function() {
    jQuery("#datepicker_opportunity_new").datepicker({
      showOn: 'both',
      closeAtTop: true,
      buttonImage: '/images/calendar_n.gif',
      buttonImageOnly: true,
      onSelect: function(value,date){
        var today=new Date();
        var newdate=new Date(value);
        jQuery('datepicker_opportunity_new').value =(newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear();
      }
      });
  });
}

function getopp(type) {
  //var selContact = jQuery("input[name='selContact']:checked").val();
  document.location.href = "/opportunities?mode_type="+type;

}

function initCampaignsOpportunityToggle1() {
  jQuery("#prospectsdiv").hide();
  jQuery("#prospectsToggle").click(function(){ 
    jQuery("#prospectsdiv").toggle(); jQuery(".toggle_prospects").toggle();
  });
  jQuery("#proposaldiv").hide();
  jQuery("#proposalToggle").click(function(){ 
    jQuery("#proposaldiv").toggle(); jQuery(".toggle_proposal").toggle();
  });
  jQuery("#negotiationdiv").hide();
  jQuery("#negotiationToggle").click(function(){ 
    jQuery("#negotiationdiv").toggle(); jQuery(".toggle_negotiation").toggle();
  });
  jQuery("#finalreviewdiv").hide();
  jQuery("#finalreviewToggle").click(function(){ 
    jQuery("#finalreviewdiv").toggle(); jQuery(".toggle_finalreview").toggle();
  });
  jQuery("#closedwondiv").hide();
  jQuery("#closedwonToggle").click(function(){ 
    jQuery("#closedwondiv").toggle(); jQuery(".toggle_closedwon").toggle();
  });
  jQuery("#closedlostdiv").hide();
  jQuery("#closedlostToggle").click(function(){ 
    jQuery("#closedlostdiv").toggle(); jQuery(".toggle_closedlost").toggle();
  });
  jQuery("#inprogressdiv").hide();
  jQuery("#inprogressToggle").click(function(){ 
    jQuery("#inprogressdiv").toggle(); jQuery(".toggle_inprogress").toggle();
  });
  jQuery("#planneddiv").hide();
  jQuery("#plannedToggle").click(function(){ 
    jQuery("#planneddiv").toggle(); jQuery(".toggle_planned").toggle();
  });
  jQuery("#completeddiv").hide();
  jQuery("#completedToggle").click(function(){ 
    jQuery("#completeddiv").toggle(); jQuery(".toggle_completed").toggle();
  });
  jQuery("#aborteddiv").hide();
  jQuery("#abortedToggle").click(function(){ 
    jQuery("#aborteddiv").toggle(); jQuery(".toggle_aborted").toggle();
  });
  jQuery("#searchlistToggle").hide();
}

function matterAddComment(comment_user_id,comment_commentable_id,comment_commentable_type,comment_title){

  var user_id = comment_user_id;
  var commentable_id = comment_commentable_id;
  var commentable_type = comment_commentable_type;
  var priv = false;
  var title = comment_title;
  var comment = jQuery("#matter_comment").val();

  jQuery.post("/comments/add_new_comment",
  {
    "created_by_user_id" : user_id,
    "commentable_id" : commentable_id,
    "commentable_type" : commentable_type,
    "private" : priv,
    "title" : title,
    "comment" : comment
  },
  function(data) {
    if (data.indexOf("OK") == 0) {
      var tr = document.createElement("tr");
      var tds = data.substring(2).split("|");
      for (var i=0; i< tds.length; i++) {
        var td = document.createElement("td");
        td.innerHTML = tds[i];
        tr.appendChild(td);
      }
      var tbl = document.getElementById("comment_list");
      if (tbl) tbl.appendChild(tr);
      jQuery.facebox.close();
    } else {
      jQuery("#comment_info").html(data);
    }
  });
  return false;

}

/* Create jQuery calendar popups for matter_peoples start and end dates. */
function matter_people_start_end_datepicker() {
  jQuery("#matter_people_start_date").datepicker({
    showOn: 'both',
    closeAtTop: true,
    buttonImage: '/images/calendar_n.gif',
    buttonImageOnly: true,
    dateFormat: 'yy-mm-dd'
    /*onSelect:  function(value, datepicker) {
      var newdate = new Date(value);
      jQuery('#matter_people_start_date').value = 'ok';
        //newdate.getFullYear()+'-'+(newdate.getMonth()+1)+'-'+newdate.getDate();
    }*/
  });
  jQuery("#matter_people_end_date").datepicker({
    showOn: 'both',
    closeAtTop: true,
    buttonImage: '/images/calendar_n.gif',
    buttonImageOnly: true,
    dateFormat: 'yy-mm-dd'
    /*
    onSelect:  function(value, datepicker) {
      var newdate = new Date(value);
      jQuery('#matter_people_end_date').value = (newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear();
    }*/
  });
}

/* Create jQuery calendar popups for matter task page. */
function matter_task_complete_by_datepicker(){
  jQuery("#matter_task_complete_by").datepicker({
    showOn: 'both', 
    closeAtTop: true,
    buttonImage: '/images/calendar_n.gif',
    buttonImageOnly: true,
    onSelect:  function(value, date) {
      var newdate = new Date(value);
      jQuery('#matter_task_complete_by').value = (newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear();
    }
  });
  jQuery("#matter_task_completed_at").datepicker({
    showOn: 'both', 
    closeAtTop: true,
    buttonImage: '/images/calendar_n.gif',
    buttonImageOnly: true,
    onSelect:  function(value, date) {
      var newdate = new Date(value);
      jQuery('#matter_task_completed_at').value = (newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear();
    }
  });

  jQuery("#matter_task_completed").click(function(){
    if (jQuery('#matter_task_completed:checked').val()) {
      jQuery("#completed_date").show();
    } else {
      jQuery("#completed_date").hide();
      jQuery('#matter_task_completed_at').value = '';
    }
  });
}

function getFilteredMatterTasks(value,matter_id) {
  jQuery.get(
    "/matters/get_filtered_tasks",
    {
      "filter" : value,
      "matter_id" : matter_id
    },
    function(data) {
      jQuery("#matter_tasks").html(data);
    }
    );

}

function matter_issue_target_resolution_datepicker(){
  jQuery("#matter_issue_target_resolution_date").datepicker({
    showOn: 'both',
    closeAtTop: true,
    buttonImage: '/images/calendar_n.gif',
    buttonImageOnly: true,
    onSelect:  function(value, date) {
      var today = new Date();
      var newdate = new Date(value);
      jQuery('#matter_issue_target_resolution_date').val( (newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear() );
    }
  });
  jQuery("#matter_issue_resolved_at").datepicker(
  {
    showOn: 'both', 
    closeAtTop: true,
    buttonImage: '/images/calendar_n.gif',
    buttonImageOnly: true,
    onSelect:  function(value, date) {
      var today = new Date();
      var newdate = new Date(value);
      $('#matter_issue_resolved_at').value = (newdate.getMonth()+1)+'/'+newdate.getDate()+'/'+newdate.getFullYear();
    }
  });
}

function check_matter_issue_resolved(){
  if (jQuery('#matter_issue_resolved:checked').val()) {
    jQuery("#resolution").show();
    jQuery("#resolution_date").show();
  } else {
    jQuery("#resolution").hide();
    jQuery("#resolution_date").hide();
    jQuery("#matter_issue_resolved_at").val('');
  }  
}

function showaccessdetails() {
  jQuery("#selective").toggle();
}

function hideaccessdetails() {
  jQuery("#selective").hide();
}

function document_home_superseed(matter_id){

  if(jQuery("#document_home_superseed").attr('checked',false))
  {
    jQuery("#document_home_old_document").css('display','block');
  }
  jQuery("#document_home_old_document").change(function(){
    var old_doc_id=jQuery("#document_home_old_document").val();
    if (old_doc_id == '') return;
    jQuery.getJSON("/matters/document_homes/get_document_home",
    {
      "doc_id" : old_doc_id,
      "matter_id" : matter_id
    },
    function(data) {
      doc = data["document"];
      jQuery("#document_home_name").val(doc["name"]);
      jQuery("#document_home_bookmark").val(doc["bookmark"]);
      jQuery("#document_home_phase").val(doc["phase"]);
      jQuery("#document_home_description").val(doc["description"]);
      jQuery("#document_home_author").val(doc["author"]);
    //jQuery("#document_home_source").val(doc["source"]);
    }
    );
  });

}

function validateNotes() {
  var task_type = jQuery("#task_task_of_type option:selected").text();
        
  if (task_type == "-- Select --") {
    jQuery("#notes_errors").html("<div class='errorCont'>Please select task type</div>");
    return false;
  } else {
    jQuery.facebox.close();
  }
}
function validateNotes_on_save_and_exit() {
  var task_type = jQuery("#com_notes_entries_textarea");
  if (task_type.val() == "") {
    jQuery("#notes_errors").html("<div class='errorCont'>Notes cannot be empty</div>");
    return false;
  } else {
    jQuery.facebox.close();
  }
}

function validateTasks() {
  var task_type = jQuery("#task_task_of_type option:selected").text();
  //var assign_to = jQuery("#task_assigned_to option:selected").text();

  if (task_type == "-- Select --") {
    jQuery("#task_errors").html("<div class='errorCont'>Please select task type</div>");
    return false;
  } //else if (assign_to == "-- Select --"){
  //jQuery("#task_errors").html("<div class='errorCont'>Please select assign to</div>");
  //return false;
  //}
  else {
    jQuery.facebox.close();
  }
}
 
function maximize_grid(max_img_id,min_img_id){
  $(secretaries_details_img_minus).style.display='none';
  $(max_img_id).style.display='none';
  $(min_img_id).style.display='block';
}

function validateTaskType() {
  var task_type = jQuery(".task_of_type option").index(jQuery(".task_of_type option:selected"));
      
  if((jQuery(this.checked)) && (task_type == "")) {
    jQuery("#div_errors").html("<div class='errorCont'>Please select task type</div>");
    return false;
  } else {  }
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


function myPasswordSubmit() {
  f = document.getElementById("pf");
  var cpass = jQuery("#current_password").val();
  var npass = jQuery("#password").val();
  var npass2 = jQuery("#password_confirmation").val();
    
    
  jQuery.post("/users/change_password",
  {
    "current_password" : cpass, 
    "user[password]" : npass,
    "user[password_confirmation]" : npass2
  },
  function(out) {
    if (out != "") {
      jQuery("#password_errors").html(out);
      jQuery("#password_errors").show();
    } else {
      window.location = "/login";
    }
  });
  return false;
}

function submitMe(f) {
  jQuery.facebox.close();f.submit();return false;
}

/* Submit the password reset form using jQuery-AJAX, handle and display error
 * messages. */
function submitPasswordReset(id) {
  var npass = jQuery("#reset_password").val();
  var npass2 = jQuery("#reset_password_confirmation").val();
  jQuery.post("/users/reset_password/" + id, {
    "user[password]" : npass,
    "user[password_confirmation]" : npass2
  },
  function(out) {
    if (out != "") {
      jQuery("#reset_password_errors").html(out);
      jQuery("#reset_password_errors").show();
    } else {
      jQuery.facebox.close();
      alert("Password was reset successfully!")
    }
  });
  return false;
}

function common_datepicker(){

  jQuery.noConflict();
  jQuery(function() {
    jQuery("#datepicker").datepicker(
    {
      onSelect: function(date) {
        
        scheduler.init('scheduler_here',date,"day");
        
        Element.show('main_spinner'); new Ajax.Request('/physical/calendar/calendars/date_select_appointment?date='+date, {
          asynchronous:true,
          evalScripts:false,
          onSuccess:function(request){
            Element.hide('main_spinner')
            }
          })
      },
      selectWeek: true,
      inline: true,
      startDate: '01/01/2000',
      firstDay: 1
    }
    );
  });
}

function appointments_grid_init(){
  var spanID = "";
  jQuery.noConflict();
  jQuery(function(jQuery) {
    //run the currently selected effect
    function runEffect(){
            
      //get effect type from
      var selectedEffect = "blind";
			
      //most effect types need no options passed by default
      var options = {};
      //check if it's scale, transfer, or size - they need options explicitly set
      if(selectedEffect == 'scale'){  
        options = {
          percent: 0
        };
      }
      else if(selectedEffect == 'size'){
        options = {
          to: {
            width: 200,
            height: 60
          }
        };
      }
      //alert(jQuery(this).attr("id"));
      //var jQueryParser = "#"+spanID+"tec"
      var jQueryParser = "#appointment_"+spanID
            
      //run the effect
      jQuery(jQueryParser).toggle(selectedEffect,options,500);
    };

    //set effect from select menu value
    jQuery("span").click(function() {
      spanID = jQuery(this).attr("id");;
      runEffect();
      return false;
    });
  });
}



function status_change(selected,action,current_value)
{
    lead_div = jQuery('#lead');
    prospect_div = jQuery('#prospect');
    notes_div = jQuery('#notes');

    selectedtxt=jQuery('#contact_status option:selected').text();
    if (selectedtxt=='Lead')
    {
        jQuery('#contact_lead_status').val("11");
        jQuery('#contact_lead_status').attr('disabled',false)
        lead_div.show();
        jQuery('#contact_prospect_status').attr('disabled','disabled')
        prospect_div.hide();
    }
    else{
        jQuery('#contact_lead_status').attr('disabled','disabled')
        lead_div.hide();
         jQuery('#contact_prospect_status').val("7");
        jQuery('#contact_prospect_status').attr('disabled',false)
        prospect_div.show();
    }
      if (selected==current_value){
    notes_div.hide();
  }
  else
      {
           notes_div.show();
      }
}
  
function application_layout_init(){
  jQuery.noConflict();
  jQuery(document).ready(function(){
    initAutoComplete();
    initCampaignsOpportunityToggle();
    initLiviaHint();
    initLiviaFaceBox();
    closeFaceBox();
    rolloverToolTip();
    initToggle();
        
    jQuery("#viewHeader").click(function() {
      jQuery("#viewHeaderArea").toggle();
      jQuery(".toggle_view").toggle();
    });
  });


  ddaccordion.init({
	headerclass: "headerbar", //Shared CSS class name of headers group
	contentclass: "submenu", //Shared CSS class name of contents group
	revealtype: "mouseover", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
	mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
	collapseprev: true, //Collapse previous content (so only one open at any time)? true/false
	defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc] [] denotes no content
	onemustopen: true, //Specify whether at least one header should be open always (so never all headers closed)
	animatedefault: false, //Should contents open by default be animated into view?
	persiststate: true, //persist state of opened contents within browser session?
	toggleclass: ["", "selected"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
	togglehtml: ["", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
	animatespeed: "normal", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
	oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
		//do nothing
	},
	onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
		//do nothing
	}
})

}

function fix_width()
{         
  var screen_width = screen.width-60;
  jQuery('.contentDiv').css({
    "width" : screen_width
  });
}

function validatefields(){         
  var subject=document.getElementById("email_subject").value;
  var email_id=document.getElementById("email_owners_email").value;
  if (subject=="") {
    alert("Please specify a subject");
    return false;
  } else if(email_id=="") {
    alert("Please specify a Email ID");
    return false;
  } else {
    return true;
  }
}

function campaign_layout_init(){
  jQuery.noConflict();
  jQuery(document).ready(function(){
    initLiviaFaceBox();
    initAutoComplete();
    initCampaignsOpportunityToggle();
    initLiviaHint();
    initToggle();
    jQuery("#apptHeader").click(function() {
      jQuery("#appointments").toggle();
      jQuery(".toggle_appt").toggle();
    });
  });
}

function selected_tab(idx){

  jQuery(function() {
    $tabs = jQuery('#child-tabs').tabs({
      cache: true
    });
    $tabs.tabs('select', idx );
  });
}

function matters_layout_init(){
  jQuery.noConflict();
  jQuery(document).ready(function(){
    //initLiviaFaceBox();
    //initAutoComplete();
    initLiviaMatterToggle();
    //initLiviaHint();
    //initToggle();
    jQuery("#apptToggle").click(function() {
      jQuery("#apptContent").toggle();
      jQuery(".toggle_appt").toggle();
    });
  });
    
  jQuery(function () {
    var tabContainers = jQuery('div#tabs > div');
    tabContainers.hide().filter(':first').show();
    jQuery('div#tabs ul.tabNavigation a').click(function () {
      tabContainers.hide();
      tabContainers.filter(this.hash).show();
      jQuery('div#tabs ul.tabNavigation a').removeClass('selected');
      jQuery(this).addClass('selected');
      return false;
    }).filter(':first').click();
  });
    
}

function intiToggleIt(){
  jQuery("#sumamrygridToggle").click(function(){
    jQuery("#saved_entries_div").toggle();
    jQuery(".toggle_saved_entries").toggle();
  });
}

function timeandexpenses_layout_init(){
    
  jQuery.noConflict();
  jQuery(document).ready(function(){
    intiToggleIt();
    jQuery("#viewHeader").click(function() {
      jQuery("#viewHeaderArea").toggle();
      jQuery(".toggle_view").toggle();
    });
  });
    
}

function matter_client_init(){
      jQuery(document).ready(
      function(){
        initLiviaFaceBox();
        initLiviaMatterToggle();    
      });    
}

/*function update_sub_product(product_id, subproducts)
{
    var chkprd = document.getElementById("chk_" + product_id);
    var sub_prd = product_id + "_product_sub_module";
    var div_subprd = document.getElementById(sub_prd);
    var prd_qty = document.getElementById("product_licence_qty_" + product_id);
    var txtcost = document.getElementById("txtcost_" + product_id);
    var txtrate = document.getElementById("txtrate_" + product_id);
    var totalamt = document.getElementById("txttotalcost");
    var total = 0;
    var total1 = 0;
    if (subproducts!='')
    {
        var sb = subproducts.split(',');        
        for(i=0;i<sb.length;i++)
        {
            var chkdep = document.getElementById("chk_" + sb[i]);
            var depend_mod = document.getElementById(sb[i] + "_product_sub_module");
            var depend_qty = document.getElementById("product_licence_qty_" + sb[i]);
            var txtsubcost = document.getElementById("txtcost_" + sb[i]);
            var txtsubrate = document.getElementById("txtrate_" + sb[i]);
            if (chkprd.checked==true)
            {
                chkdep.checked = true;                
                depend_mod.style.display = 'block';
                depend_qty.value = prd_qty.value;
                txtsubrate.value = (depend_qty.value*txtsubcost.value);
                total = total + parseInt(txtsubrate.value);
            }
            else
            {
                chkdep.checked = false;
                depend_mod.style.display = 'none';
                depend_qty.value = '';
                txtsubrate.value = '';
            }
     
        }
    }
  
    if (chkprd.checked==true)
    {
            div_subprd.style.display = 'block';
            txtrate.value = (prd_qty.value*txtcost.value);
            total1 = parseInt(txtrate.value);
    }
    else
    {
        div_subprd.style.display = 'none';
        prd_qty.value = '';
        txtrate.value = '';
    }    
    totalamt.value = (total+total1);
}*/

