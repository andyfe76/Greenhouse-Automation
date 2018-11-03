<%@ LANGUAGE="VBSCRIPT" %>
<html>
<head>
<meta NAME="GENERATOR" Content="SAPIEN Technologies PrimalScript 2011">
<meta HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
<title>Top menu</title>
</head>
<body>
<style>
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #006699; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 150% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #00557F; border-left: 1px solid #E1EEF4;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #E1EEf4; color: #00557F; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #006699;background: #E1EEf4;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;border: 1px solid #006699;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #00557F; color: #FFFFFF; background: none; background-color:#006699;}
a:link {color:inherit;}
a:visited {color:inherit;}
a:hover {color:#00FF00;}
a {text-decoration:none}
</style>
<%
On Error Resume Next
If Request.QueryString("menu")<>"" Then Session("menu")=Request.QueryString("menu")
menu=Session("menu")
If menu="" Then menu="status"
If Request.QueryString("submenu")<>"" Then Session("submenu")=Request.QueryString("submenu")
submenu=Session("submenu")

%>
<div class="datagrid" style="width:500px;">
<table>
<thead><tr>
<%If menu="status" Then%>
<td>Status</td>
<%Else%>
<th><a href="admin.asp?menu=status">Status</a></th>
<%End If%>
<%If menu="sensors" Then%>
<td>Sensors</td>
<%Else%>
<th><a href="admin.asp?menu=sensors">Sensors</a></th>
<%End If%>
<%If menu="control" Then%>
<td>Controls</td>
<%Else%>
<th><a href="admin.asp?menu=control">Controls</a></th>
<%End If%>
<%If menu="form" Then%>
<td>Forms</td>
<%Else%>
<th><a href="admin.asp?menu=form">Forms</a></th>
<%End If%>
<%If menu="config" Then%>
<td>Config</td>
<%Else%>
<th><a href="admin.asp?menu=config">Config</a></th>
<%End If%>
</tr>
</thead>
</table>
</div>
<%
if menu="status" Then
%>
<!-- #include file="status.asp" --> 
<%
End If




%>
<%
If menu="sensors" Then
%>
<div class="datagrid" style="width:500px;">
<table>
<thead><tr>
<%If submenu="TH" Then%>
<td>T & H</td>
<%Else%>
<th><a href="admin.asp?submenu=TH">T & H</a></th>
<%End If%>
<%If submenu="light" Then%>
<td>Light</td>
<%Else%>
<th><a href="admin.asp?submenu=light">Light</a></th>
<%End If%>
<%If submenu="irrig" Then%>
<td>Irrig</td>
<%Else%>
<th><a href="admin.asp?submenu=irrig">Irrig</a></th>
<%End If%>
</tr>
</thead>
</table>
</div>
<%
End If

If menu="sensors" And submenu="TH" Then
%>
<!-- #include file="log/th_show.asp" --> 
<%
End If

If menu="sensors" And submenu="light" Then
%>
<!-- #include file="log/light_show.asp" --> 
<%
End If

If menu="sensors" And submenu="irrig" Then
%>
<!-- #include file="log/irrig_show.asp" --> 
<%
End If

If menu="sensors" And submenu="water" Then
%>
<!-- #include file="log/water_show.asp" --> 
<%
End If


If menu="control" Then
%>
<div class="datagrid" style="width:500px;">
<table>
<thead><tr>
<%If submenu="vent" Then%>
<td>Vents</td>
<%Else%>
<th><a href="admin.asp?submenu=vent">Vents</a></th>
<%End If%>
<%If submenu="fan" Then%>
<td>Fans</td>
<%Else%>
<th><a href="admin.asp?submenu=fan">Fans</a></th>
<%End If%>
<%If submenu="mist" Then%>
<td>Mist</td>
<%Else%>
<th><a href="admin.asp?submenu=mist">Mist</a></th>
<%End If%>
<%If submenu="pump" Then%>
<td>Pump</td>
<%Else%>
<th><a href="admin.asp?submenu=pump">Pump</a></th>
<%End If%>
</tr>
</thead>
</table>
</div>
<%
End If

If menu="control" And submenu="vent" Then
%>
<!-- #include file="log/vent_show.asp" --> 
<%
End If

If menu="control" And submenu="fan" Then
%>
<!-- #include file="log/fan_show.asp" --> 
<%
End If

If menu="control" And submenu="mist" Then
%>
<!-- #include file="log/mist_show.asp" --> 
<%
End If

If menu="control" And submenu="pump" Then
%>
<!-- #include file="log/pump_show.asp" --> 
<%
End If


If menu="form" Then
%>
<div class="datagrid" style="width:500px;">
<table>
<thead><tr>
<%If submenu="water" Then%>
<td>Water</td>
<%Else%>
<th><a href="admin.asp?submenu=water">Water</a></th>
<%End If%>
<%If submenu="water_log" Then%>
<td>Water Log</td>
<%Else%>
<th><a href="admin.asp?submenu=water_log">Water Log</a></th>
<%End If%>
<%If submenu="tower" Then%>
<td>Tower</td>
<%Else%>
<th><a href="admin.asp?submenu=tower">Tower</a></th>
<%End If%>
<%If submenu="tower_log" Then%>
<td>Tower Log</td>
<%Else%>
<th><a href="admin.asp?submenu=tower_log">Tower Log</a></th>
<%End If%>
</tr>
</thead>
</table>
</div>
<%
End If

If menu="form" And submenu="water" Then
%>
<!-- #include file="log/water_form.asp" --> 
<%
End If

If menu="form" And submenu="water_log" Then
%>
<!-- #include file="log/water_show.asp" --> 
<%
End If

If menu="form" And submenu="tower" Then
%>
<!-- #include file="log/tower_form.asp" --> 
<%
End If

If menu="form" And submenu="tower_log" Then
%>
<!-- #include file="log/tower_show.asp" --> 
<%
End If

If menu="config" Then
%>
<!-- #include file="config_form.asp" --> 
<%
End If



%>

</body>
</html>
