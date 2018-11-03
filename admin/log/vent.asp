
<%
On Error Resume Next

V1= Request.QueryString("V1")
V2= Request.QueryString("V2")
V3= Request.QueryString("V3")
V4= Request.QueryString("V4")
V5= Request.QueryString("V5")
V6= Request.QueryString("V6")
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"


timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
sql="INSERT INTO vent_log(timestamp,VENT1, VENT2, VENT3, VENT4, VENT5, VENT6) VALUES ("
sql=sql+"'"+timestamp+"',"+V1+","+V2+","+V3+","+V4+","+V5+","+V6+")"
conn.Execute sql,recaffected
display_err 
conn.Close
Set conn=Nothing
reffer = Request.ServerVariables("HTTP_REFERER")
If InStr(1,reffer,"admin.asp") Then Response.Redirect("../admin.asp")

Function display_err
for each objErr in conn.Errors
  response.write("<p>")
  response.write("Description: ")
  response.write(objErr.Description & "<br>")
  response.write("Help context: ")
  response.write(objErr.HelpContext & "<br>")
  response.write("Help file: ")
  response.write(objErr.HelpFile & "<br>")
  response.write("Native error: ")
  response.write(objErr.NativeError & "<br>")
  response.write("Error number: ")
  response.write(objErr.Number & "<br>")
  response.write("Error source: ")
  response.write(objErr.Source & "<br>")
  response.write("SQL state: ")
  response.write(objErr.SQLState & "<br>")
  response.write("</p>")
Next

End Function 

%>
</body>
</html>
