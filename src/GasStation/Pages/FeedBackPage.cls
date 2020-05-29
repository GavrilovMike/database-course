Class GasStation.Pages.FeedBackPage Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
      
       do ..header()
       do ..body()
       do ..footer()
       return $$$OK
}

ClassMethod header() As %Status
{
 &HTML<
   <html>
     <head>
       <script type="text/javascript" src="webix/webix.min.js" ></script>
       <link rel="stylesheet" type="text/css" href="webix/webix.min.css">
       <link rel="stylesheet" href="https://cdn.materialdesignicons.com/2.7.94/css/materialdesignicons.css?v=7.2.0" type="text/css" charset="utf-8">
     </head>
	 <body>

 >
 
 Quit $$$OK
}

ClassMethod body() As %Status
{

  write "Feedback"
	&JS<
    <script type="text/javascript">

	
	var ui_template ={
	id: "feedback_list",
    view:"datatable", //https://docs.webix.com/api__refs__ui.datatable.html
    columns:[
        { id:"author",    header:"Author",              width:250},
        { id:"text",   header:"Feedback",    width:200},
    ],
    url:function(){
					$$("feedback_list").load("/gasstation/feedback-table");
				},
	
	}

	webix.ready(function(){
      webix.ui(ui_template);
    });
    </script>
  >
}

ClassMethod footer() As %Status
{
 &HTML<
   </body></html>
 >
 Quit $$$OK
}

}
