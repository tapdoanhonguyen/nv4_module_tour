<!-- BEGIN: main -->
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/thuongmaiso/magicslideshow/magicslideshow.js"></script>
<link href="{NV_BASE_SITEURL}themes/{TEMPLATE}/thuongmaiso/magicslideshow/magicslideshow.css" type="text/css" rel="stylesheet" media="all" />

<div class="row">
 	<div class="col-sm-16 col-md-18">
	
<div class="detail">
	<div class="panel panel-default">
		<div class="panel-body">
	<!-- BEGIN: image -->
	
	<div class="MagicSlideshow album-{ALBUM.id}" data-options="selectors: bottom; selectors-style: thumbnails; selectors-size: 40px;">
				<!-- BEGIN: loop -->
				<img src="{IMAGE.homeimgfile}" alt="{IMAGE.title}" />
				<!-- END: loop -->
		
		</div>

	<!-- END: image -->

	<div class="row" style="margin-top:10px;">
                <div class="col-sm-16 col-md-12">
                     <ul class="product_info">
                      <li><h1>{DATA.title}</h1></li>
					  <li id="description">{DATA.description}</li>
						
                    </ul>
                </div>
                <div class="col-sm-16 col-md-12">
					                      <div class="well">
                  <ul class="product_info">
						<li>{LANG.code}: {DATA.code}</li>
						<li>{LANG.time_tour}: {DATA.num_day}</li>
						<li>{LANG.begin_time}: {DATA.date_start}</li>
						<li>{LANG.place_start}: {DATA.province.title}</li>
						<li>{LANG.rest}: {DATA.rest}</li>
						<!-- BEGIN: vehicle -->
						<li>{LANG.vehicle}: {DATA.vehicle}</li>
						<!-- END: vehicle -->
					  
					    </ul>
					  
					  <div class="clearfix"></div>
                  
                      <!-- BEGIN: price -->
					
					<!-- BEGIN: discounts -->
					<span class="money">{PRICE.sale_format} {PRICE.unit}</span> <span class="discounts_money">{PRICE.price_format} {PRICE.unit}</span> <span>(-{PRICE.discount_percent}%)</span>
					<!-- END: discounts -->

					<!-- BEGIN: no_discounts -->
					<span class="money no-discount">{PRICE.price_format} {PRICE.unit}</span>
					<!-- END: no_discounts -->
					<!-- END: price -->
					
					<!-- BEGIN: contact -->
					 <span class="money">{LANG.tour_price}:{LANG.contact}</span>
					<!-- END: contact -->
				
                    </div>
					
                    <div class="clearfix"></div>
                                       
                </div>
				

				
					<div class="show text-center">
						<div class="btn_tms_booking btn-info "  data-toggle="modal" data-target="#myModal" style="margin-right:20px">{LANG.quick_advice}</div><a href="{URL_BOOKING}" class="btn_tms_booking" >{LANG.booking_now}</a>
					</div>
					
					<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog" id="tms_modal">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">{LANG.contact_info}</h4>
      </div>
      <div class="modal-body">
  
						 <form id="QuickAdviceForm" method="post"  action="{ACTION_BOOKING}"  novalidate>
						
										
											<div class="form-group">
										
													<input type="text" class="form-control required" name="contact_fullname" value="" required="required" oninvalid="setCustomValidity( nv_required )"placeholder="{LANG.contact_fullname}"  oninput="setCustomValidity('')">
									
											</div>
										
											<div class="form-group">
												
													<input type="text" class="form-control required" name="contact_address" value="" required="required" oninvalid="setCustomValidity( nv_required )"placeholder="{LANG.contact_address}"  oninput="setCustomValidity('')">
										
											</div>
									
											<div class="form-group">
												
													<input type="email" class="form-control required" name="contact_email" value="" required="required" oninvalid="setCustomValidity( nv_required )" placeholder="{LANG.contact_email}" oninput="setCustomValidity('')">
												
											</div>
											<div class="form-group">
										
													<input type="text" class="form-control required" name="contact_phone" value="" required="required" oninvalid="setCustomValidity( nv_required )" placeholder="{LANG.contact_phone}"oninput="setCustomValidity('')">
												
											</div>
										
											<div class="form-group">
											
													<textarea class="form-control" name="contact_note"placeholder="{LANG.contact_note}"></textarea>
											
											</div>
										
								
							<div class="text-center form-group">
								<input type="hidden" name="checkss" value="{CHECKSS}" />
								<input type="hidden" name="booking" value="1">
								<input type="hidden" name="tour_id" value="{DATA.id}">
							</div>
						</form>
						<div class="text-center form-group">
							<button class="send_quick_advice">{LANG.send_quick_advice}</button>
						</div>
				    	<div class="contact-result alert"></div>
				


 </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>




				
				
            </div>
	
    </div>    </div>	
	
	

	<div class="clear"></div>
	<div class="m-bottom">
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#plan" aria-controls="plan" role="tab" data-toggle="tab">{LANG.plan}</a></li>
			<li role="presentation"><a href="#detail" aria-controls="detail" role="tab" data-toggle="tab">{LANG.tour_detail}</a></li>
			<!-- BEGIN: tab_price_title -->
			<li role="presentation"><a href="#price" aria-controls="price" role="tab" data-toggle="tab">{LANG.tour_price}</a></li>
			<!-- END: tab_price_title -->
			<!-- BEGIN: hotel_title -->
			<li role="presentation"><a href="#hotel" aria-controls="hotel" role="tab" data-toggle="tab">{LANG.hotels}</a></li>
			<!-- END: hotel_title -->
			
			
			<!-- BEGIN: note_content_title -->
			<li role="presentation"><a href="#note" aria-controls="note" role="tab" data-toggle="tab">{LANG.note_content}</a></li>
			<!-- END: note_content_title -->
			<!-- BEGIN: contact_info_title -->
			<li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">{LANG.contact}</a></li>
			<!-- END: contact_info_title -->
		</ul>
		
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="plan">
			<!-- BEGIN: map -->
			<div id="tms_map" class=" pull-right">
			<figure class="right pointer" onclick="modalShowByObj('#imgpreview');">
                <div id="imgpreview" style="width:100%px;">
                 <img alt="{DATA.title}" src="{DATA.map}" >
				 <figcaption>{LANG.zoom}</figcaption>
                </div>
            </figure>
				
			</div>
			<!-- END: map -->
				<p>{DATA.plan}</p>
	

			</div>
			<div role="tabpanel" class="tab-pane" id="detail">
			<!-- BEGIN: description_html -->
					<div class="panel panel-default">
						<div class="panel-body">	
						{DATA.description}
						</div>	
					</div>
						<!-- END: description_html -->
						
				<!-- BEGIN: services -->
				<div class="services">
					<h3>{LANG.services}</h3>
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<!-- BEGIN: loop -->
								<div class="col-xs-24 col-sm-12 col-md-8">
									<em class="fa fa-check-square-o">&nbsp;</em>{SERVICES}
								</div>
								<!-- END: loop -->
							</div>
						</div>
					</div>
				</div>
				<!-- END: services -->
			
				<!-- BEGIN: flying -->
	
				<div class="divTable">
					<div class="clearfix"></div>	
					<div class="divHeading">
						<div class="Cell">{LANG.flying_info}</div>
						<div class="Cell">{LANG.flying}</div>
						<div class="Cell">{LANG.flying_time}</div>
						<div class="Cell">{LANG.flying_code}</div>
					</div>
					<!-- BEGIN: flying_begin -->
					<div class="Row">
						<div class="Cell">
							{LANG.flying_info_next} &nbsp;
						</div>
						<div class="Cell">{DATA.flying_begin.flying_title_clean} &nbsp;</div>
						<div class="Cell">{DATA.flying_begin.time} &nbsp;</div>
						<div class="Cell">{DATA.flying_begin.code} &nbsp;</div>
					</div>
					<!-- END: flying_begin -->
					<!-- BEGIN: flying_end -->
					<div class="Row">
						<div class="Cell">
							{LANG.flying_info_back} &nbsp;
						</div>
						<div class="Cell">{DATA.flying_end.flying_title_clean} &nbsp;</div>
						<div class="Cell">{DATA.flying_end.time} &nbsp;</div>
						<div class="Cell">{DATA.flying_end.code} &nbsp;</div>
					</div>
					<!-- END: flying_end -->
				</div>
				<!-- END: flying -->

				

				<!-- BEGIN: guides -->
				<div class="divTable">
					<h3>{LANG.guides}</h3>
					<div class="divHeading">
						<div class="Cell">{LANG.full_name}</div>
						<div class="Cell">{LANG.age}</div>
						<div class="Cell">{LANG.address}</div>
						<div class="Cell">{LANG.gender}</div>
						<div class="Cell">{LANG.phone}</div>
					</div>
					<!-- BEGIN: loop -->
					<div class="Row">
						<div class="Cell">{GUIDES.full_name}</div>
						<div class="Cell">{GUIDES.age}</div>
						<div class="Cell">{GUIDES.address}</div>
						<div class="Cell">{GUIDES.gender}</div>
						<div class="Cell">{GUIDES.phone}</div>
					</div>
					<!-- END: loop -->
				</div>
				<!-- END: guides -->

			</div>
			<!-- BEGIN: tab_price_content -->
			<div role="tabpanel" class="tab-pane" id="price">
				<!-- BEGIN: price_method_0 -->
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr class="form-group">
								<td>{LANG.base_price}</td>
								<td class="money">{PRICE.sale_format}</td>
							</tr>
							<!-- BEGIN: subprice -->
							<!-- BEGIN: loop -->
							<tr>
								<td>{SUBPRICE.title}</td>
								<td class="money">{SUBPRICE.price.sale_format}</td>
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
								<td>{TITLE.name} ({TITLE.from} {LANG.to} {TITLE.to} {LANG.age})</td>
								<!-- BEGIN: loop -->
								<td class="money text-center">{PRICE.sale_format}</td>
								<!-- END: loop -->
							</tr>
							<!-- END: price -->

							<!-- BEGIN: subprice -->
							<tr>
								<td class="form-tooltip"><span class="pointer" data-toggle="tooltip" data-placement="top" data-original-title="{SUBPRICE.title}">{SUBPRICE.title_clean}</span></td>
								<!-- BEGIN: loop -->
								<td class="money text-center">{SUBPRICE.price.sale_format}</td>
								<!-- END: loop -->
							</tr>
							<!-- END: subprice -->
						</tbody>
					</table>
				</div>
				<!-- END: price_method_2 -->
				<div class="pull-left text-danger">
					<em>{LANG.price_note}</em>
				</div>
				<div class="pull-right text-right">
					<strong>{LANG.money}:</strong> {MONEY.code} - {MONEY.currency}
				</div>
				<div class="clear"></div>
			</div>
			<!-- END: tab_price_content -->
			<!-- BEGIN: hotel -->
			<div role="tabpanel" class="tab-pane" id="hotel">
			<div class="divTable">
					<h3>{LANG.hotels_info}</h3>
					
					<!-- BEGIN: loop -->
					<div class="panel panel-default">
						<div class="panel-body">	
						<div class="tms_title">{LANG.hotels}:{HOTEL.title}</div>
						<div class="tms_title">{LANG.phone}:{HOTEL.phone}</div>
						<div class="tms_title">{LANG.address}:{HOTEL.address}</div>
						<div class="tms_title">
						{LANG.hotels_type}: <!-- BEGIN: star -->
							<div class="star" title="{HOTEL.star_str}">
								<span class="star-icon">&nbsp;</span>
							</div>
							<!-- END: star --></div>
						<div class="tms_title">	{LANG.hotels_time}: {HOTEL.time}</div>
						
						<div>
						{HOTEL.description}
						
						</div>
						
						
						</div>	
						</div>
					
				
					<!-- END: loop -->
				</div>
			</div>
			
		
				<!-- END: hotel -->
			
			
			<!-- BEGIN: note_content_content -->
			<div role="tabpanel" class="tab-pane" id="note">
			{NOTE}
			</div>
			<!-- END: note_content_content -->
			
			<!-- BEGIN: contact_info_content -->
			<div role="tabpanel" class="tab-pane" id="contact">
			{CONTACT_INFO}
			</div>
			<!-- END: contact_info_content -->
		
			<!-- BEGIN: keywords -->
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="h5">
				<em class="fa fa-tags">&nbsp;</em><strong>{LANG.keywords}: </strong>
				<!-- BEGIN: loop -->
				<a title="{KEYWORD}" href="{LINK_KEYWORDS}"><em>{KEYWORD}</em></a>{SLASH}
				<!-- END: loop -->
			</div>
		</div>
	</div>
	<!-- END: keywords -->
	<div class="clearfix"></div>
	<div class="well well-sm">
	<script src="https://sp.zalo.me/plugins/sdk.js"></script>
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5cd144d8eaed40e2"></script>
	<center>	<strong>Chia sẻ bài viết: </strong>
	<div class="zalo-share-button"style="margin-top:5px;" data-href="" data-oaid="3342070368901995887" data-layout="1" data-color="blue" data-customize=false></div>
	<div class="addthis_inline_share_toolbox"></div>
	</center>
    	</div>
		<div class="clearfix"></div>
	
	</div>
		<!-- BEGIN: comment -->
	<div class="panel panel-default">
		<div class="panel-body">
	{COMMENT}
		</div>
	</div>
	<!-- END: comment -->
	</div>
		<div class="show text-center">
						<a href="{URL_BOOKING}" class="btn_tms_booking" >{LANG.booking_now}</a>
					</div>

	</div>
	</div>
<div class="col-sm-8 col-md-6">

	<div class="tms_block_new_titlle"><h3>{LANG.other}</h3></div>

			<div class="clearfix"></div>
	<!-- BEGIN: tour_other -->
      {TOUR_OTHER}
    <!-- END: tour_other -->

		
	</div>
</div>


<script src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/tours_anchor.min.js"></script>
<script>
function quick_advice_show() {
  $("#quick_advice").show();
}

$(document).on("click",".send_quick_advice", function(){
	var $form = $("#QuickAdviceForm");
	contact_fullname = $form.find( "input[name='contact_fullname']" ).val(),
	contact_address = $form.find( "input[name='contact_address']" ).val();
	contact_email = $form.find( "input[name='contact_email']" ).val();
	contact_phone = $form.find("input[name='contact_phone']").val(),
	contact_note = $form.find("textarea[name='contact_note']").val();
	tour_id = $form.find("input[name='tour_id']").val();
	var url = document.getElementById('QuickAdviceForm').action;
	if(contact_fullname==''){
		alert('{LANG.error_contact_fullname}');
		$("input[name='contact_fullname']").focus();
		return false;
	}else
	if(contact_address==''){
		alert('{LANG.error_contact_address}');
		$("input[name='contact_address']").focus();
		return false;
	}else
	if(contact_email==''){
		alert('{LANG.error_contact_email}');
		$("input[name='contact_email']").focus();
		return false;
	}else
	if(contact_phone==''){
		alert('{LANG.error_contact_phone}');
		$("input[name='contact_phone']").focus();
		return false;
	}else{
		$.post(url + '?nocache=' + new Date().getTime(), 'booking=1'+'&tour_id=' + tour_id + '&contact_fullname='+contact_fullname+'&contact_address='+contact_address+'&contact_email='+contact_email+'&contact_phone='+contact_phone+'&contact_note='+contact_note, function(res){
			console.log(res);
			var obj = JSON.parse(res);
			if(obj.status == 'success')
			{ alert(obj.mess);}
			else{alert(obj.mess);}
		});
	}
});
</script>

<!-- END: main -->