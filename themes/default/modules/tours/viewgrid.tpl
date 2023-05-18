<!-- BEGIN: main -->
<div class="viewgrid">
<!-- BEGIN: loop -->
    <div class="tms_sp_item tms_sp_item_{STT}">

		<div class="tms_col_body">
              <div class="tms_sp_item_img">
                <a href="{ROW.link}" title="{ROW.title}"><img src="{ROW.thumb}" alt="{ROW.title}"></a>
			</div>			
			<div class="tms_money text-center" >
			
             
                <p class="price">
                <em class="fa fa-clock-o">&nbsp;</em>{ROW.num_day}
                </p>
               
			  </div>
			
            <div class="tms_sp_item_title" >
			<a href="{ROW.link}" title="{ROW.title}">{ROW.title}</a>
			</div>	
			
			<div class="tms_sp_item_hometext" >
			<ul class="list_tms_home_tour">
				
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
    </div>
	
	<!-- END: loop -->

</div>
<div class="clear"></div>
<!-- END: main -->