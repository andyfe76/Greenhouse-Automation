<html>
<head>
<meta NAME="GENERATOR" Content="SAPIEN Technologies PrimalScript 2011">
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
<title>Water</title>
</head>
<body>

<!-- Insert HTML here -->
<%
On Error Resume Next


PH= Request.QueryString("PH")
EC= Request.QueryString("EC")
PP= Request.QueryString("PP")
PM= Request.QueryString("PM")
L= Request.QueryString("L")
C= Request.QueryString("C")
If PH="" Then PH="NULL"
If EC="" Then EC="NULL"
If PP="" Then PP="NULL"
If PM="" Then PM="NULL"
If L="" Then L="NULL"
If C="" Then C="NULL"
Set conn=Server.CreateObject("ADODB.Connection")

conn.Open "refarm"


Response.Write(sql)
timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
sql="INSERT INTO water_log(timestamp,PH, EC, PH_plus, PH_minus, LITERS, CHG) VALUES ("
sql=sql+"'"+timestamp+"',"+PH+","+EC+","+PP+","+PM+","+L+","+C+")"
conn.Execute sql,recaffected
display_err 
conn.Close
Set conn=Nothing


reffer = Request.ServerVariables("HTTP_REFERER")
'Response.Write(reffer)
'If Session("menu")="form" And Session("sumbenu")="water" Then Response.Redirect("..\admin.asp")
If InStr(1,reffer,"admin.asp") Then Response.Redirect("../admin.asp")
If InStr(1,reffer,"water_form.asp") Then Response.Redirect("water_form.asp")


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
