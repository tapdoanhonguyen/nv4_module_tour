<!-- BEGIN: main -->
<div class="panel panel-default floater">
	<div class="panel-heading">{CONFIG.title}</div>
	<div class="panel-body">
		<div id="block-tour-plan"></div>
		<!-- BEGIN: price_plan -->
		<!-- BEGIN: btn_booking -->
		<hr />
		<div class="text-center">
			<a href="{URL_BOOKING}" class="btn btn-primary booking">{LANG.booking_now}</a>
		</div>
		<!-- END: btn_booking -->
		<!-- END: price_plan -->
	</div>
</div>

<!-- BEGIN: fixed -->
<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/tours_jquery.floatingFixed.js"></script>
<script>
$(function() {        
	$(".floater").floatingFixed({
		padding: {CONFIG.padding}
	});
});
</script>
<!-- END: fixed -->

<script>
$(window).load(function() {
	var plan = '<ul class="tour-plan">';
	$('#plan {CONFIG.title_tag}').each(function(){
		plan += '<li><a href="#' + $(this).attr('id') + '" title="' + $(this).text() + '">' + $(this).text() + '</a></li>';
	});
	plan += '</ul>';
	$('#block-tour-plan').html(plan);
	
});
</script>
<!-- END: main -->