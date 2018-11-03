<%
'On Error Resume Next

TIN1= Request.QueryString("TIN1")
TIN2= Request.QueryString("TIN2")
TIN3= Request.QueryString("TIN3")
TIN4= Request.QueryString("TIN4")
HIN1= Request.QueryString("HIN1")
HIN2= Request.QueryString("HIN2")
HIN3= Request.QueryString("HIN3")
HIN4= Request.QueryString("HIN4")
TAVG= Request.QueryString("TAVG")
HAVG= Request.QueryString("HAVG")
TOUT= Request.QueryString("TOUT")
HOUT= Request.QueryString("HOUT")

Set conn=Server.CreateObject("ADODB.Connection")

conn.Open "refarm"

timestamp=CStr(Year(Now()))+"-"+CStr(Month(Now()))+"-"+cstr(Day(Now()))+" "+cstr(Hour(Now()))+":"+cstr(Minute(Now()))+":"+cstr(Second(Now()))
'sql="INSERT INTO th_log(timestamp,TIN1, TIN2, TIN3, TIN4, HIN1, HIN2, HIN3, HIN4, TAVG, HAVG, TOUT, HOUT) VALUES ("
'sql=sql+"'"+timestamp+"',"+TIN1+","+TIN2+","+TIN3+","+TIN4+","
'sql=sql+HIN1+","+HIN2+","+HIN3+","+HIN4+","+TAVG+","+HAVG+","+TOUT+","+HOUT+")"
sql="INSERT INTO th_log(timestamp,TIN1, TIN2, TIN3, TIN4) VALUES ("
sql=sql+"'"+timestamp+"',"+TIN1+","+TIN2+","+TIN3+","+TIN4+")"
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
