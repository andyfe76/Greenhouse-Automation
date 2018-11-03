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
set rs=Server.CreateObject("ADODB.recordset")
row_max=0
rs.Open "SELECT COUNT(ID) FROM irrig_log",conn
row_max=rs.Fields(0)
rs.Close
rs.Open "SELECT * FROM irrig_log ORDER BY timestamp DESC", conn
%>
<div class="datagrid" style="width:300px;">
<table>
<thead><tr>
<th>Time</th>
<th align="center">FLOW</th>
</tr></thead>
<tbody>
<%Do
t1 = CInt((pg-1)*row_pg)
 t2 = CInt(pg*row_pg-1)
 If row_tmp >= t1 Then
 If row_tmp <= t2 Then
If rs.Fields(0) Mod 2 Then
 %>
 <tr class="alt">
 <%For a=1 To 2%>
 <td align="center"><%=rs.Fields(a).Value%></td>
 <%
 Next
Else
 %>
 <tr>
 <%For a=1 To 2%>
 <td align="center"><%=rs.Fields(a).Value%></td>
 <%
 Next
End if
%></tr><%
End If
End If 
row_tmp=row_tmp+1
rs.MoveNext
Loop Until rs.EOF
rs.Close
Set rs=nothing
conn.close
set conn=nothing

%>
</tbody></table>
(<%=pg%>)
<%

If pg > 1 Then%>
<a href="admin.asp?submenu=irrig&page=
<%
=pg-1
%>
">Prev</a>&nbsp&nbsp&nbsp
<%End If
t1 = CInt(pg * row_pg)
t2 = CInt (row_max)
If t1 < t2 Then%>
<a href="admin.asp?submenu=irrig&page=
<%
=pg+1
%>
">Next</a>
<%End If%>
</div>


