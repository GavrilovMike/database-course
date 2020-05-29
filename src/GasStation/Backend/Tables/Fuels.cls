Class GasStation.Backend.Tables.Fuels Extends %Persistent
{

Property Name As %String;

Property AvailableForCar As %String;

ClassMethod List(data) As %String
{
	set data = []
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT id, Name, AvailableForCar
	    INTO :id, :name, :afc
	    FROM GasStation_Backend_Tables.Fuels
 	)
 	//вариант в массив INTO :singleUserData()
 	&sql(OPEN MyCursor)
 	
  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit

    set obj = {"id": (id), "name": (name), "afc": (afc)}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)
 	
 	quit
}

Storage Default
{
<Data name="FuelsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>AvailableForCar</Value>
</Value>
</Data>
<DataLocation>^GasStation.Backend.TAA4D.FuelsD</DataLocation>
<DefaultData>FuelsDefaultData</DefaultData>
<IdLocation>^GasStation.Backend.TAA4D.FuelsD</IdLocation>
<IndexLocation>^GasStation.Backend.TAA4D.FuelsI</IndexLocation>
<StreamLocation>^GasStation.Backend.TAA4D.FuelsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
