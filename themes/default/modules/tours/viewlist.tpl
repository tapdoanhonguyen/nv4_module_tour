<!-- BEGIN: main -->
<div class="viewlist">
	<!-- BEGIN: loop -->
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="pull-left tour-image" style="width: {WIDTH}px">
				<a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt="{ROW.title}" class="img-thumbnail" style="max-width: {WIDTH}px"></a>
			</div>
			<ul>
				<li><h2 class="tour-title"><a href="{ROW.link}" title="{ROW.title}">{ROW.title_clean}</a></h2></li>
				<li><em class="fa fa-clock-o">&nbsp;</em>{LANG.time_tour}: <strong>{ROW.num_day}</strong></li>
				<li><em class="fa fa-calendar">&nbsp;</em>{LANG.begin_time}: <strong>{ROW.date_start}</strong></li>
				<!-- BEGIN: price -->
				<!-- BEGIN: discounts -->
				<li><em class="fa fa-money">&nbsp;</em>{LANG.tour_price}: <span class="money">{PRICE.sale_format} {PRICE.unit}</span> <span class="discounts_money">{PRICE.price_format} {PRICE.unit}</span> (-{PRICE.discount_percent}%)</li>
				<!-- END: discounts -->

				<!-- BEGIN: no_discounts -->
				<li><em class="fa fa-money">&nbsp;</em>{LANG.tour_price}: <span class="money no-discount">{PRICE.price_format} {PRICE.unit}</span></li>
				<!-- END: no_discounts -->
				
				<!-- BEGIN: btn_booking -->
				<li><a href="{URL_BOOKING}" class="btn btn-primary btn-xs booking"><em class="fa fa-folder-o">&nbsp;&nbsp;</em>{LANG.booking_now}</a></li>
				<!-- END: btn_booking -->

				<!-- BEGIN: btn_contact -->
				<li>
					<div class="text-center">
						<button class="btn btn-primary">{LANG.contact}</button>
					</div>
				</li>
				<!-- END: btn_contact -->

				<!-- END: price -->
				
				<!-- BEGIN: contact -->
				<em class="fa fa-money">&nbsp;</em>{LANG.tour_price}: <span class="money">{LANG.contact}</span>
				<!-- END: contact -->
			</ul>
		</div>
	</div>
	<!-- END: loop -->
</div>
<!-- END: main -->