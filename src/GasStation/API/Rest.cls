Class GasStation.API.Rest Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/registration" Method="POST" Call="Registration"/>
  <Route Url="/fuel-table" Method="GET" Call="GetFuelInfo"/>
  <Route Url="/test" Method="GET" Call="Test"/>
  <Route Url="/fuel-info" Method="POST" Call="FuelInfo"/>
  <Route Url="/check" Method="POST" Call="CheckCar"/>
  <Route Url="/feedback" Method="POST" Call="Feedback"/>
  <Route Url="/fill-the-car" Method="POST" Call="FillTheCar"/>
  <Route Url="/pump-table" Method="GET" Call="GetPumpInfo"/>
  <Route Url="/delete" Method="POST" Call="Delete"/>
  <Route Url="/feedback-table" Method="GET" Call="GetFeedback"/>
  
  
</Routes>
}

/// "Возвращает" (печатает) "this is test"
ClassMethod Test() As %Status
{
    write "this is test"
    
    Return $$$OK
}

ClassMethod Registration() As %Status
{
    set driverObj = {}
    set carObj = {}
    set driverObj.Name = %request.Get("driver_name")
    set carObj.Name = %request.Get("car")
    
    set car = ##class(GasStation.Backend.Tools.DataManager).AddCar(carObj)
    set driver = ##class(GasStation.Backend.Tools.DataManager).AddDriver(driverObj)
    set linkDriverAndCar = ##class(GasStation.Backend.Tools.DataManager).LinkDriverWithCar(driverObj.Name, carObj.Name)

    if (car && driver ) {
        write 1
        set result = 1
    }
    Else {
        Set result = -1
    }
    

    Return result
}

ClassMethod FuelInfo() As %Status
{
    set result = ##class(GasStation.Backend.Tools.DataManager).AddFuelsLogic()
    if (result){
        Write 1
    }
    Else {
        Write -1
    }
    

    Return result
}

ClassMethod GetFuelInfo() As %Status
{
    
    do ##class(GasStation.Backend.Tables.Fuels).List(.fuelArray)
    write fuelArray.%ToJSON()
    Return $$$OK
}

ClassMethod GetFeedback() As %Status
{
    do ##class(GasStation.Backend.Tables.Feedback).List(.fuelArray)
    write fuelArray.%ToJSON()
    Return $$$OK
}

ClassMethod GetPumpInfo() As %Status
{
    
    do ##class(GasStation.Backend.Tables.Pumps).List(.fuelArray)
    write fuelArray.%ToJSON()
    Return $$$OK
}

ClassMethod CheckCar() As %Status
{
    set carObj = {}
    set carObj.Name = %request.Get("car")
    
    write ##class(GasStation.Backend.Tools.Selectors).SelectFuleInfoByCarName(carObj.Name)
    Return $$$OK
}

ClassMethod FillTheCar() As %Status
{
    set obj = {}
    set obj.Name = %request.Get("pump")
    do ##class(GasStation.Backend.Tools.DataManager).CreatePump(obj.Name)
    set result = 1
    write result
    Return result
}

ClassMethod Feedback() As %Status
{
   
    set obj = {}
    set obj.Name = %request.Get("feed")
    #; write obj
    write ##class(GasStation.Backend.Tools.DataManager).AddFeedback(obj.Name)
    Return $$$OK
}

ClassMethod Delete() As %Status
{
    set status = ##class(GasStation.Backend.Tools.DataManager).DeletePump()
    write status
    
    Return $$$OK
}

}
