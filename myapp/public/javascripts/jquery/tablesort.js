/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 jQuery(function () {
     jQuery('.tablesorter a').live("click", function () {     
     jQuery.get(this.href, null, null, 'script');
     return false;
   });
  jQuery.fragmentChange(true);
        jQuery(document).bind("fragmentChange.page", function () {
           jQuery.getScript(jQuery.queryString(document.location.href, { 'page': jQuery.fragment().page }));
       });

       if (jQuery.fragment().page) {
           jQuery(document).trigger("fragmentChange.page");
       }
 });