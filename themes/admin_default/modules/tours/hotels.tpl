<!-- BEGIN: main -->
<div class="hotels">
	<div class="well">
		<form action="{NV_BASE_ADMINURL}index.php" method="get">
			<input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" /> <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" /> <input type="hidden" name="{NV_OP_VARIABLE}" value="{OP}" />
			<div class="row">
				<div class="col-xs-24 col-md-6">
					<div class="form-group">
						<input class="form-control" type="text" value="{Q}" name="q" maxlength="255" placeholder="{LANG.search_title}" />
					</div>
				</div>
				<div class="col-xs-12 col-md-6">
					<div class="form-group">
						<input class="btn btn-primary" type="submit" value="{LANG.search_submit}" /> <a href="{URL_HOTEL_ADD}" class="btn btn-success">{LANG.hotels_add}</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<colgroup>
					<col class="w50" />
					<col />
					<col width="170" />
					<col width="200" />
					<col width="100" />
					<col width="150" />
				</colgroup>
				<thead>
					<tr>
						<th class="text-center w50"><input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);"></th>
						<th>{LANG.title}</th>
						<th>{LANG.phone}</th>
						<th>Website</th>
						<th class="text-center">{LANG.active}</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<!-- BEGIN: generate_page -->
				<tfoot>
					<tr>
						<td class="text-center" colspan="7">{NV_GENERATE_PAGE}</td>
					</tr>
				</tfoot>
				<!-- END: generate_page -->
				<tbody>
					<!-- BEGIN: loop -->
					<tr>
						<td class="text-center"><input type="checkbox" class="post" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{VIEW.id}" name="idcheck[]"></td>
						<td>{VIEW.title}</td>
						<td>{VIEW.phone}</td>
						<td><a href="{VIEW.website}" target="_blank">{VIEW.website}</a></td>
						<td class="text-center"><input type="checkbox" name="status" id="change_status_{VIEW.id}" value="{VIEW.id}" {CHECK} onclick="nv_change_status({VIEW.id});" /></td>
						<td class="text-center"><i class="fa fa-edit fa-lg">&nbsp;</i> <a href="{VIEW.link_edit}">{LANG.edit}</a> - <em class="fa fa-trash-o fa-lg">&nbsp;</em> <a href="{VIEW.link_delete}" onclick="return confirm(nv_is_del_confirm[0]);">{LANG.delete}</a></td>
					</tr>
					<!-- END: loop -->
				</tbody>
			</table>
		</div>
	</form>
	<form class="form-inline">
		<select class="form-control input-sm" id="action">
			<!-- BEGIN: action -->
			<option value="{ACTION.key}">{ACTION.value}</option>
			<!-- END: action -->
		</select>
		<button class="btn btn-primary btn-sm" onclick="nv_hotels_action($('#action').val(), '{BASE_URL}', '{LANG.hotels_action_empty}'); return false;">{LANG.perform}</button>
	</form>
</div>

<script>
	function nv_change_status(id) {
		var new_status = $('#change_status_' + id).is(':checked') ? true : false;
		if (confirm(nv_is_change_act_confirm[0])) {
			var nv_timer = nv_settimeout_disable('change_status_' + id, 5000);
			$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=hotels&nocache=' + new Date().getTime(), 'change_status=1&id=' + id, function(res) {
				var r_split = res.split('_');
				if (r_split[0] != 'OK') {
					alert(nv_is_change_act_confirm[2]);
				}
			});
		}
		else{
			$('#change_status_' + id).prop('checked', new_status ? false : true );
		}
		return;
	}
</script>
<!-- END: main -->