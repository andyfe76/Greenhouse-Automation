<%
'On Error Resume Next

F = Request.QueryString("F")
'P= Request.QueryString("P")
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"


timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
sql="INSERT INTO irrig_log(timestamp,FLOW) VALUES ("
sql=sql+"'"+timestamp+"',"+F+")"
Response.Write(sql)
conn.Execute sql,recaffected
display_err 
conn.Close
Set conn=nothing


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
