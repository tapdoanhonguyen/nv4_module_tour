<!-- BEGIN: main -->
<div class="block_search_vertical_f1">
    <form action="{NV_BASE_SITEURL}index.php" method="get" >
        <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
        <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
        <input type="hidden" name="{NV_OP_VARIABLE}" value="search" />

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="form-group">
				<div class="col-xs-24 col-sm-8 col-md-5">
				<label>{LANG.keywords}</label>
					<input type="text" class="form-control" name="q" value="{SEARCH.q}" placeholder="{LANG.keywords_input}" />
				</div>
                <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.time}</label>
                    <select class="form-control" name="time">
                    	<option value="0">---{LANG.time_tour_c}---</option>
                    	<!-- BEGIN: time_tour -->
                    	<option value="{TIME.index}" {TIME.selected}>{TIME.value}</option>
                    	<!-- END: time_tour -->
                    </select>
                </div>
                 <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.price_spread}</label>
                    <select name="price_spread" class="form-control">
                        <option value="0">---{LANG.price_spread_c}---</option>
                        <!-- BEGIN: price_spread -->
                        <option value="{PRICE_SPREAD.index}" {PRICE_SPREAD.selected}>{PRICE_SPREAD.title}</option>
                        <!-- END: price_spread -->
                    </select>
                </div>
				
				 <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.cat}</label>
                    <select class="form-control" name="cat">
                    	<option value="0">---{LANG.cat_c}---</option>
                    	<!-- BEGIN: cat -->
                    	<option value="{cat.id}" {cat.selected}>{cat.title}</option>
                    	<!-- END: cat -->
                    </select>
                </div>
				
                <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.inspiration}</label>
                    <select class="form-control" name="inspiration">
                    	<option value="0">---{LANG.inspiration_c}---</option>
                    	<!-- BEGIN: inspiration -->
                    	<option value="{inspiration.bid}" {inspiration.selected}>{inspiration.title}</option>
                    	<!-- END: inspiration -->
                    </select>
                </div>
               
                <div class="col-xs-24 col-sm-8 col-md-2 botton_search">
                    <input type="hidden" name="is_search" value="1" />
                    <input type="submit" class="btn btn-primary" value="{LANG.search}" />
                </div>
            </div>
        </div>
		</div>
    </form>
</div>
<!-- END: main -->