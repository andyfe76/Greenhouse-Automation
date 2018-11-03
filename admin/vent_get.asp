<%
On Error Resume Next

Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM vent_log ORDER BY timestamp DESC", conn
display_err
txt=""
For a=2 To 7
 txt = txt + cstr(rs.Fields(a).value/100)+","
Next
txt=Left(txt,Len(txt)-1)
rs.Close
Set rs=Nothing
conn.Close
Set conn=Nothing
Response.Write("~")
Response.Write(txt)

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

