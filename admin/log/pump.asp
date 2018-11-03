<%
On Error Resume Next

P= Request.QueryString("P")
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"


timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
sql="INSERT INTO pump_log(timestamp,PUMP) VALUES ("
sql=sql+"'"+timestamp+"',"+P+")"

conn.Execute sql,recaffected
display_err 
conn.Close
Set conn=nothing
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
