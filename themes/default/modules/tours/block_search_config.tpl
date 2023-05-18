<!-- BEGIN: main -->
<tr>
	<td>{LANG.search_template}</td>
	<td>
		<select class="form-control" name="config_search_template">
			<!-- BEGIN: template -->
			<option value="{TEMPLATE.index}" {TEMPLATE.selected}>{TEMPLATE.value}</option>
			<!-- END: template -->
		</select>
	</td>
</tr>

<tr class="vertical_f1" {DATA.vertical_f1_style}>
	<td>{LANG.price_begin}</td>
	<td>
		<input type="number" name="config_price_begin" value="{DATA.price_begin}" class="form-control" />
	</td>
</tr>

<tr class="vertical_f1" {DATA.vertical_f1_style}>
	<td>{LANG.price_end}</td>
	<td>
		<input type="number" name="config_price_end" value="{DATA.price_end}" class="form-control" />
	</td>
</tr>

<tr class="vertical_f1" {DATA.vertical_f1_style}>
	<td>{LANG.price_step}</td>
	<td>
		<input type="number" name="config_price_step" value="{DATA.price_step}" class="form-control" />
	</td>
</tr>

<script>
	$('select[name="config_search_template"]').change(function(){
		if($(this).val() == 'vertical_f1'){
			$('.vertical_f1').show();
		}else{
			$('.vertical_f1').hide();
		}
	});
</script>
<!-- END: main -->