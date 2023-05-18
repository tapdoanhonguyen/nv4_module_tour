<!-- BEGIN: main -->
<div class="payment">
	<div class="row two_column">
		<div class="col-xs-24 col-sm-10 col-md-10">
			<div class="panel panel-default">
				<div class="panel-heading">{LANG.tour_info}</div>
				<div class="panel-body">
					<h2 class="m-bottom">
						<a href="{TOUR_INFO.link}" title="{TOUR_INFO.title}">{TOUR_INFO.title}</a>
					</h2>
					<ul>
						<li>{LANG.code}: <strong>{TOUR_INFO.code}</strong></li>
						<li>{LANG.time_tour}: <strong>{TOUR_INFO.num_day}</strong></li>
						<li>{LANG.begin_time}: <strong>{TOUR_INFO.date_start}</strong></li>
						<li>{LANG.place_start}: <strong>{TOUR_INFO.province.title}</strong></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xs-24 col-sm-14 col-md-14">
			<div class="panel panel-default">
				<div class="panel-heading">{LANG.booking_info}</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-24 col-sm-16 col-md-16">
							<ul>
								<li>{LANG.full_name}: <strong>{BOOKING_INFO.contact_fullname}</strong></li>
								<li>{LANG.address}: <strong>{BOOKING_INFO.contact_address}</strong></li>
								<li>{LANG.phone}: <strong>{BOOKING_INFO.contact_phone}</strong></li>
								<li>Email: <strong><a href="mailto:{BOOKING_INFO.contact_email}">{BOOKING_INFO.contact_email}</a></strong></li>
								<li>{LANG.booking_time}: <strong>{BOOKING_INFO.booking_time_str}</strong></li>
							</ul>
						</div>
						<div class="col-xs-24 col-sm-8 col-md-8 text-center">
							<div class="payment-status-box m-bottom">
								<span class="money"><h2>{BOOKING_INFO.booking_code}</h2></span>
								<span>{LANG.payment_status_str}</span>
							</div>
							{LANG.payment_total}<br /><h2><span class="money">{MONEY_TOTAL}</span> <span class="money">{MONEY.code}</span></h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- BEGIN: tour_price_caculate -->
	<div class="panel panel-default">
		<div class="panel-heading">{LANG.tour_price_caculate}</div>
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="30" class="text-center">STT</th>
						<!-- BEGIN: customer_type_thead -->
						<th>{LANG.customer_type}</th>
						<!-- END: customer_type_thead -->
						<!-- BEGIN: age_thead -->
						<th>{LANG.ages}</th>
						<!-- END: age_thead -->
						<th class="text-center">{LANG.quantity}</th>
						<th>{LANG.price_per}</th>
						<th>{LANG.price_full}</th>
					</tr>
				</thead>
				<tbody>
					<!-- BEGIN: loop -->
					<tr>
						<td class="text-center">{CUSTOMERPRICE.number}</td>
						<!-- BEGIN: customer_type_tbody -->
						<td>{CUS_TYPE}</td>
						<!-- END: customer_type_tbody -->
						<!-- BEGIN: age_tbody -->
						<td>{AGE}</td>
						<!-- END: age_tbody -->
						<td class="text-center">{CUSTOMERPRICE.quantity}</td>
						<td>{CUSTOMERPRICE.priceunit}</td>
						<td>{CUSTOMERPRICE.price}</td>
					</tr>
					<!-- END: loop -->
					<tr>
						<td colspan="{COLSPAN}">
							<div class="text-right">
								<strong>{LANG.total}: </strong><span class="money">{TOTAL} {MONEY.code}</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- END: tour_price_caculate -->
	
	<!-- BEGIN: customer_list -->
	<div class="panel panel-default">
		<div class="panel-heading">{LANG.customer_list}</div>
		<table class="table table-bordered" id="table_customer_list" data-numcustomer="{NUMCUSTOMER}">
			<thead>
				<tr>
					<th width="50" class="text-center">{LANG.number}</th>
					<th>{LANG.full_name}</th>
					<th width="150">{LANG.birthday}</th>
					<th>{LANG.address}</th>
					<th width="100">{LANG.gender}</th>
					<!-- BEGIN: customer_type_thead -->
					<th>{LANG.customer_type}</th>
					<!-- END: customer_type_thead -->
					<!-- BEGIN: age_thead -->
					<th width="120">{LANG.ages}</th>
					<!-- END: age_thead -->
					<!-- BEGIN: optional_thead -->
					<th width="100">{TITLE}</th>
					<!-- END: optional_thead -->
					<th width="120">{LANG.price} ({MONEY.code})</th>
				</tr>
			</thead>
			<tbody>
				<!-- BEGIN: loop -->
				<tr>
					<td class="text-center">{CUSTOMER.number}</td>
					<td>{CUSTOMER.fullname}</td>
					<td>{CUSTOMER.birthday}</td>
					<td>{CUSTOMER.address}</td>
					<td>{CUSTOMER.gender}</td>
					<!-- BEGIN: customer_type_tbody -->
					<td>{CUSTOMER.customer_type}</td>
					<!-- END: customer_type_tbody -->
					<!-- BEGIN: age_tbody -->
					<td>{CUSTOMER.age}</td>
					<!-- END: age_tbody -->
					<!-- BEGIN: optional_tbody -->
					<td>{OPTIONAL}</td>
					<!-- END: optional_tbody -->
					<td>{CUSTOMER.price}</td>
				</tr>
				<!-- END: loop -->
			</tbody>
		</table>
		<div class="panel-body text-right">
			<strong>{LANG.total}: </strong><span class="money">{TOTAL} {MONEY.code}</span>
		</div>
	</div>
	<!-- END: customer -->
	
	<!-- BEGIN: payment -->
	<div class="panel panel-default">
		<div class="panel-heading">{LANG.payment}</div>
		<div class="panel-body">
			<!-- BEGIN: payment_info -->
			<p>{PAYMENT_METHOD.description}</p>
			<!-- END: payment_info -->
			
			<!-- BEGIN: payment_payport -->
			
			<!-- BEGIN: description -->
			<div class="col-sm-24 col-xs-15 col-md-15">
				<p>{PAYMENT_METHOD.description}</p>
			</div>
			<!-- BEGIN: actpay -->
			<div class="col-sm-24 col-xs-9 col-md-9">
				<div class="row">
					<!-- BEGIN: loop -->
					<div class="col-xs-24 col-sm-12 col-md-12">
						<a title="{DATA_PAYMENT.name}" href="{DATA_PAYMENT.url}"><img src="{DATA_PAYMENT.images_button}" alt="{DATA_PAYMENT.name}" class="img-thumbnail" /></a>
					</div>
				<!-- END: loop -->
				</div>
			</div>
			<!-- END: actpay -->
			<!-- END: description -->
			
			<!-- BEGIN: no_description -->
			<p>{PAYMENT_METHOD.description}</p>
			<!-- END: no_description -->
			
			<!-- END: payment_payport -->
		</div>
	</div>
	<!-- END: payment -->
</div>
<script type="text/javascript">
$(window).load(function(){
    $.each( $('.two_column .panel-body'), function(k,v){
        if( k % 2 == 0 )
        {
            var height1 = $($('.two_column .panel-body')[k]).height();
            var height2 = $($('.two_column .panel-body')[k+1]).height();
            var height = ( height1 > height2 ? height1 : height2 );
            $($('.two_column .panel-body')[k]).height( height );
            $($('.two_column .panel-body')[k+1]).height( height );
        }
    });
});
</script>
<!-- END: main -->