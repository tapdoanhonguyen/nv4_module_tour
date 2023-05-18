<!-- BEGIN: main -->
<div style="background-color: #ddd; padding: 5px;">{LANG.tour_info}</div>
<h2 style="margin-bottom: 10px;">
	<a href="{TOUR_INFO.link}" title="{TOUR_INFO.title}">{TOUR_INFO.title}</a>
</h2>
<ul>
	<li>{LANG.code}: <strong>{TOUR_INFO.code}</strong></li>
	<li>{LANG.time_tour}: <strong>{TOUR_INFO.num_day}</strong></li>
	<li>{LANG.begin_time}: <strong>{TOUR_INFO.date_start}</strong></li>
	<li>{LANG.place_start}: <strong>{TOUR_INFO.province.title}</strong></li>
</ul>

<div style="background-color: #ddd; padding: 5px;">{LANG.booking_info}</div>
	<ul>
		<li>{LANG.full_name}: <strong>{BOOKING_INFO.contact_fullname}</strong></li>
		<li>{LANG.address}: <strong>{BOOKING_INFO.contact_address}</strong></li>
		<li>{LANG.phone}: <strong>{BOOKING_INFO.contact_phone}</strong></li>
		<li>Email: <strong><a href="mailto:{BOOKING_INFO.contact_email}">{BOOKING_INFO.contact_email}</a></strong></li>
		<li>{LANG.booking_time}: <strong>{BOOKING_INFO.booking_time}</strong></li>
	</ul>

<div style="background-color: #ddd; padding: 5px;">{LANG.customer_list}</div>
<table style="width: 100%; max-width: 100%; margin-bottom: 18px; border: 1px solid #ddd;">
	<thead>
		<tr>
			<th width="50" style="text-align: left;">{LANG.number}</th>
			<th style="text-align: left;">{LANG.full_name}</th>
			<th width="150" style="text-align: left;">{LANG.birthday}</th>
			<th style="text-align: left;">{LANG.address}</th>
			<th width="100" style="text-align: left;">{LANG.gender}</th>
			<!-- BEGIN: customer_type_thead -->
			<th style="text-align: left;">{LANG.customer_type}</th>
			<!-- END: customer_type_thead -->
			<!-- BEGIN: age_thead -->
			<th width="120" style="text-align: left;">{LANG.age}</th>
			<!-- END: age_thead -->
			<!-- BEGIN: optional_thead -->
			<th width="100" style="text-align: left;">{TITLE}</th>
			<!-- END: optional_thead -->
			<th width="120" style="text-align: left;">{LANG.price} ({MONEY.code})</th>
		</tr>
	</thead>
	<tbody>
		<!-- BEGIN: customer -->
		<tr>
			<td>{CUSTOMER.number}</td>
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
		<!-- END: customer -->
	</tbody>
</table>
<strong>{LANG.total}: </strong><span style="color: #CC3300; font-weight: bold;">{TOTAL} {MONEY.code}</span>

<!-- BEGIN: payment_method -->
<div style="background-color: #ddd; padding: 5px;">{LANG.payment}</div>
<p>{PAYMENT_METHOD.description}</p>
<!-- END: payment_method -->

<!-- END: main -->