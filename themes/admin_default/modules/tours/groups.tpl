<!-- BEGIN: main -->
<div id="module_show_list">{BLOCK_GROUPS_LIST}</div>
<br />
<a id="edit"></a>
<!-- BEGIN: error -->
<div class="alert alert-warning">{ERROR}</div>
<!-- END: error -->
<div class="panel panel-default">
	<div class="panel-body">
		<form class="form-horizontal" action="{NV_BASE_ADMINURL}index.php" method="post">
			<input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" /> <input type="hidden" name="{NV_OP_VARIABLE}" value="{OP}" /> <input type="hidden" name="bid" value="{ROW.bid}" /> <input name="savecat" type="hidden" value="1" />

			<div class="form-group">
				<label class="col-sm-3 control-label"><strong>{LANG.title}</strong> <span class="red">*</span></label>
				<div class="col-sm-21">
					<input class="form-control" name="title" id="idtitle" type="text" value="{ROW.title}" maxlength="255" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><strong>{LANG.alias}</strong></label>
				<div class="col-sm-21">
					<div class="input-group">
						<input class="form-control" type="text" name="alias" value="{ROW.alias}" id="id_alias" /> <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-refresh fa-lg" onclick="nv_get_alias('id_alias');">&nbsp;</i>
							</button>
						</span>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><strong>{LANG.keywords}</strong></label>
				<div class="col-sm-21">
					<input class="form-control" name="keywords" type="text" value="{ROW.keywords}" maxlength="255" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label"><strong>{LANG.description}</strong></label>
				<div class="col-sm-21">{ROW.description}</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 col-md-3 control-label"><strong>{LANG.image}</strong></label>
				<div class="col-sm-19 col-md-21">
					<div class="input-group">
						<input class="form-control" type="text" name="image" value="{ROW.image}" id="id_image" /> <span class="input-group-btn">
							<button class="btn btn-default selectfile" type="button">
								<em class="fa fa-folder-open-o fa-fix">&nbsp;</em>
							</button>
						</span>
					</div>
				</div>
			</div>

			<div class="form-group text-center">
				<input class="btn btn-primary" name="submit1" type="submit" value="{LANG.save}" />
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	//<![CDATA[
	$(".selectfile")
			.click(
					function() {
						var area = "id_image";
						var path = "{NV_UPLOADS_DIR}/{MODULE_UPLOAD}";
						var currentpath = "{CURRENTPATH}";
						var type = "image";
						nv_open_browse(script_name + "?" + nv_name_variable
								+ "=upload&popup=1&area=" + area + "&path="
								+ path + "&type=" + type + "&currentpath="
								+ currentpath, "NVImg", 850, 420,
								"resizable=no,scrollbars=no,toolbar=no,location=no,status=no");
						return false;
					});

	function nv_get_alias(id) {
		var title = strip_tags($("[name='title']").val());
		if (title != '') {
			$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name
					+ '&' + nv_fc_variable + '=groups&nocache='
					+ new Date().getTime(), 'get_alias_title='
					+ encodeURIComponent(title), function(res) {
				$("#" + id).val(strip_tags(res));
			});
		}
		return false;
	}
	//]]>
</script>

<!-- BEGIN: auto_get_alias -->
<script type="text/javascript">
	//<![CDATA[
	$("[name='title']").change(function() {
		nv_get_alias('id_alias');
	});
	//]]>
</script>
<!-- END: auto_get_alias -->

<!-- END: main -->