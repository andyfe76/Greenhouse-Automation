<br>

<%
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM water_log ORDER BY timestamp DESC", conn
%>
<div class="datagrid" style="width:500px;">
<table>
<thead><tr>
<th>Time</th>
<th align="center">PH</th>
<th align="center">EC</th>
<th align="center">PH+</th>
<th align="center">PH-</th>
<th align="center">LITERS</th>
<th align="center">CHANGE</th>
</tr></thead>
<tbody>
<%Do
If rs.Fields(0) Mod 2 Then
 %>
 <tr class="alt">
 <%For a=1 To 7%>
 <td align="center"><%=rs.Fields(a).Value%></td>
 <%
 Next
Else
 %>
 <tr>
 <%For a=1 To 7%>
 <td align="center"><%=rs.Fields(a).Value%></td>
 <%
 Next
End if
%></tr><%
rs.MoveNext
Loop Until rs.EOF
rs.Close
Set rs=Nothing
conn.Close
Set conn=nothing
%>
</tbody></table></div>

