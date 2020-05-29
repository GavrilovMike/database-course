Class GasStation.Backend.Tables.Cars Extends %Persistent
{

Property Name As %String;

Property Owner As GasStation.Backend.Tables.Drivers;

Property Fuel As %String;

Storage Default
{
<Data name="CarsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Fuel</Value>
</Value>
<Value name="4">
<Value>Owner</Value>
</Value>
</Data>
<DataLocation>^GasStation.Backend.TaAA4D.CarsD</DataLocation>
<DefaultData>CarsDefaultData</DefaultData>
<IdLocation>^GasStation.Backend.TaAA4D.CarsD</IdLocation>
<IndexLocation>^GasStation.Backend.TaAA4D.CarsI</IndexLocation>
<StreamLocation>^GasStation.Backend.TaAA4D.CarsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
