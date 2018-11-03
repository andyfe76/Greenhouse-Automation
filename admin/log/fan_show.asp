<style>
        .iphone-toggle-buttons input[type="checkbox"] + span::after,
        .iphone-toggle-buttons input[type="radio"] + span::after
        {
            content: "off";
        }

        .iphone-toggle-buttons input[type="checkbox"]:checked + span::after,
        .iphone-toggle-buttons input[type="radio"]:checked + span::after
        {
            content: "on";
        }

        .iphone-toggle-buttons
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }

        .iphone-toggle-buttons
        {
            margin: 4px 0;
        }

        .iphone-toggle-buttons label,
        .iphone-toggle-buttons input[type="checkbox"] + span,
        .iphone-toggle-buttons input[type="radio"] + span,
        .iphone-toggle-buttons input[type="checkbox"] + span::before,
        .iphone-toggle-buttons input[type="radio"] + span::before,
        .iphone-toggle-buttons input[type="checkbox"] + span::after,
        .iphone-toggle-buttons input[type="radio"] + span::after
        {
            display: inline-block;
        }

        .iphone-toggle-buttons label,
        .iphone-toggle-buttons input[type="checkbox"] + span,
        .iphone-toggle-buttons input[type="radio"] + span
        {
            vertical-align: middle;
        }

        .iphone-toggle-buttons input[type="checkbox"] + span,
        .iphone-toggle-buttons input[type="radio"] + span,
        .iphone-toggle-buttons input[type="checkbox"] + span::before,
        .iphone-toggle-buttons input[type="radio"] + span::before,
        .iphone-toggle-buttons input[type="checkbox"] + span::after,
        .iphone-toggle-buttons input[type="radio"] + span::after
        {
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
        }

        .iphone-toggle-buttons input[type="checkbox"] + span::before,
        .iphone-toggle-buttons input[type="radio"] + span::before,
        .iphone-toggle-buttons input[type="checkbox"] + span::after,
        .iphone-toggle-buttons input[type="radio"] + span::after,
        .iphone-toggle-buttons input[type="checkbox"]:checked + span::before,
        .iphone-toggle-buttons input[type="radio"]:checked + span::before,
        .iphone-toggle-buttons input[type="checkbox"]:checked + span::after,
        .iphone-toggle-buttons input[type="radio"]:checked + span::after
        {
            top: 0;
        }

        .iphone-toggle-buttons input[type="checkbox"] + span::after,
        .iphone-toggle-buttons input[type="radio"] + span::after,
        .iphone-toggle-buttons input[type="checkbox"]:checked + span::before,
        .iphone-toggle-buttons input[type="radio"]:checked + span::before
        {
            right: 0;
        }

        .iphone-toggle-buttons input[type="checkbox"] + span::before,
        .iphone-toggle-buttons input[type="radio"] + span::before,
        .iphone-toggle-buttons input[type="checkbox"]:checked + span::after,
        .iphone-toggle-buttons input[type="radio"]:checked + span::after
        {
            left: 0;
        }

        .iphone-toggle-buttons input[type="checkbox"],
        .iphone-toggle-buttons input[type="radio"],
        .iphone-toggle-buttons input[type="checkbox"] + span::before,
        .iphone-toggle-buttons input[type="radio"] + span::before,
        .iphone-toggle-buttons input[type="checkbox"] + span::after,
        .iphone-toggle-buttons input[type="radio"] + span::after
        {
            position: absolute;
        }

        .iphone-toggle-buttons label
        {
            margin: 4px;
            cursor: pointer;
        }

        .iphone-toggle-buttons input[type="checkbox"],
        .iphone-toggle-buttons input[type="radio"]
        {
            filter: alpha(opacity=0);
            -moz-opacity: 0;
            -webkit-opacity: 0;
            opacity: 0;
        }

        .iphone-toggle-buttons input[type="checkbox"] + span,
        .iphone-toggle-buttons input[type="radio"] + span
        {
            width: 100px;
            height: 30px;
            font: bold 14px/30px Arial, Sans-serif;
            color: #8c8c8c;
            text-transform: uppercase;
            border: solid 1px #bcbbbb;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#c8c8c8", endColorstr="#f3f3f3");
            background: -moz-linear-gradient(top, #c8c8c8, #f3f3f3);
            background: -webkit-linear-gradient(top, #c8c8c8, #f3f3f3);
            background: -o-linear-gradient(top, #c8c8c8, #f3f3f3);
            background: -ms-linear-gradient(top, #c8c8c8, #f3f3f3);
            background: linear-gradient(top, #c8c8c8, #f3f3f3);
            position: relative;
            text-indent: -9999px;
        }

        .iphone-toggle-buttons input[type="checkbox"] + span::before,
        .iphone-toggle-buttons input[type="radio"] + span::before
        {
            content: "";
            width: 40%;
            height: 29px;
            border-top: solid 1px #fff;
            border-right: solid 1px #bebebe;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#cfcfcf", endColorstr="#f9f9f9");
            background: -moz-linear-gradient(top, #cfcfcf, #f9f9f9);
            background: -webkit-linear-gradient(top, #cfcfcf, #f9f9f9);
            background: -o-linear-gradient(top, #cfcfcf, #f9f9f9);
            background: -ms-linear-gradient(top, #cfcfcf, #f9f9f9);
            background: linear-gradient(top, #cfcfcf, #f9f9f9);
            -moz-box-shadow: 1px 0 1px #bebebe;
            -webkit-box-shadow: 1px 0 1px #bebebe;
            box-shadow: 1px 0 1px #bebebe;
        }

        .iphone-toggle-buttons input[type="checkbox"] + span::after,
        .iphone-toggle-buttons input[type="radio"] + span::after
        {
            text-indent: 0;
            width: 62%;
            height: 32px;
            text-align: center;
        }

        .iphone-toggle-buttons input[type="checkbox"]:checked + span,
        .iphone-toggle-buttons input[type="radio"]:checked + span
        {
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#1b45bd", endColorstr="#5d96ea");
            background: -moz-linear-gradient(top, #1b45bd, #5d96ea);
            background: -webkit-linear-gradient(top, #1b45bd, #5d96ea);
            background: -o-linear-gradient(top, #1b45bd, #5d96ea);
            background: -ms-linear-gradient(top, #1b45bd, #5d96ea);
            background: linear-gradient(top, #1b45bd, #5d96ea);
            color: #fff;
            text-shadow: -1px -1px #0d2046;
        }

        .iphone-toggle-buttons input[type="checkbox"]:checked + span::before,
        .iphone-toggle-buttons input[type="radio"]:checked + span::before
        {
            left: auto;
            -moz-box-shadow: -2px 0 1px #3a5e91;
            -webkit-box-shadow: -2px 0 1px #3a5e91;
            box-shadow: -2px 0 1px #3a5e91;
        }

        .iphone-toggle-buttons input[type="checkbox"]:checked + span::after,
        .iphone-toggle-buttons input[type="radio"]:checked + span::after
        {
            border-top: solid 1px #0f2a4f;
            border-bottom: solid 1px #0f2a4f;
            border-left: solid 1px #2c5496;
            height: 30px;
            top: -1px;
            left: -1px;
            -moz-border-radius: 4px 0 0 4px;
            -webkit-border-radius: 4px 0 0 4px;
            border-radius: 4px 0 0 4px;
        }

        .browser-support li.ie6,
        .browser-support li.ie7,
        .browser-support li.ie8
        {
            display: none;
        }
        </style>
<script>
function chg() {
	txt="log/fan.asp?F1=";
	if (V1.checked==true) {txt=txt+"100";} else {txt=txt+"0"}
	txt=txt+"&F2=";
	if (V2.checked==true) {txt=txt+"100";} else {txt=txt+"0"}
	txt=txt+"&F3=";
	if (V3.checked==true) {txt=txt+"100";} else {txt=txt+"0"}
	txt=txt+"&F4=";
	if (V4.checked==true) {txt=txt+"100";} else {txt=txt+"0"}
	window.location=txt;
}
</script>
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
set rs=Server.CreateObject("ADODB.recordset")
row_max=0
rs.Open "SELECT COUNT(ID) FROM fan_log",conn
row_max=rs.Fields(0)
rs.Close
rs.Open "SELECT * FROM fan_log ORDER BY timestamp DESC", conn
%>
<div class="datagrid" style="width:700px;">
<table>
<thead><tr>
<th>Time</th>
<th align="center">FAN1</th>
<th align="center">FAN2</th>
<th align="center">FAN3</th>
<th align="center">FAN4</th>

</tr>
<%If pg=1 Then%>
<tr>
<th>&nbsp</th>

<th>
<div class="iphone-toggle-buttons">
<label for="V1">
<input type="checkbox" name="V1" id="V1" onchange="chg()" <%If rs.Fields(2).value=100 Then%>checked="checked"<%End If%> />
<span>checkbox 0</span>
</label>
</div>
</th> 

<th>
<div class="iphone-toggle-buttons">
<label for="V2">
<input type="checkbox" name="V2" id="V2" onchange="chg()" <%If rs.Fields(3).value=100 Then%>checked="checked"<%End If%> />
<span>checkbox 0</span>
</label>
</div>
</th> 

<th>
<div class="iphone-toggle-buttons">
<label for="V3">
<input type="checkbox" name="V3" id="V3" onchange="chg()" <%If rs.Fields(4).value=100 Then%>checked="checked"<%End If%> />
<span>checkbox 0</span>
</label>
</div>
</th> 

<th>
<div class="iphone-toggle-buttons">
<label for="V4">
<input type="checkbox" name="V4" id="V4" onchange="chg()" <%If rs.Fields(5).value=100 Then%>checked="checked"<%End If%> />
<span>checkbox 0</span>
</label>
</div>
</th> 
</tr>
<%End If%>
</thead>
<tbody>
<%Do
t1 = CInt((pg-1)*row_pg)
 t2 = CInt(pg*row_pg-1)
 If row_tmp >= t1 Then
 If row_tmp <= t2 Then
If rs.Fields(0) Mod 2 Then
 %>
 <tr class="alt">
 <%For a=1 To 5%>
 <td align="center"><%=rs.Fields(a).Value%></td>
 <%
 Next
Else
 %>
 <tr>
 <%For a=1 To 5%>
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
<a href="admin.asp?submenu=fan&page=
<%
=pg-1
%>
">Prev</a>&nbsp&nbsp&nbsp
<%End If
t1 = CInt(pg * row_pg)
t2 = CInt (row_max)
If t1 < t2 Then%>
<a href="admin.asp?submenu=fan&page=
<%
=pg+1
%>
">Next</a>
<%End If%>
</div>


