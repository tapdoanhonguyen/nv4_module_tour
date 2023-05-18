<!-- BEGIN: main -->
<div class="block-groups-vertical">
	<!-- BEGIN: loop -->
	<div class="col-md-12">	
		<div class="row">
			<div class="items">
				<div class="col-xs-8 col-sm-8 col-md-8">
					<a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt="{ROW.title}"></a>
				</div>
				<div class="col-xs-16 col-sm-16 col-md-16">
					<h2><a href="{ROW.link}" title="{ROW.title}">{ROW.title_clean}</a></h2>
					<!-- BEGIN: price -->
					<!-- BEGIN: discounts -->
					<p>{LANG.price} : <span class="money">{PRICE.sale_format} đ</span> <span class="discounts_money">{PRICE.price_format} đ</span></p>
					<!-- END: discounts -->

					<!-- BEGIN: no_discounts -->
					<p>{LANG.price}: <span class="money no-discount">{PRICE.price_format} đ</span></p>
					<!-- END: no_discounts -->

					<!-- END: price -->
					
					<!-- BEGIN: star -->		
					<p>
							{LANG.hotels}:
							<!-- BEGIN: loop -->
							<i class="fa fa-star-o"></i>
							<!-- END: loop -->
						</p>
					<!-- END: star -->
					<!-- BEGIN: contact -->
					<p class="money">{LANG.contact}</p>
					<!-- END: contact -->
					<p class="show">{LANG.begin_time} : {ROW.date_start}</p>
					
					<p>{LANG.vehicle}: {ROW.vehicle}</p>
				</div>
			</div>
		</div>
	</div>
	<!-- END: loop -->
</div>
<!-- END: main -->