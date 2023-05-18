<!-- BEGIN: main -->
<div id="ablist">
	<input name="addNew" type="button" value="{add}" class="btn btn-primary" />
</div>
<div class="myh3">
	{tieude}
</div>
<div id="pageContent"></div>
<script type="text/javascript">
//<![CDATA[
$(function() {
	$("div#pageContent").load("{MODULE_URL}={op}{op1}&list&random=" + nv_randomPassword(10))
});
$("input[name=addNew]").click(function() {
	window.location.href = "{MODULE_URL}={op}{op1}&add";
	return false
});
//]]>
</script>
<!-- END: main -->
<!-- BEGIN: action -->
<div id="pageContent">
	<form class="form-inline" id="addCat" method="post" action="{ACTION_URL}">
		<h3 class="myh3">{PTITLE}</h3>
		<table class="table table-striped table-bordered table-hover">
			<col style="width:200px" />
			<tbody>
				<tr>
					<td>{LANG.title} <span style="color:red">*</span></td>
					<td><input title="{LANG.title}" class="form-control txt" type="text" name="title" value="{CAT.title}" maxlength="255" /></td>
				</tr>
    			<!-- BEGIN: province -->
				<tr>
					<td>{LANG.pro} <span style="color:red">*</span></td>
					<td>
                        <!-- BEGIN: add_province -->
    					<select name="pro" class="form-control newWeight">
    						<option value="">{LANG.choprovince}</option>
    						<!-- BEGIN: option -->
    						<option value="{NEWWEIGHT.id}"{NEWWEIGHT.selected}>{NEWWEIGHT.title}</option>
    						<!-- END: option -->
    					</select>
                        <!-- END: add_province -->
                        <!-- BEGIN: edit_province --> {province} <input type="hidden" name="pro" value="{CAT.idprovince}" maxlength="255" /><!-- END: edit_province -->
                    </td>
				</tr>
				<!-- END: province -->
				<!-- BEGIN: district -->
				<tr>
					<td>{LANG.dis} <span style="color:red">*</span></td>
					<td><!-- BEGIN: add_district -->
					<select name="dis" class="form-control newWeight">
						<option value="">-- {LANG.chodis} --</option>
						<!-- BEGIN: option -->
						<option value="{NEWWEIGHT.id}"{NEWWEIGHT.selected}>{NEWWEIGHT.title}</option>
						<!-- END: option -->
					</select><!-- END: add_district --><!-- BEGIN: edit_district --> {district} <input type="hidden" name="dis" value="{CAT.iddistrict}" maxlength="255" /><!-- END: edit_district --></td>
				</tr>
				<!-- END: district -->
			</tbody>
		</table>
		<input type="hidden" name="save" value="1" />
		<input class="btn btn-primary" name="submit" type="submit" value="{LANG.save}" />
	</form>
</div>

<script type="text/javascript">
	//<![CDATA[
	$("form#addCat").submit(function() {
		var a = $("input[name=title]").val();
		a = trim(a);
		$("input[name=title]").val(a);
		if (a == "") {
			alert("{LANG.errorIsEmpty}: " + $("input[name=title]").attr("title"));
			$("input[name=title]").select();
			return false
		}

		a = $(this).serialize();
		var c = $(this).attr("action");
		$("input[name=submit]").attr("disabled", "disabled");

		$.ajax({
			type : "POST",
			url : c,
			data : a,
			success : function(b) {
				var r_split = b.split("_");
				if (r_split[0] == 'OK') {
					if (r_split.length != 1) {
						window.location.href = "{MODULE_URL}={op}" + r_split[1];
					} else {
						window.location.href = "{MODULE_URL}={op}";
					}
				} else {
					alert(b);
					$("input[name=submit]").removeAttr("disabled")
				}
			}
		});
		return false
	});
	//]]>
</script>
<!-- END: action -->
<!-- BEGIN: list -->

<div class="table-responsive">
	<table class="table table-striped table-bordered table-hover">
		<col width="100" />
		<col width="350" />
		<thead>
			<tr>
				<th class="text-center"> {LANG.pos} </th>
				<th> {LANG.title} </th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<!-- BEGIN: loop -->
			<tr>
				<td class="text-center">
				<select name="p_{LOOP.id}" class="form-control newWeight">
					<!-- BEGIN: option -->
					<option value="{NEWWEIGHT.value}"{NEWWEIGHT.selected}>{NEWWEIGHT.value}</option>
					<!-- END: option -->
				</select></td>
				<td> {LOOP.alink1} {LOOP.title}{LOOP.alink2} </td>
				<td><a href="{MODULE_URL}={op}{op1}&edit&id={LOOP.id}"><em class="fa fa-edit"></em> {GLANG.edit}</a> | <a class="del" href="{LOOP.id}"><em class="fa fa-trash-o"></em> {GLANG.delete}</a></td>
			</tr>
			<!-- END: loop -->
		<tbody>
	</table>
</div>
<script type="text/javascript">
	//<![CDATA[
	$("a.del").click(function() {
		confirm("{LANG.delConfirm} ?") && $.ajax({
			type : "POST",
			url : "{MODULE_URL}={op}{op1}",
			data : "del=" + $(this).attr("href"),
			success : function(a) {
				if (a == "OK") {
					window.location.href = window.location.href;
				} else {
					alert(a)
				}
			}
		});

		return false

	});

	$("select.newWeight").change(function() {
		var a = $(this).attr("name").split("_"), c = $(this).val(), d = this;
		a = a[1];
		$(this).attr("disabled", "disabled");
		$.ajax({
			type : "POST",
			url : "{MODULE_URL}={op}{op1}",
			data : "cWeight=" + c + "&id=" + a,
			success : function(b) {
				if (b == "OK") {
					$("div#pageContent").load("{MODULE_URL}={op}{op1}&list&random=" + nv_randomPassword(10))
				} else {
					alert("{LANG.errorChangeWeight}")
				}

				$(d).removeAttr("disabled")
			}
		});

		return false
	});
	//]]>
</script>
<!-- END: list -->