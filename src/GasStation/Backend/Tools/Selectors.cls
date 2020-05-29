Class GasStation.Backend.Tools.Selectors
{

ClassMethod getCarIdByName(CarName As %String) As %Integer
{
    set car = {}
    &sql(
            SELECT id
            INTO :car
            FROM GasStation_Backend_Tables.Cars as c
            WHERE c.Name = :CarName
        )
    return car
}

ClassMethod getLastDriverId() As %Integer
{
    set driver = {}
    &sql(
            SELECT TOP 1 id
            INTO :driver
            FROM GasStation_Backend_Tables.Drivers as d
            ORDER BY ID DESC
        )
    return driver
}

ClassMethod getLastCarId() As %Integer
{
    set car = {}
    &sql(
            SELECT TOP 1 id
            INTO :car
            FROM GasStation_Backend_Tables.Cars as c
            ORDER BY ID DESC
        )
    return car
}

ClassMethod getDriverIdByName(DriverName As %String) As %Integer
{
    set driver = {}
    &sql(
            SELECT id
            INTO :driver
            FROM GasStation_Backend_Tables.Drivers as d
            WHERE d.Name = :DriverName
        )
    return driver
}

ClassMethod getLastPumpId() As %Integer
{
    set pump = {}
    &sql(
            SELECT TOP 1 id
            INTO :pump
            FROM GasStation_Backend_Tables.Pumps as p
            ORDER BY ID DESC
        )
    return pump
}

ClassMethod SelectFuleInfoByCarName(carname As %String) As %String
{
   set data = ""
	&sql(
	    SELECT Name
	    INTO :data
	    FROM GasStation_Backend_Tables.Fuels WHERE AvailableForCar = :carname
 	)	
    return data
}

}
