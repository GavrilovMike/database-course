Class GasStation.Backend.Tables.Drivers Extends %Persistent
{

Property Name As %String;

Property Car As GasStation.Backend.Tables.Cars;

Storage Default
{
<Data name="DriversDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Car</Value>
</Value>
</Data>
<DataLocation>^GasStation.BackendAA4D.DriversD</DataLocation>
<DefaultData>DriversDefaultData</DefaultData>
<IdLocation>^GasStation.BackendAA4D.DriversD</IdLocation>
<IndexLocation>^GasStation.BackendAA4D.DriversI</IndexLocation>
<StreamLocation>^GasStation.BackendAA4D.DriversS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
