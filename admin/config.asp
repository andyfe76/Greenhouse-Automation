<%@ LANGUAGE="VBSCRIPT" %>
<html>
<head>
<meta NAME="GENERATOR" Content="SAPIEN Technologies PrimalScript 2011">
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
<title>Config</title>
</head>
<body>

<!-- Insert HTML here -->
<%
On Error Resume Next

TH= Request.QueryString("TH")
IR= Request.QueryString("IR")
SR= Request.QueryString("SR")
SS= Request.QueryString("SS")
TD= Request.QueryString("TD")
HD= Request.QueryString("HD")
TN= Request.QueryString("TN")
HN= Request.QueryString("HN")
MM= Request.QueryString("MM")
Set conn=Server.CreateObject("ADODB.Connection")

conn.Open "refarm"


Response.Write(sql)
timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
sql="INSERT INTO config(timestamp,TH_interval, IRRIG_interval, SUNRISE, SUNSET, Tday, Hday, Tnight, Hnight, Max_mist_time) VALUES ("
sql=sql+"'"+timestamp+"',"+TH+","+IR+",'"+SR+"','"+SS+"',"+TD+","+HD+","+TN+","+HN+","+MM+")"
conn.Execute sql,recaffected
display_err 
conn.Close
Set conn=nothing
reffer = Request.ServerVariables("HTTP_REFERER")
If InStr(1,reffer,"admin.asp") Then Response.Redirect("admin.asp")
If InStr(1,reffer,"config_form.asp") Then Response.Redirect("config_form.asp")

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
