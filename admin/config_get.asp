<%
'On Error Resume Next
Response.Write("~")
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM config ORDER BY timestamp DESC", conn
txt=""
For a=2 To 10
 txt = txt + cstr(rs.Fields(a).value)
 txt=txt+","
Next
txt=Left(txt,Len(txt)-1)
Response.Write(txt)
rs.Close
Set rs=Nothing
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
