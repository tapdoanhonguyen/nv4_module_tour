<!-- BEGIN: main -->
<div class="well">
	<form action="{NV_BASE_ADMINURL}index.php" method="get">
		<input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
		<input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" /> 
		<input type="hidden" name="{NV_OP_VARIABLE}" value="{OP}" />
		<input type="hidden" name="sort" value="{SEARCH.sort}" />
		<div class="row">
			<div class="col-xs-24 col-md-6">
				<div class="form-group">
					<input class="form-control" type="text" value="{SEARCH.q}" name="q" maxlength="255" placeholder="{LANG.search_title}" />
				</div>
			</div>
			<div class="col-xs-12 col-md-6">
				<div class="form-group">
					<input class="btn btn-primary" type="submit" value="{LANG.search_submit}" /> <a href="{URL_ADD}" class="btn btn-success">{LANG.tour_add}</a>
				</div>
			</div>
		</div>
	</form>
</div>
<form action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
	<div class="table-responsive">
		<table class="table table-striped table-bordered table-hover">
			<colgroup>
				<col />
				<col class="w100" />
				<col />
				<col class="w150" span="2" />
				<col class="w100" />
				<col width="230" />
			</colgroup>
			<thead>
				<tr>
					<!-- BEGIN: checkbox -->
					<th class="text-center w50">
						<input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);">
					</th>
					<!-- END: checkbox -->
					<!-- BEGIN: selectbox -->
					<th class="text-center w100">
						
					</th>
					<!-- END: selectbox -->
					<th>{LANG.code}</th>
					<th>{LANG.title}</th>
					<th>{LANG.date_start}</th>
					<th>{LANG.addtime}</th>
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
					<td class="text-center">
						<!-- BEGIN: checkbox -->
						<input class="post" type="checkbox" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{VIEW.id}" name="idcheck[]">
						<!-- END: checkbox -->
						<!-- BEGIN: selectbox -->
						<select class="form-control" id="id_weight_{VIEW.id}" onchange="nv_change_weight('{VIEW.id}');">
							<!-- BEGIN: weight_loop -->
							<option value="{WEIGHT.key}"{WEIGHT.selected}>{WEIGHT.title}</option>
							<!-- END: weight_loop -->
						</select>
						<!-- END: selectbox -->
					</td>
					<td><strong>{VIEW.code}</strong></td>
					<td><a href="{VIEW.link_view}" title="{LANG.title}" target="_blank">{VIEW.title}</a></td>
					<td>{VIEW.date_start}</td>
					<td>{VIEW.addtime}</td>
					<td class="text-center"><input type="checkbox" name="status" id="change_status_{VIEW.id}" value="{VIEW.id}" {VIEW.ck_status} onclick="nv_change_status({VIEW.id});" /></td>
					<td class="text-center"><i class="fa fa-file-image-o fa-lg">&nbsp;</i><a href="{VIEW.link_images}">{LANG.image} <span class="red">({VIEW.images_count})</span></a> - <i class="fa fa-edit fa-lg">&nbsp;</i> <a href="{VIEW.link_edit}">{LANG.edit}</a> - <em class="fa fa-trash-o fa-lg">&nbsp;</em> <a href="{VIEW.link_delete}" onclick="return confirm(nv_is_del_confirm[0]);">{LANG.delete}</a></td>
				</tr>
				<!-- END: loop -->
			</tbody>
		</table>
	</div>
</form>

<!-- BEGIN: action -->
<form class="form-inline m-bottom">
	<select class="form-control" id="action">
		<!-- BEGIN: loop -->
		<option value="{ACTION.key}">{ACTION.value}</option>
		<!-- END: loop -->
	</select>
	<button class="btn btn-primary" onclick="nv_tour_action( $('#action').val(), '{BASE_URL}', '{LANG.error_empty_tour}' ); return false;">{LANG.perform}</button>
</form>
<!-- END: action -->

<script>
	function nv_change_weight(id) {
		var nv_timer = nv_settimeout_disable('id_weight_' + id, 5000);
		var new_vid = $('#id_weight_' + id).val();
		$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'sort=1&id=' + id + '&new_vid=' + new_vid, function(res) {
			var r_split = res.split('_');
			if (r_split[0] != 'OK') {
				alert(nv_is_change_act_confirm[2]);
			}
			clearTimeout(nv_timer);
			window.location.href = window.location.href;
			return;
		});
		return;
	}

	function nv_change_status(id) {
		var new_status = $('#change_status_' + id).is(':checked') ? true : false;
		if (confirm(nv_is_change_act_confirm[0])) {
			var nv_timer = nv_settimeout_disable('change_status_' + id, 5000);
			$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=main&nocache=' + new Date().getTime(), 'change_status=1&id=' + id, function(res) {
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