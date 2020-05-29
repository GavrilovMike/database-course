Class GasStation.Pages.Index Extends %CSP.Page
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
	 	<img src="images/petrol-station-header.jpg" alt="Our GasStation" width="100%" height="400">
       <script type="text/javascript" src="webix/webix.min.js" ></script>
       <link rel="stylesheet" type="text/css" href="webix/webix.min.css">
       <link rel="stylesheet" href="https://cdn.materialdesignicons.com/2.7.94/css/materialdesignicons.css?v=7.2.0" type="text/css" charset="utf-8">
     </head>

 >
 
 Quit $$$OK
}

ClassMethod body() As %Status
{
   &JS<
    <script type="text/javascript">
    

   	var ui_template = {
		   	css: { margin:"auto" },
			rows:[
			{	gravity:1,
				view:"tabbar",
				multiview:true,
				value:"infopage",
				
				options:[
					{id:"reg", value:"Register the Driver and Car"},
					{id:"info", value:"Information about Fuel"},
					{id:"fit", value: "Filling Tab"},
					{id:"feedback", value: "Feedback"}
				],
			},
			{
				 animate:true, 
				 cells:[
				 {
					 id:"reg", view:"form", gravity:0.5, select:true, position:"right", css: { margin:"auto" },
					   elements:[
						{view: "text", width:"500", name: "driver_name", position:"center",required:true, validate:webix.rules.isNotEmpty, label: "Driver name", labelWidth:100},
						{view: "text", width:"500", name: "car", position:"center", required:true,validate:webix.rules.isNotEmpty, label: "Car", labelWidth:100},
						{view:"button", width:"500", value:"Register", id:"btn", click:function(){
							var form = this.getParentView();
							var values = this.getFormView().getValues();

							if (form.validate()) {
								webix.ajax().post("/gasstation/registration", values).then(function(response){
									var body = response.text();
										if(body=="1"){
											webix.message("New driver added");
										} else{
											webix.message("Sometging goes wrong");
										}
									}
							);
							}
							else {
								webix.message({ type:"error", text:"Form data is invalid: Empty fields" });
							}
							
							
						}}
					],
					rules:{
    "driver_name":webix.rules.isNotEmpty,
    "car":webix.rules.isNotEmpty
  },
  elementsConfig:{
    labelPosition:"top"
  }
				 },
				 
				 
				 {
					  id:"info", 
					  view:"form",  
					  css: { margin:"auto" },
					  elements:[
						{view:"button", width:"500",value:"Fit Fuels", id:"fitFuels",
							click:function(){
							var values = this.getFormView().getValues();
							webix.ajax().post("/gasstation/fuel-info").then(function(response){
								var body = response.text();
									if(body==1){
										webix.message("Successfully configured");
										var fuelPage = 'GasStation.Pages.FuelPage.cls';
										location.href = fuelPage;
									} else{
										webix.message("Failed to configure, please try another login");
									}
								}
							);
						}
					},
						{view: "text", width:"500", name: "car", position:"center", label: "Car", labelWidth:100},
						{view:"button", width:"500",value:"Check", id:"checkButton",
							click:function(){
								var values = this.getFormView().getValues();
							webix.ajax().post("/gasstation/check", values).then(function(response){
								var body = response.text();
									if(body==""){
										webix.message("Sorry there is no data for you car");	
									} else{
										webix.message(body + " is recommended type of Fuel for your car");
									}
								}
							);
						}
							
							
							
						}
					
				],
					
				},

				{
					  id:"fit", 
					  view:"form",  
					  elements:[
						{
							view: "text", width:"500", name: "pump", position:"center", label: "Pump Name", labelWidth:100},
							{view:"button", width:"500",value:"Fill the Car ", id:"fill",
							click:function(){
							var form = this.getParentView();
							var values = this.getFormView().getValues();
							webix.message("value => " + values);
							if (form.validate())
							{webix.ajax().post("/gasstation/fill-the-car", values).then(function(response){
								var body = response.text();
									if(body==1){
										webix.message("Filling has began! Press Finish Filling Button to finish");
										var pumpPage = 'GasStation.Pages.PumpPage.cls';
										location.href = pumpPage;
									} else{
										webix.message("Failed to fill your car, please try again later");
									}
								}
							);
								}
								else {
									webix.message({ type:"error", text:"Form data is invalid: Empty fields" });
								}
						}
					
					},
					{view:"button", width:"500",value:"Finish Filling", id:"stop",
							click:function(){
							
							webix.ajax().post("/gasstation/delete").then(function(response){
								var body = response.text();
									if(body==1){
										webix.message("FINISHED!!!");
										var pumpPage = 'GasStation.Pages.PumpPage.cls';
										location.href = pumpPage;
									} else{
										webix.message("Something goes wrong");
									}
								}
							);
								
						}
					
					}
					
				],
				rules:{
    "pump":webix.rules.isNotEmpty,
  },	
				},
				{
					  id:"feedback", 
					  view:"form",  
					  elements:[
						{
							view: "textarea", height:"150", name: "feed", position:"center", label: "Your Feelings", labelWidth:100},
							{view:"button", width:"500",value:"Send Feedback", id:"feed",
							click:function(){
							var form = this.getParentView();
							var values = this.getFormView().getValues();
							webix.message("value => " + values);
							if (form.validate())
							{webix.ajax().post("/gasstation/feedback", values).then(function(response){
								var body = response.text();
									if(body==1){
										webix.message("Thank You for You Feedback!");
									} else{
										webix.message("Something went wrong :(");
									}
								}
							);
								}
								else {
									webix.message({ type:"error", text:"Form data is invalid: Empty fields" });
								}
						}
					
					},
					{view:"button", width:"500",value:"View Feedback", id:"view_feed",
							click:function(){
							var feedPage = 'GasStation.Pages.FeedBackPage.cls';
							location.href = feedPage;
						}
					
					},
					
					
				],
				rules:{
    "feed":webix.rules.isNotEmpty,
  },	
				},
			]
		}
	], 
	

		
				
		};
		
    
    webix.ready(function(){
      webix.ui(ui_template);
    });
    </script>
  >
}

ClassMethod footer() As %Status
{
 &HTML<
   </body>
   
   </html>
 >
 Quit $$$OK
}

}
