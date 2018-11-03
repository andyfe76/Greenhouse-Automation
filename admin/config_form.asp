<br>
<form name="config" action="config.asp" method="GET">
<div class="datagrid" style="width:150px;">
<table>
<thead><tr>
<th></font>Config</th>
</tr>
</thead>
</table>
</div>
<div class="datagrid" style="width:250px;">
<table>
<tbody>
<%
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM config ORDER BY timestamp DESC", conn
%>
<tr>
<td>T&H Interval</td>
<td><input type="text" name="TH" value="<%=rs.fields(2).Value%>"></td>
</tr>
<tr class="alt">
<td>Irrig Interval</td>
<td><input type="text" name="IR" value="<%=rs.fields(3).Value%>"></td>
</tr>
<tr>
<td>Sunrise</td>
<%
txt=rs.fields(4).Value
%>
<td><input type="text" name="SR" value="<%=txt%>"></td>
</tr>
<tr class="alt">
<td>Sunset</td>
<%
txt=rs.fields(5).Value
%>
<td><input type="text" name="SS" value="<%=txt%>"></td>
</tr>
<tr>
<td>T Day</td>
<td><input type="text" name="TD" value="<%=rs.fields(6).Value%>"></td>
</tr>
<tr class="alt">
<td>H Day</td>
<td><input type="text" name="HD" value="<%=rs.fields(7).Value%>"></td>
</tr>
<tr>
<td>T Night</td>
<td><input type="text" name="TN" value="<%=rs.fields(8).Value%>"></td>
</tr>
<tr class="alt">
<td>H Night</td>
<td><input type="text" name="HN" value="<%=rs.fields(9).Value%>"></td>
</tr>
<tr>
<td>Max mist time</td>
<td><input type="text" name="MM" value="<%=rs.fields(10).Value%>"></td>
</tr>
<tr>
<td>&nbsp</td>
<td align="right"><input type="submit" value="Submit"></td>
</tr>
<%
rs.Close
%>
</tbody></table></div>

</form>

<%
'Set conn=Server.CreateObject("ADODB.Connection")
'conn.Open "refarm"
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM config ORDER BY timestamp DESC", conn
%>
<div class="datagrid" style="width:850px;">
<table>
<thead><tr>
<th>Time</th>
<th align="center">TH Interval</th>
<th align="center">IRRIG Interval</th>
<th align="center">Sunrise</th>
<th align="center">Sunset</th>
<th align="center">T Day</th>
<th align="center">H Day</th>
<th align="center">T Night</th>
<th align="center">H Night</th>
<th align="center">Max mist</th>
</tr></thead>
<tbody>
<%Do
If rs.Fields(0) Mod 2 Then
 %>
 <tr class="alt">
 <%For a=1 To 10
   txt=rs.Fields(a).Value
   If a=4 Or a=5 Then
    txt=rs.fields(a).Value
   End If 
   %>
 <td align="center"><%=txt%></td>
 <%
 Next
Else
 %>
 <tr>
 <%For a=1 To 10
   txt=rs.Fields(a).Value
   If a=4 Or a=5 Then
    txt=rs.fields(a).Value
   End If 
 %>
 <td align="center"><%=txt%></td>
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
</body>
</html>
