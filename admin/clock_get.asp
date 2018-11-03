<%
On Error Resume Next
Response.Write("~")
Response.Write(Hour(Now))
Response.Write(",")
Response.Write(Minute(Now))
Response.Write(",")
Response.Write(Second(Now))
Response.Write(",")
Response.Write(Day(Now))
Response.Write(",")
Response.Write(Month(Now))
Response.Write(",")
Response.Write(Year(Now))
%>

