<style>
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #006699; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 150% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #00557F; border-left: 1px solid #E1EEF4;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #E1EEf4; color: #00557F; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #006699;background: #E1EEf4;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;border: 1px solid #006699;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #00557F; color: #FFFFFF; background: none; background-color:#006699;}
</style>
<%
Set conn=Server.CreateObject("ADODB.Connection")
conn.Open "refarm"
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM th_log ORDER BY timestamp DESC", conn
t=(rs.Fields(2).value+rs.Fields(3).value+rs.Fields(4).value+rs.Fields(5).value)/4
h=(rs.Fields(6).value+rs.Fields(7).value+rs.Fields(8).value+rs.Fields(9).value)/4
a=now()-cdate(rs.Fields(1).value)
ago=cstr(Hour(a))+":"+CStr(Minute(a))

%>
<br>
<table border="0">
<tr>
<td>
<div class="datagrid" style="width:150px;">
<table>
<thead>
<tr><th>T&H</th><th>Value</th></tr></thead>
<tbody><tr><td>Avg TIN</td><td><%=t%></td></tr>
<tr class="alt"><td>Avg HIN</td><td><%=h%></td></tr>
<tr><td>TOUT</td><td><%=rs.Fields(10).value%></td></tr>
<tr class="alt"><td>HOUT</td><td><%=rs.Fields(11).value%></td></tr>
<tr><td>Ago</td><td><%=ago%></td></tr>
</tbody>
</table>
</div>
</td>
<%rs.close
rs.Open "SELECT * FROM vent_log ORDER BY timestamp DESC", conn
l=(rs.Fields(2).value+rs.Fields(3).value+rs.Fields(4).value+rs.Fields(5).value)/4
t=(rs.Fields(6).value+rs.Fields(7).value)/2
a=now()-cdate(rs.Fields(1).value)
ago=cstr(Hour(a))+":"+CStr(Minute(a))
%>
<td valign="top">
<div class="datagrid" style="width:150px;">
<table>
<thead>
<tr><th>Vent</th><th>Val</th></tr></thead>
<tbody><tr><td>Lateral</td><td><%=l%></td></tr>
<tr class="alt"><td>Top</td><td><%=t%></td></tr>
<tr><td>Ago</td><td><%=ago%></td></tr>
</tbody>
</table>
</div>
</td>
<%rs.close
rs.Open "SELECT * FROM fan_log ORDER BY timestamp DESC", conn
f=(rs.Fields(2).value+rs.Fields(3).value+rs.Fields(4).value)/3
a=now()-cdate(rs.Fields(1).value)
ago=cstr(Hour(a))+":"+CStr(Minute(a))
%>
<td valign="top">
<div class="datagrid" style="width:150px;">
<table>
<thead>
<tr><th>Fan</th><th>Val</th></tr></thead>
<tbody><tr><td>Status</td><td><%=Round(f)%></td></tr>
<tr class="alt"><td>Ago</td><td><%=ago%></td></tr>
</tbody>
</table>
</div>
</td>
<%rs.close
rs.Open "SELECT * FROM mist_log ORDER BY timestamp DESC", conn
a=now()-cdate(rs.Fields(1).value)
ago=cstr(Hour(a))+":"+CStr(Minute(a))
%>
<td valign="top">
<div class="datagrid" style="width:150px;">
<table>
<thead>
<tr><th>Mist</th><th>Val</th></tr></thead>
<tbody><tr><td>Status</td><td><%=rs.Fields(2).value%></td></tr>
<tr class="alt"><td>Ago</td><td><%=ago%></td></tr>
</tbody>
</table>
</div>
</td>
<%rs.close
rs.Open "SELECT * FROM irrig_log ORDER BY timestamp DESC", conn
a=now()-cdate(rs.Fields(1).value)
ago=cstr(Hour(a))+":"+CStr(Minute(a))
%>
</tr><tr>
<td valign="top"><br>
<div class="datagrid" style="width:150px;">
<table>
<thead>
<tr><th>Irrigation</th><th>Val</th></tr></thead>
<tbody><tr><td>Flow</td><td><%=rs.Fields(2).value%></td></tr>
<tr class="alt"><td>Temp</td><td><%=rs.Fields(3).value%></td></tr>
<tr><td>Ago</td><td><%=ago%></td></tr>
</tbody>
</table>
</div>
</td>
<%rs.close
rs.Open "SELECT * FROM water_log WHERE PH IS NOT NULL ORDER BY timestamp DESC", conn
ph=rs.Fields(2).value
a=now()-cdate(rs.Fields(1).value)
rs.Close
rs.Open "SELECT * FROM water_log WHERE EC IS NOT NULL ORDER BY timestamp DESC", conn
ec=rs.Fields(3).value
If now()-cdate(rs.Fields(1).value)<a Then a=now()-cdate(rs.Fields(1).value)
rs.Close
rs.Open "SELECT * FROM water_log WHERE LITERS IS NOT NULL ORDER BY timestamp DESC", conn
l=rs.Fields(6).value
If now()-cdate(rs.Fields(1).value)<a Then a=now()-cdate(rs.Fields(1).value)
rs.Close
ago=cstr(Hour(a))+":"+CStr(Minute(a))
%>

<td valign="top"><br>
<div class="datagrid" style="width:150px;">
<table>
<thead>
<tr><th>Water</th><th>Val</th></tr></thead>
<tbody><tr><td>PH</td><td><%=ph%></td></tr>
<tr class="alt"><td>EC</td><td><%=ec%></td></tr>
<tr><td>Liters</td><td><%=l%></td></tr>
<tr class="alt"><td>Ago</td><td><%=ago%></td></tr>
</tbody>
</table>
</div>
</td>
</tr><tr>
<%rs.close
rs.Open "SELECT * FROM light_log ORDER BY timestamp DESC", conn
lux=(rs.Fields(2).value+rs.Fields(3).value)/2
ir=(rs.Fields(4).value+rs.Fields(5).value)/2
full=(rs.Fields(6).value+rs.Fields(7).value)/2
a=now()-cdate(rs.Fields(1).value)
ago=cstr(Hour(a))+":"+CStr(Minute(a))
%>
<td valign="top"><br>
<div class="datagrid" style="width:150px;">
<table>
<thead>
<tr><th>Light</th><th>Val</th></tr></thead>
<tbody><tr><td>Avg LUX</td><td><%=lux%></td></tr>
<tr class="alt"><td>Avg IR</td><td><%=ir%></td></tr>
<tr><td>Avg FULL</td><td><%=full%></td></tr>
<tr class="alt"><td>Ago</td><td><%=ago%></td></tr>
</tbody>
</table>
</div>
</td>

</tr>
</table>
</body>
</html>
