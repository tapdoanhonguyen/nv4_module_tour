<!-- BEGIN: main -->
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />

<div class="booking">
	<form class="form-horizontal" action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post" id="frm-booking">
	<input type="hidden" name="tour_id" value="{TOUR_INFO.id}" />
	<input type="hidden" name="discounts_id" value="{TOUR_INFO.discounts_id}" />
		<div class="row">
			<div class="col-xs-24">
				<ul class="nav nav-pills nav-justified thumbnail setup-panel" id="setup-panel">
					<li class="active"><a href="#step-1">
							<h4 class="list-group-item-heading">{LANG.booking_step_1}</h4>
							<p class="list-group-item-text">{LANG.booking_step_1_note}</p>
					</a></li>
					<li class="disabled"><a href="#step-2">
							<h4 class="list-group-item-heading">{LANG.booking_step_2}</h4>
							<p class="list-group-item-text">{LANG.booking_step_2_note}</p>
					</a></li>
					<li class="disabled"><a href="#step-3">
							<h4 class="list-group-item-heading">{LANG.booking_step_3}</h4>
							<p class="list-group-item-text">{LANG.booking_step_3_note}</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="setup-content" id="step-1">		
			<div class="row">
				<div class="col-xs-24 col-sm-10 col-md-10 two_column">
					<div class="panel panel-default">
						<div class="panel-heading">{LANG.tour_info}</div>
						<div class="panel-body">
							<h2 class="m-bottom">
								<a href="{TOUR_INFO.link}" title="{TOUR_INFO.title}">{TOUR_INFO.title}</a>
							</h2>
							<ul>
								<li>{LANG.code}: <strong>{TOUR_INFO.code}</strong></li>
								<li>{LANG.time_tour}: <strong>{TOUR_INFO.num_day}</strong></li>
								<li>{LANG.tour_price}: <strong class="money">{TOUR_INFO.price.sale_format} </strong></li>
								<li>{LANG.begin_time}: <strong>{TOUR_INFO.date_start}</strong></li>
								<li>{LANG.place_start}: <strong>{TOUR_INFO.province.title}</strong></li>
								<li>{LANG.rest}: <strong>{TOUR_INFO.rest}</strong></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-xs-24 col-sm-14 col-md-14 two_column">
					<!-- BEGIN: price_table -->
					<div class="panel panel-default">
						<div class="panel-heading">{LANG.tour_price}</div>
						<!-- BEGIN: price_method_0 -->
						<div class="table-responsive">
							<table class="table table-bordered">
								<colgroup>
									<col />
									<col width="150" />
									<col width="300" />
								</colgroup>
								<thead>
									<tr>
										<th>{LANG.price_items}</th>
										<th>{LANG.price}</th>
										<th>{LANG.note}
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>{LANG.base_price}</td>
										<td class="money">{PRICE.sale_format}</td>
										<td>{PRICE.note}</td>
									</tr>
									<!-- BEGIN: subprice -->
									<!-- BEGIN: loop -->
									<tr>
										<td>{SUBPRICE.title}</td>
										<td class="money">{SUBPRICE.price.sale_format}</td>
										<td>{SUBPRICE.note}</td>
									</tr>
									<!-- END: loop -->
									<!-- END: subprice -->
								</tbody>
							</table>
						</div>
						<!-- END: price_method_0 -->
		
						<!-- BEGIN: price_method_1 -->
						<div class="table-responsive">
							<table class="table">
								<colgroup>
									<col width="200" />
								</colgroup>
								<thead>
									<th>&nbsp;</th>
									<!-- BEGIN: title -->
									<th class="text-center">{TITLE.name}<br />({TITLE.from} {LANG.to} {TITLE.to} {LANG.age})</th>
									<!-- END: title -->
								</thead>
								<tbody>
									<tr>
										<td>{LANG.base_price}</td>
										<!-- BEGIN: price -->
										<td class="text-center money">{PRICE.sale_format}</td>
										<!-- END: price -->
									</tr>
									<!-- BEGIN: subprice -->
									<tr>
										<td><span class="pointer" title="{SUBPRICE.title}">{SUBPRICE.title_clean}</span></td>
										<!-- BEGIN: loop -->
										<td class="text-center money">{SUBPRICE.price.sale_format}</td>
										<!-- END: loop -->
									</tr>
									<!-- END: subprice -->
								</tbody>
							</table>
						</div>
						<!-- END: price_method_1 -->
		
						<!-- BEGIN: price_method_2 -->
						<div class="table-responsive">
							<table class="table">
								<thead>
									<th>&nbsp;</th>
									<th class="text-center">{LANG.tour_vietnam}</th>
									<th class="text-center">{LANG.tour_vietkieu}</th>
									<th class="text-center">{LANG.tour_nuocngoai}</th>
								</thead>
								<tbody>
									<!-- BEGIN: price -->
									<tr>
										<td><strong>{TITLE.name} ({TITLE.from} {LANG.to} {TITLE.to} {LANG.age})</strong></td>
										<!-- BEGIN: loop -->
										<td class="money text-center">{PRICE.sale_format}</td>
										<!-- END: loop -->
									</tr>
									<!-- END: price -->
			
									<!-- BEGIN: subprice -->
									<tr>
										<td><label class="pointer" data-toggle="tooltip" data-placement="top" data-original-title="{SUBPRICE.title}">{SUBPRICE.title_clean}</label></td>
										<!-- BEGIN: loop -->
										<td class="money text-center">{SUBPRICE.price.sale_format}</td>
										<!-- END: loop -->
									</tr>
									<!-- END: subprice -->
								</tbody>
							</table>
						</div>
						<!-- END: price_method_2 -->
						<div class="panel-body">
							<div class="pull-left text-danger">
								<em>{LANG.price_note}</em>
							</div>
							<div class="pull-right text-right">
								<strong>{LANG.money}:</strong> {MONEY.code} - {MONEY.currency}
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- END: price_table -->
				</div>
			</div>

			<div class="panel panel-default contact-info">
				<div class="panel-heading">{LANG.contact_info}</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-24 col-sm-12 col-md-12">
							<div class="form-group">
								<label class="col-sm-6 control-label">{LANG.full_name}</label>
								<div class="col-sm-18">
									<input type="text" class="form-control required" name="contact_fullname" value="{BOOKING_INFO.contact_fullname}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-6 control-label">{LANG.address}</label>
								<div class="col-sm-18">
									<input type="text" class="form-control required" name="contact_address" value="{BOOKING_INFO.contact_address}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
								</div>
							</div>
						</div>
						<div class="col-xs-24 col-sm-12 col-md-12">
							<div class="form-group">
								<label class="col-sm-6 control-label">Email</label>
								<div class="col-sm-18">
									<input type="email" class="form-control required" name="contact_email" value="{BOOKING_INFO.contact_email}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-6 control-label">{LANG.phone}</label>
								<div class="col-sm-18">
									<input type="text" class="form-control required" name="contact_phone" value="{BOOKING_INFO.contact_phone}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" />
								</div>
							</div>
						</div>
						<div class="col-xs-24 col-sm-24 col-md-24">
							<div class="form-group">
								<label class="col-sm-3 control-label">{LANG.note}</label>
								<div class="col-sm-21">
									<textarea class="form-control" name="contact_note">{BOOKING_INFO.contact_note}</textarea>
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
					<table class="table" id="table_price_caculate" data-numcustomerprice="1">
						<thead>
							<tr>
								<th width="30" class="text-center">STT</th>
								<!-- BEGIN: customer_type_thead -->
								<th>{LANG.customer_type}</th>
								<!-- END: customer_type_thead -->
								<!-- BEGIN: age_thead -->
								<th>{LANG.ages}</th>
								<!-- END: age_thead -->
								<th width="100">{LANG.quantity}</th>
								<th width="150">{LANG.price_per}</th>
								<th width="150">{LANG.price_full}</th>
								<th width="50"></th>
							</tr>
						</thead>
						<tbody>
							<!-- BEGIN: loop -->
							<tr id="customerprice_{CUSTOMERPRICE.index}">
								<td class="text-center">{CUSTOMERPRICE.number}</td>
								<!-- BEGIN: customer_type_tbody -->
								<td><select class="form-control" name="customerprice[{CUSTOMERPRICE.index}][type]" onchange="nv_tour_get_price({TOUR_INFO.id}, {CUSTOMERPRICE.index}, $(this));">
										<!-- BEGIN: loop -->
										<option value="{CUS_TYPE.index}" {CUS_TYPE.selected}>{CUS_TYPE.value}</option>
										<!-- END: loop -->
								</select></td>
								<!-- END: customer_type_tbody -->
								<!-- BEGIN: age_tbody -->
								<td>
									<select class="form-control" name="customerprice[{CUSTOMERPRICE.index}][age]" onchange="nv_tour_get_price({TOUR_INFO.id}, {CUSTOMERPRICE.index}, $(this));">
										<!-- BEGIN: loop -->
										<option value="{AGE.index}" {AGE.selected}>{AGE.value}</option>
										<!-- END: loop -->
									</select>
								</td>
								<!-- END: age_tbody -->
								<td><input type="number" name="customerprice[{CUSTOMERPRICE.index}][quantity]" class="form-control text-center" value="{CUSTOMERPRICE.quantity}" onchange="nv_tour_get_price({TOUR_INFO.id}, {CUSTOMERPRICE.index}, $(this));" min="1" /></td>
								<td><input type="text" class="form-control" readonly="readonly" value="{CUSTOMERPRICE.priceunit_format}" data-priceunit="{CUSTOMERPRICE.priceunit}" id="input_customerpriceunit_{CUSTOMERPRICE.index}" /></td>
								<td><input type="text" class="form-control" readonly="readonly" value="{CUSTOMERPRICE.price_format}" data-price="{CUSTOMERPRICE.price}" id="input_customerprice_{CUSTOMERPRICE.index}" /></td>
								<td>
									<button class="btn btn-danger" onclick="nv_tour_delete_customerprice({CUSTOMERPRICE.index}); return false;" <!-- BEGIN: btn_remove_disabled -->disabled="disabled"<!-- END: btn_remove_disabled --> >
										<em class="fa fa-trash-o">&nbsp;</em>
									</button>
								</td>
							</tr>
							<!-- END: loop -->
							<tr>
								<td colspan="{COLSPAN}">
									<div class="pull-left">
										<button class="btn btn-primary btn-xs" id="addcustomerprice">{LANG.customer_add}</button>
									</div>
									<!-- BEGIN: coupons -->
									<div class="pull-right">
										<div class="input-group">
										<div class="input-group-addon"><strong>{LANG.coupons}</strong></div>
										<input type="text" name="coupons_code" id="coupons_code" class="form-control input-sm" />
										<span class="input-group-btn form-tooltip">
											<button class="btn btn-default btn-sm" id="coupons_action" data-action="check" data-toggle="tooltip" data-placement="top" title="" data-original-title="{LANG.coupons_check}" data-tour-id="{TOUR_INFO.id}" >
												<em class="fa fa-sign-in">&nbsp;</em>
											</button>
										</span>
									    </div>
									</div>
									<!-- END: coupons -->
								</td>
							</tr>
							<tr>
								<td colspan="{COLSPAN}">
									<div class="pull-left">
										<em class="text-danger">{LANG.price_booking_note}</em>
									</div>
									<div class="pull-right">
										<strong>{LANG.payment_total}: </strong><span class="money"><span id="total_price">{PRICRTOTAL}</span> {MONEY.code}</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- END: tour_price_caculate -->
			
			<!-- BEGIN: customer -->
			<div class="panel panel-default">
				<div class="panel-heading">{LANG.customer_list}</div>
				<div class="table-responsive">
					<table class="table" id="table_customer_list" data-numcustomer="{NUMCUSTOMER}" data-limit="{TOUR_INFO.rest}">
						<thead>
							<tr>
								<th width="30">{LANG.number}</th>
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
								<th width="100">{OPTIONAL.title}</th>
								<!-- END: optional_thead -->
								<th width="120">{LANG.price} ({MONEY.code})</th>
								<th width="40"></th>
							</tr>
						</thead>
						<tbody>
							<!-- BEGIN: loop -->
							<tr id="customer_{CUSTOMER.index}">
								<td class="text-center">{CUSTOMER.number}</td>
								<td><input type="text" class="form-control required" name="customer[{CUSTOMER.index}][fullname]" value="{CUSTOMER.fullname}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" /></td>
								<td><input type="text" class="form-control datepicker required" readonly="readonly" name="customer[{CUSTOMER.index}][birthday]" value="{CUSTOMER.birthday}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')" /></td>
								<td><input type="text" class="form-control" name="customer[{CUSTOMER.index}][address]" value="{CUSTOMER.address}" /></td>
								<td><select class="form-control" name="customer[{CUSTOMER.index}][gender]">
										<!-- BEGIN: gender -->
										<option value="{GENDER.index}" {GENDER.selected}>{GENDER.value}</option>
										<!-- END: gender -->
								</select></td>
								<!-- BEGIN: customer_type_tbody -->
								<td><select class="form-control" name="customer[{CUSTOMER.index}][customer_type]" onchange="nv_tour_get_price({TOUR_INFO.id}, {CUSTOMER.index});">
										<!-- BEGIN: loop -->
										<option value="{CUS_TYPE.index}">{CUS_TYPE.value}</option>
										<!-- END: loop -->
								</select></td>
								<!-- END: customer_type_tbody -->
								<!-- BEGIN: age_tbody -->
								<td><select class="form-control" name="customer[{CUSTOMER.index}][age]" onchange="nv_tour_get_price({TOUR_INFO.id}, {CUSTOMER.index});">
										<!-- BEGIN: loop -->
										<option value="{AGE.index}">{AGE.value}</option>
										<!-- END: loop -->
								</select></td>
								<!-- END: age_tbody -->
								<!-- BEGIN: optional_tbody -->
								<td><select class="form-control optional" name="customer[{CUSTOMER.index}][optional]" onchange="nv_tour_get_price({TOUR_INFO.id}, {CUSTOMER.index});">
										<option value="{OPTIONAL.id}_0">{LANG.no}</option>
										<option value="{OPTIONAL.id}_1">{LANG.yes}</option>
								</select></td>
								<!-- END: optional_tbody -->
								<td><input type="text" readonly="readonly" class="form-control" name="price[{CUSTOMER.index}]" data-price="{CUSTOMER.price}" value="{CUSTOMER.price_format}" id="input_price_{CUSTOMER.index}" /></td>
								<td><button class="btn btn-danger" onclick="nv_tour_delete_customer({CUSTOMER.index}); return false;">
										<em class="fa fa-trash-o">&nbsp;</em>
									</button></td>
							</tr>
							<!-- END: loop -->
							<tr>
								<td colspan="{COLSPAN}">
									<div class="pull-left">
										<button class="btn btn-primary btn-xs" id="addcustomer">{LANG.customer_add}</button>
									</div>
									<!-- BEGIN: coupons -->
									<div class="pull-right">
										<div class="pull-right">
											<div class="input-group">
											<div class="input-group-addon"><strong>{LANG.coupons}</strong></div>
											<input type="text" name="coupons_code" id="coupons_code" class="form-control input-sm" />
											<span class="input-group-btn form-tooltip">
												<button class="btn btn-default btn-sm" id="coupons_action" data-action="check" data-toggle="tooltip" data-placement="top" title="" data-original-title="{LANG.coupons_check}" data-tour-id="{TOUR_INFO.id}" >
													<em class="fa fa-sign-in">&nbsp;</em>
												</button>
											</span>
										    </div>
										</div>
									</div>
									<!-- END: coupons -->
								</td>
							</tr>
							<tr>
								<td colspan="{COLSPAN}">
									<div class="pull-left">
										<em class="text-danger">{LANG.price_booking_note}</em>
									</div>
									<div class="pull-right">
										<strong>{LANG.payment_total}: </strong><span class="money"><span id="total_price">{PRICRTOTAL}</span> {MONEY.code}</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- END: customer -->
			
			<!-- BEGIN: payment_method -->
			<div class="panel panel-default">
				<div class="panel-heading">{LANG.payment_method}</div>
				<div class="panel-body">
					<!-- BEGIN: loop -->
					<label class="show"><input type="radio" name="payment_method" value="{PAYMENT_METHOD.id}" {PAYMENT_METHOD.checked} />{PAYMENT_METHOD.title}</label>
					<!-- END: loop -->
					<!-- BEGIN: description -->
					<div class="payment_method {CLASS}" id="payment_method_{PAYMENT_METHOD.id}">
						<hr />
						<div style="height: 200px; overflow: auto">{PAYMENT_METHOD.description}</div>
					</div>
					<!-- END: description -->
				</div>
			</div>
			<!-- END: payment_method -->
			<!-- BEGIN: rule_content -->
			<div class="panel panel-default">
				<div class="panel-heading">{LANG.rule_content}</div>
				<div class="panel-body" style="height: 200px; overflow: auto;">{RULE_CONTENT}</div>
			</div>
			<label class="rule_agree"><input type="checkbox" value="1" name="agree" id="agree" data-error="{LANG.rule_agree_error}" />{LANG.rule_agree}</label>
			<!-- END: rule_content -->

			<p>
				<input type="hidden" name="booking" value="1" />
				<input class="btn btn-primary btn-booking" type="submit" name="submit" value="{LANG.booking}" />
			</p>
		</div>
		<div class="row setup-content" id="step-2" style="display: none">
			<div class="col-xs-24">
				<div class="col-md-24">
				<div class="panel panel-default">
					<div class="panel-body text-center">
						<h1>{LANG.booking_step_2_note}</h1>
						<div id="step-2-content">
							<img src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/images/load_bar.gif" />
							<p>{LANG.booking_step_2_content}</p>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="row setup-content" id="step-3" style="display: none">
			<div class="col-xs-24">
				<div class="col-md-24">
					<div id="step-3-content"></div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<script>
var LANG = [];
LANG.booking_step_2_content_success = '{LANG.booking_step_2_content_success}';

$(document).ready(function() {	
    var navListItems = $('ul.setup-panel li a'),
        allWells = $('.setup-content');

    allWells.hide();

    navListItems.click(function(e)
    {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this).closest('li');
        
        if (!$item.hasClass('disabled')) {
            navListItems.closest('li').removeClass('active');
            $item.addClass('active');
            allWells.hide();
            $target.show();
        }
    });
    
    $('ul.setup-panel li.active a').trigger('click');
    
	$('.datepicker').datepicker({
		dateFormat : "dd/mm/yy",
		changeMonth : true,
		changeYear : true,
		showOtherMonths : true,
		yearRange: "-90:+0"
	});
   	
   	$('input[name="payment_method"]').change(function(){
   		$('.payment_method').addClass('hidden');
   		$('#payment_method_' + $(this).val()).removeClass('hidden');
   	});
});
</script>

<!-- BEGIN: customer_js -->
<script type="text/javascript">
var numcustomer = $('#table_customer_list').data('numcustomer');
  	$('#addcustomer').click(function(e) {
  		e.preventDefault();
  		var html = '';
  		html += '<tr id="customer_' + numcustomer + '">';
  		html += '<td class="text-center">' + (numcustomer + 1) + '</td>';
  	   	html += '<td><input type="text" class="form-control required" name="customer[' + numcustomer + '][fullname]" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity(\'\')" /></td>';
  	   	html += '<td><input type="text" class="form-control datepicker required" readonly="readonly" name="customer[' + numcustomer + '][birthday]" /></td>';
  	   	html += '<td><input type="text" class="form-control" name="customer[' + numcustomer + '][address]" /></td>';
  	   	html += '<td>';
  	   	html += '	<select class="form-control" name="customer[' + numcustomer + '][gender]">';
			<!-- BEGIN: gender_js -->
		html += '		<option value="{GENDER.index}">{GENDER.value}</option>';
				<!-- END: gender_js -->
		html += '	</select>';
		html += '</td>';
		<!-- BEGIN: customer_type_js -->
		html += '<td>';
		html += '	<select class="form-control" name="customer[' + numcustomer + '][customer_type]" onchange="nv_tour_get_price({TOUR_INFO.id}, ' + numcustomer + ');">';
				<!-- BEGIN: loop -->
		html += '		<option value="{CUS_TYPE.index}">{CUS_TYPE.value}</option>';
				<!-- END: loop -->
		html += '	</select>';
		html += '</td>';
		<!-- END: customer_type_js -->
		<!-- BEGIN: age_js -->
		html += '<td>';
		html += '	<select class="form-control" name="customer[' + numcustomer + '][age]">';
				<!-- BEGIN: loop -->
		html += '		<option value="{AGE.index}">{AGE.value}</option>';
				<!-- END: loop -->
		html += '	</select>';
		html += '</td>';
		<!-- END: age_js -->
		<!-- BEGIN: optional_js -->
		html += '<td>';
		html += '	<select class="form-control optional" name="customer[' + numcustomer + '][optional]" onchange="nv_tour_get_price({TOUR_INFO.id}, ' + numcustomer + ');">';
		html += '		<option value="{OPTIONAL.id}_0">{LANG.no}</option>';
		html += '		<option value="{OPTIONAL.id}_1">{LANG.yes}</option>';
		html += '	</select>';
		html += '</td>';
		<!-- END: optional_js -->
		html += '<td><input type="text" readonly="readonly" class="form-control" name="price[' + numcustomer + ']" data-price="0" id="input_price_' + numcustomer + '" /></td>';
		html += '<td><button class="btn btn-danger" onclick="nv_tour_delete_customer(' + numcustomer + '); return false;"><em class="fa fa-trash-o">&nbsp;</em></button></td>';
		html += '</tr>';
  		
  		$('#customer_' + (numcustomer - 1)).after( html );
  		
  		nv_tour_get_price({TOUR_INFO.id}, numcustomer);
  		
  		$('.datepicker').datepicker({
  			dateFormat : "dd/mm/yy",
  			changeMonth : true,
  			changeYear : true,
  			showOtherMonths : true,
  			yearRange: "-90:+0"
  		});
  		
  		nv_tour_get_total_price();
  		
  		numcustomer += 1;
  		
  		nv_tour_limit_customer();
  	});
  	
  	function nv_tour_get_price(tour_id, index, selector) {
  		var price = '';
  		if (!selector){
  			selector = $('input[name="price[' + index + ']"]');		
  		}
  		var age = selector.closest('tr').find('select[name="customer[' + index + '][age]"]').val();
  		var customer_type = selector.closest('tr').find('select[name="customer[' + index + '][customer_type]"]').val();
  		var optional = $('select[name^="customer[' + index + '][optional]"]').map(
  				function(idx, ele) {
  					return $(ele).val();
  				}).get();

  		$.post(nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=booking&nocache=' + new Date().getTime(), 'getprice=1&tour_id=' + tour_id + '&age=' + age + '&customer_type=' + customer_type + '&optional=' + optional, function(res) {
			var obj = $.parseJSON(res);
			selector.val(obj.price_format);
			$('#input_price_' + index).attr('data-price', obj.price);
			nv_tour_get_total_price();
		});
  	}
</script>
<!-- END: customer_js -->

<!-- BEGIN: tour_price_caculate_js -->
<script type="text/javascript">
var numcustomerprice = $('#table_price_caculate').data('numcustomerprice');
  	$('#addcustomerprice').click(function(e) {
  		e.preventDefault();
  		var html = '';
		html += '<tr id="customerprice_' + numcustomerprice + '">';
		html += '	<td class="text-center">' + (numcustomerprice + 1) + '</td>';
			<!-- BEGIN: customer_type_js -->
		html += '	<td><select class="form-control" name="customerprice[' + numcustomerprice + '][type]" onchange="nv_tour_get_price({TOUR_INFO.id}, ' + numcustomerprice + ', $(this));">';
					<!-- BEGIN: loop -->
		html += '			<option value="{CUS_TYPE.index}">{CUS_TYPE.value}</option>';
					<!-- END: loop -->
		html += '</select></td>';
			<!-- END: customer_type_js -->
			<!-- BEGIN: age_js -->
		html += '	<td>';
		html += '		<select class="form-control" name="customerprice[' + numcustomerprice + '][age]" onchange="nv_tour_get_price({TOUR_INFO.id}, ' + numcustomerprice + ', $(this));">';
					<!-- BEGIN: loop -->
		html += '			<option value="{AGE.index}">{AGE.value}</option>';
					<!-- END: loop -->
		html += '		</select>';
		html += '	</td>';
			<!-- END: age_js -->
		html += '	<td><input type="number" name="customerprice[' + numcustomerprice + '][quantity]" class="form-control text-center" value="1" onchange="nv_tour_get_price({TOUR_INFO.id}, ' + numcustomerprice + ', $(this));" min="1" /></td>';
		html += '	<td><input type="text" class="form-control" readonly="readonly" data-priceunit="0" id="input_customerpriceunit_' + numcustomerprice + '" /></td>';
		html += '	<td><input type="text" class="form-control" readonly="readonly" data-price="0" id="input_customerprice_' + numcustomerprice + '" /></td>';
		html += '	<td>';
		html += '		<button class="btn btn-danger" onclick="nv_tour_delete_customerprice(' + numcustomerprice + '); return false;">';
		html += '			<em class="fa fa-trash-o">&nbsp;</em>';
		html += '		</button>';
		html += '	</td>';
		html += '</tr>';
 		$('#customerprice_' + (numcustomerprice - 1)).after( html );
 		nv_tour_get_price({TOUR_INFO.id}, numcustomerprice);
 		numcustomerprice += 1;
  	});
  	
  	function nv_tour_get_price(tour_id, index, selector) {
  		var price = '';
  		if (!selector){
  			selector = $('input[name="customerprice[' + index + '][quantity]"]');		
  		}
  		var age = selector.closest('tr').find('select[name="customerprice[' + index + '][age]"]').val();
  		var customer_type = selector.closest('tr').find('select[name="customerprice[' + index + '][type]"]').val();
  		var quantity = selector.closest('tr').find('input[name="customerprice[' + index + '][quantity]"]').val();

  		$.post(nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=booking&nocache=' + new Date().getTime(), 'getprice=1&tour_id=' + tour_id + '&age=' + age + '&customer_type=' + customer_type + '&quantity=' + quantity, function(res) {
			var obj = $.parseJSON(res);
			$('#input_customerpriceunit_' + index).val(obj.price_format);
			$('#input_customerprice_' + index).val(obj.price_quantity_format);
			$('#input_customerpriceunit_' + index).attr('data-priceunit', obj.price);
			$('#input_customerprice_' + index).attr('data-price', obj.price_quantity);
			nv_tour_get_total_price();
		});
  	}
</script>
<!-- END: tour_price_caculate_js -->

<script type="text/javascript">
var LANG = {};
LANG.coupons_remove = '{LANG.coupons_remove}';
LANG.coupons_check = '{LANG.coupons_check}';
LANG.coupons_remove_confirm = '{LANG.coupons_remove_confirm}';

$(window).load(function(){
    $.each( $('.two_column .panel-default'), function(k,v){
        if( k % 2 == 0 )
        {
            var height1 = $($('.two_column .panel-default')[k]).height();
            var height2 = $($('.two_column .panel-default')[k+1]).height();
            var height = ( height1 > height2 ? height1 : height2 );
            $($('.two_column .panel-default')[k]).height( height );
            $($('.two_column .panel-default')[k+1]).height( height );
        }
    });
});
</script>

<!-- END: main -->