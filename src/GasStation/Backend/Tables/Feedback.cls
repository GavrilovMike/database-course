Class GasStation.Backend.Tables.Feedback Extends %Persistent
{

Property Data As %String;

Property Driver As GasStation.Backend.Tables.Drivers;

ClassMethod List(data) As %String
{
	set data = []
	&sql(
	 	DECLARE MyCursor CURSOR FOR
	    SELECT Data, Driver -> Name
	    INTO :text, :author
	    FROM GasStation_Backend_Tables.FeedBack
 	)
 	//вариант в массив INTO :singleUserData()
 	&sql(OPEN MyCursor)
 	
  FOR { 
    &sql(FETCH MyCursor)
    if (SQLCODE) quit

    set obj = {"text": (text), "author": (author)}
    do data.%Push(obj)
 	}
 	&sql(CLOSE MyCursor)
 	
 	quit
}

Storage Default
{
<Data name="FeedbackDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Data</Value>
</Value>
<Value name="3">
<Value>Driver</Value>
</Value>
</Data>
<DataLocation>^GasStation.BackenAA4D.FeedbackD</DataLocation>
<DefaultData>FeedbackDefaultData</DefaultData>
<IdLocation>^GasStation.BackenAA4D.FeedbackD</IdLocation>
<IndexLocation>^GasStation.BackenAA4D.FeedbackI</IndexLocation>
<StreamLocation>^GasStation.BackenAA4D.FeedbackS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
