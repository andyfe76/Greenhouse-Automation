<br>
<%
pg_tmp=Request.QueryString("page")
If pg_tmp="" Then 
 pg=1
Else
 pg=CInt(pg_tmp)
End If 
row_tmp=0
row_pg=20
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"
Set rs=Server.CreateObject("ADODB.recordset")
row_max=0
rs.Open "SELECT COUNT(ID) FROM th_log",conn
row_max=rs.Fields(0)
rs.Close

rs.Open "SELECT * FROM th_log ORDER BY timestamp DESC",conn,3
%>
<div class="datagrid" style="width:800px;">
<table>
<thead><tr>
<th>Time</th>
<th align="center">TIN1</th>
<th align="center">TIN2</th>
<th align="center">TIN3</th>
<th align="center">TIN4</th>
<th align="center">HIN1</th>
<th align="center">HIN2</th>
<th align="center">HIN3</th>
<th align="center">HIN4</th>
<th align="center">TAVG</th>
<th align="center">HAVG</th>
<th align="center">TOUT</th>
<th align="center">HOUT</th>
</tr></thead>
<tbody>
<%
 Do
 t1 = CInt((pg-1)*row_pg)
 t2 = CInt(pg*row_pg-1)
 If row_tmp >= t1 Then
 If row_tmp <= t2 Then
  If rs.Fields(0) Mod 2 Then
  %>
  <tr class="alt">
  <%
  d=rs.fields(1).value
  txt=cstr(day(d))+"/"+cstr(Month(d))+" "
  txt=txt+CStr(Hour(d))+":"+CStr(Minute(d))+":"+CStr(Second(d))
  %>
  <td align="center"><%=txt%></td>
  <%
  For a=2 To 13%>
   <td align="center"><%=rs.Fields(a).Value%></td>
   <%
  Next
  Else
  %>
  <tr>
  <%
  d=rs.fields(1).value
  txt=cstr(day(d))+"/"+cstr(Month(d))+" "
  txt=txt+CStr(Hour(d))+":"+CStr(Minute(d))+":"+CStr(Second(d))
  %>
  <td align="center"><%=txt%></td>
  <%
  For a=2 To 13%>
   <td align="center"><%=rs.Fields(a).Value%></td>
   <%
  Next
 End If
%></tr><%
End If
End If 
rs.MoveNext
row_tmp=row_tmp+1

Loop Until rs.EOF
rs.Close
Set rs=Nothing
conn.Close
Set conn=nothing
%>
</tbody></table>
(<%=pg%>)
<%

If pg > 1 Then%>
<a href="admin.asp?submenu=TH&page=
<%
=pg-1
%>
">Prev</a>&nbsp&nbsp&nbsp
<%End If
t1 = CInt(pg * row_pg)
t2 = CInt (row_max)
If t1 < t2 Then%>
<a href="admin.asp?submenu=TH&page=
<%
=pg+1
%>
">Next</a>
<%End If%>

</div>
