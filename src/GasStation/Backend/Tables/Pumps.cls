Class GasStation.Backend.Tables.Pumps Extends %Persistent
{

Property Name As %String;

Property Car As GasStation.Backend.Tables.Cars;

Property CarOwner As GasStation.Backend.Tables.Drivers;

Property Status As %String;

Index PumpName On Name [ Unique ];

ClassMethod List(data) As %String
{
	set data = []
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT id, Name, Car -> Name, CarOwner -> Name, Status
	    INTO :id, :name, :car, :owner, :status
	    FROM GasStation_Backend_Tables.Pumps where Status = 'Already in Use'
 	)
 	//вариант в массив INTO :singleUserData()
 	&sql(OPEN MyCursor)
 	
  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit

    set obj = {"id": (id), "name": (name), "car": (car), "owner": (owner), "status":(status)}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)
 	
 	quit
}

Storage Default
{
<Data name="PumpsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Car</Value>
</Value>
<Value name="4">
<Value>CarOwner</Value>
</Value>
<Value name="5">
<Value>Status</Value>
</Value>
</Data>
<DataLocation>^GasStation.Backend.TAA4D.PumpsD</DataLocation>
<DefaultData>PumpsDefaultData</DefaultData>
<IdLocation>^GasStation.Backend.TAA4D.PumpsD</IdLocation>
<IndexLocation>^GasStation.Backend.TAA4D.PumpsI</IndexLocation>
<StreamLocation>^GasStation.Backend.TAA4D.PumpsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
