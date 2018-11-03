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


tower= Request.QueryString("tower")
phase= Request.QueryString("phase")
size= Request.QueryString("size")
op= Request.QueryString("op")
yield= Request.QueryString("yield")
timp= Request.QueryString("time")
comment= Request.QueryString("comment")

If size="" Then size="NULL"
If yield="" Then yield="NULL"
If timp="" Then timp="NULL"
If comment="" Then comment="NULL"
Set conn=Server.CreateObject("ADODB.Connection")

conn.Open "refarm"



timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
sql="INSERT INTO tower_log(timestamp,tower, phase, size, op, yield, timp, comment) VALUES ("
sql=sql+"'"+timestamp+"','"+tower+"','"+phase+"',"+size+",'"+op+"',"+yield+","+timp+",'"+comment+"')"
Response.Write(sql)
conn.Execute sql,recaffected
display_err 
conn.Close
Set conn=Nothing


reffer = Request.ServerVariables("HTTP_REFERER")
If InStr(1,reffer,"admin.asp") Then Response.Redirect("../admin.asp")
If InStr(1,reffer,"tower_form.asp") Then Response.Redirect("tower_form.asp")


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
