<br>
<form name="tower" action="log/tower.asp" method="GET">
<div class="datagrid" style="width:150px;">
<table>
<thead><tr>
<th></font>Tower Form</th>
</tr>
</thead>
</table>
</div>
<div class="datagrid" style="width:300px;">
<table>
<tbody>

<tr>
<td>Tower</td>
<td>
<select name="tower">
<%For a=1 To 10%>
<option value="L<%=a%>">L<%=a%></option>
<%Next%>
<%For a=1 To 10%>
<option value="R<%=a%>">R<%=a%></option>
<%Next%>
</select>
</tr>
<tr class="alt">
<td>Faza</td>
<td>
<select name="phase">
<option value="Plantare">Plantare</option>
<option value="Crestere">Crestere</option>
<option value="Inflorire">Inflorire</option>
<option value="Polenizare">Polenizare</option>
<option value="Fruct">Fruct</option>
<option value="Coacere">Coacere</option>
</select>
</tr>
<tr>
<td>Size</td>
<td><input type="text" name="size"></td>
</tr>
<tr class="alt">
<td>Operation</td>
<td>
<select name="op">
<option value="NULL">N/A</option>
<option value="Copilit">Copilit</option>
<option value="Culegere">Culegere</option>
</select>
</tr>
<tr>
<td>Yield</td>
<td><input type="text" name="yield"></td>
</tr>
<tr class="alt">
<td>Time(min)</td>
<td><input type="text" name="time"></td>
</tr>
<tr>
<tr class="alt">
<td>Comment</td>
<td><textarea rows="4" cols="20" name="comment"></textarea></td>
</tr>
<tr>
<td>&nbsp</td>
<td align="right"><input type="submit" value="Submit"></td>
</tr>

</tbody></table></div>

</form>

