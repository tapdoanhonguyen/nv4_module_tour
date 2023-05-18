<!-- BEGIN: main -->
<div class="clearfix"></div>

<div class="carousel" >
	<div  id="owl-noibatright" class="owl-carousel">
		<!-- BEGIN: loop -->
<div>
		<div class="tms_tour_img">
				<a href="{ROW.title}" title="{ROW.title}"><img alt="{ROW.title}" src="{ROW.thumb}"class="img-thumbnail" style="max-height: 200px"></a>
			</div>
				<div class="tms_caption">
				<ul class="list_tms_block_tour">
				<li><h3><a href="{ROW.link}" title="{ROW.title}">{ROW.title_clean}</a></h3></li>
				<li><em class="fa fa-clock-o">&nbsp;</em> <strong>{ROW.num_day}</strong></li>
				<li><em class="fa fa-calendar">&nbsp;</em>{LANG.begin_time}: <strong>{ROW.date_start}</strong></li>
				<li><em class="fa fa-plane">&nbsp;</em>{LANG.vehicle}: <strong>{ROW.vehicle}</strong></li>
				
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


				<!-- END: price -->
				
				<!-- BEGIN: contact -->
				<li><em class="fa fa-money">&nbsp;</em>{LANG.tour_price}: <span class="money no-discount">{LANG.contact}</span></li>
	
				<!-- END: contact -->
			</ul>
		</div>
	</div>
		<!-- END: loop-->
		
	</div>
</div>
<div class="clearfix" style="height:5px;"></div>
<script type="text/javascript">

$(document).ready(function() {
  $('#owl-noibatright').owlCarousel({
	//loop: true,
	margin: 20,
	responsiveClass: true,
	autoplay:true,
    autoplayTimeout:10000,
    autoplayHoverPause:true,
	dots : false,
	nav : false,
	navText: [ "<i class=\"fa fa-chevron-left\"></i>",
             "<i class=\"fa fa-chevron-right\"></i>" ],
	 
	responsive: {
	  0: {
		items: 1,
		//loop: true,
		//nav: true
	  },
	  430: {
		items: 2,
		//loop: true,
		//nav: false
	  },
	  600: {
		items: 3,
		//loop: true,
		//nav: false
	  },
	  800: {
		items: 1,
		//loop: true,
		//nav: false
	  },
	  1000: {
		items: 1,
		//nav: true,
		//loop: true,
		//margin: 20
	  }
	}
  })
  
})

</script>

		
		
<!-- END: main -->