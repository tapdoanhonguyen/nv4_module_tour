<!-- BEGIN: main -->
<div class="viewgrid">
	<!-- BEGIN: loop -->
	<div class="col-xs-24 col-sm-12 col-md-8 ">
		<div class="caption">
		<h3 class="text-center tour-title">
					<a href="{ROW.link}" title="{ROW.title}">{ROW.title_clean}</a>
				</h3>
			<div class="img">
				<a href="{ROW.link}" title="{ROW.title}"><img alt="{CONTENT.title}" src="{HOMEIMG1}" width="{IMGWIDTH1}" class="img-thumbnail pull-left imghome" /></a>
			</div>
			
				

				<!-- BEGIN: discounts -->
            	<span class="label label-danger label-sale">-{PRICE.discount_percent}%</span>
            	<!-- END: discounts -->
            	
            	<div class="tour-info">
					<div class="row">
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
					
					<!-- BEGIN: star -->		
					<div class="row">
						<div class="col-xs-24 col-md-24">
							<em class="fa fa-home">&nbsp;</em>{LANG.hotels}:
							<!-- BEGIN: loop -->
							<div class="star" title="{ROW.star}">
								<span class="star-icon">&nbsp;</span>
							</div>
							<!-- END: loop -->
						</div>
					</div>
					<!-- END: star -->
				</div>
			</div>
		</div>
	</div>
	<!-- END: loop -->
</div>
<!-- END: main -->