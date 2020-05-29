Class GasStation.Backend.Tools.DataManager
{

ClassMethod AddDriver(DriverObj As GasStation.Backend.Tables.Drivers) As %Status
{
    set obj = ##class(GasStation.Backend.Tables.Drivers).%New()

    set obj.Name = DriverObj.Name

    set status = obj.%Save()
    return status
}

ClassMethod AddFeedback(FeedBack As %String) As %Status
{
    set obj = ##class(GasStation.Backend.Tables.Feedback).%New()

    set obj.Data = FeedBack
    set driverID = ##class(GasStation.Backend.Tools.Selectors).getLastDriverId()
    set driver = ##class(GasStation.Backend.Tables.Drivers).%OpenId(driverID)
    set obj.Driver = driver
    set status = obj.%Save()
    return status
}

ClassMethod AddCar(CarObj As GasStation.Backend.Tables.Cars) As %Status
{
    
    set obj = ##class(GasStation.Backend.Tables.Cars).%New()

    set obj.Name = CarObj.Name

    set status = obj.%Save()
    
    return status
}

ClassMethod LinkDriverWithCar(DriverName As %String, CarName As %String) As %Status
{
    set carID = ##class(GasStation.Backend.Tools.Selectors).getCarIdByName(CarName)
    set driverID = ##class(GasStation.Backend.Tools.Selectors).getDriverIdByName(DriverName)

    set driver = ##class(GasStation.Backend.Tables.Drivers).%OpenId(driverID)
    set car = ##class(GasStation.Backend.Tables.Cars).%OpenId(carID)

    set driver.Car = car
    set car.Owner = driver

    set obj1 = driver.%Save()
    set obj2 = car.%Save()
    set status = 1
    Return status
}

ClassMethod AddFuelsLogic() As %Status
{
    set obj1 = ##class(GasStation.Backend.Tables.Fuels).%New()

    set obj1.Name = "EURO 3"
    set obj1.AvailableForCar = "Ford"

    set status = obj1.%Save()

    set obj2 = ##class(GasStation.Backend.Tables.Fuels).%New()

    set obj2.Name = "EURO 5"
    set obj2.AvailableForCar = "Mercedes"

    set status = obj2.%Save()

    set obj3 = ##class(GasStation.Backend.Tables.Fuels).%New()

    set obj3.Name = "NO FUEL JUST VOLT"
    set obj3.AvailableForCar = "Tesla"

    set status = obj3.%Save()

    return status
}

ClassMethod DeletePump() As %Status
{
    set idToDel = ##class(GasStation.Backend.Tools.Selectors).getLastPumpId()
    set status = ##class(GasStation.Backend.Tables.Pumps).%DeleteId(idToDel)

    return status
}

ClassMethod CreatePump(PumpName As %String) As %Status
{
    set carID = ##class(GasStation.Backend.Tools.Selectors).getLastCarId()
    set driverID = ##class(GasStation.Backend.Tools.Selectors).getLastDriverId()

    set driver = ##class(GasStation.Backend.Tables.Drivers).%OpenId(driverID)
    set car = ##class(GasStation.Backend.Tables.Cars).%OpenId(carID)

    set obj = ##class(GasStation.Backend.Tables.Pumps).%New()
    set obj.Name = PumpName
    set obj.CarOwner = driver
    set obj.Status = "Already in Use"
    set obj.Car = car
    
    set status = obj.%Save()
    return status
}

}
