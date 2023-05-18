<!-- BEGIN: main -->
<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/flexslider/flexslider.css" rel="stylesheet" type="text/css" />
<div class="viewgrid block_bxslider_carousel">
	<div class="flexslider" id="flexslider_{BLOCK_CONFIG.bid}">
		<ul class="slides">
			<!-- BEGIN: loop -->
			<li class="items">
				<div class="thumbnail">
					<div style="height: {HEIGHT}px">
						<a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt="{ROW.title}" class="img-thumbnail" style="max-height: {HEIGHT}px"></a>
					</div>
					<div class="caption">
						<h3 class="text-center tour-title">
							<a href="{ROW.link}" title="{ROW.title}">{ROW.title_clean}</a>
						</h3>
	
						<!-- BEGIN: discounts -->
						<span class="label label-danger label-sale">-{PRICE.discount_percent}%</span>
						<!-- END: discounts -->
	
						<div class="row tour-info">
							<div class="col-xs-11 col-sm-11 col-md-11">
								<span><em class="fa fa-clock-o">&nbsp;</em>{ROW.num_day}</span> <span><em class="fa fa-calendar">&nbsp;</em>{ROW.date_start}</span>
							</div>
							<div class="col-xs-13 col-sm-13 col-md-13 text-right">
								<!-- BEGIN: price -->
	
								<!-- BEGIN: discounts -->
								<span class="money">{PRICE.sale_format} {PRICE.unit}</span> <span class="discounts_money">{PRICE.price_format} {PRICE.unit}</span>
								<!-- END: discounts -->
	
								<!-- BEGIN: no_discounts -->
								<span class="money no-discount">{PRICE.price_format} {PRICE.unit}</span>
								<!-- END: no_discounts -->
	
								<!-- END: price -->
	
								<!-- BEGIN: contact -->
								{LANG.price}: <span class="money">{LANG.contact}</span>
								<!-- END: contact -->
							</div>
						</div>
					</div>
				</div>
			</li>
			<!-- END: loop -->
		</ul>
	</div>
</div>

<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/flexslider/jquery.flexslider-min.js"></script>
<script>
	$(window).load(function() {
		$('#flexslider_{BLOCK_CONFIG.bid}').flexslider({
			animation : "slide",
			animationLoop : false,
			itemWidth : 400,
			itemMargin : 5,
			minItems: 1,
			maxItems: {BLOCK_CONFIG.numpage},
			controlNav: false,
			slideshow: {BLOCK_CONFIG.slideshow}
		});
	});
</script>
<!-- END: main -->

<!-- BEGIN: config -->
<tr>
	<td>{LANG.type}</td>
	<td><select name="config_type" id="config_type" class="form-control">
			<!-- BEGIN: type -->
			<option value="{TYPE.index}"{TYPE.selected}>{TYPE.value}</option>
			<!-- END: type -->
	</select> <script>
		$('#config_type').change(function() {
			if ($(this).val() == 0) {
				$('#row_catid').show();
				$('#row_blockid').hide();
			} else {
				$('#row_catid').hide();
				$('#row_blockid').show();
			}
		});
	</script></td>
</tr>
<tr id="row_catid"{CAT_HIDE}>
	<td>{LANG.catid}</td>
	<td>
		<div style="height: 200px; overflow: scroll;">
			<!-- BEGIN: cat -->
			<label class="show">{CAT.space}<input type="checkbox" name="config_catid[]" value="{CAT.id}" {CAT.checked} />{CAT.title}
			</label>
			<!-- END: cat -->
		</div>
	</td>
</tr>
<tr id="row_blockid" {BLOCK_HIDE}>
	<td>{LANG.blockid}</td>
	<td><select class="form-control" name="config_blockid">
			<!-- BEGIN: block -->
			<option value="{BLOCK.bid}"{BLOCK.selected}>{BLOCK.title}</option>
			<!-- END: block -->
	</select></td>
</tr>
<tr>
	<td>{LANG.numrow}</td>
	<td><input class="form-control" name="config_numrow" value="{DATA.numrow}" /></td>
</tr>
<tr>
	<td>{LANG.numpage}</td>
	<td><input class="form-control" name="config_numpage" value="{DATA.numpage}" /></td>
</tr>
<tr>
	<td>{LANG.slideshow}</td>
	<td><label><input type="checkbox" name="config_slideshow" value="1" {DATA.ck_slideshow} />{LANG.slideshow_note}</label></td>
</tr>
<tr>
	<td>{LANG.title_lenght}</td>
	<td><input class="form-control" name="config_title_lenght" value="{DATA.title_lenght}" /></td>
</tr>
<!-- END: config -->