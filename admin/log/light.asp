<%@ LANGUAGE="VBSCRIPT" %>
<html>
<head>
<meta NAME="GENERATOR" Content="SAPIEN Technologies PrimalScript 2011">
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
<title>Light</title>
</head>
<body>

<!-- Insert HTML here -->
<%
On Error Resume Next

LUX1= Request.QueryString("LUX1")
LUX2= Request.QueryString("LUX2")
IR1= Request.QueryString("IR1")
IR2= Request.QueryString("IR2")
FULL1= Request.QueryString("FULL1")
FULL2= Request.QueryString("FULL2")
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"



timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
sql="INSERT INTO light_log(timestamp,LUX1, LUX2, IR1, IR2, FULL1, FULL2) VALUES ("
sql=sql+"'"+timestamp+"',"+LUX1+","+LUX2+","+IR1+","+IR2+","+FULL1+","+FULL2+")"
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
</body>
</html>
