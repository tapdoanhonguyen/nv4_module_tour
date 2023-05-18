<!-- BEGIN: main -->
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2-bootstrap.min.css">

<div class="block_search">
    <form action="{NV_BASE_SITEURL}index.php" method="get" >
        <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
        <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
        <input type="hidden" name="{NV_OP_VARIABLE}" value="search" />

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="form-group">
				<div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.keywords}</label>
                    <input type="text" class="form-control" name="q" value="{SEARCH.q}" placeholder="{LANG.keywords_input}" />
                </div>
               
				
                 <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.begin_time}</label>
					<div class="input-group">
						<input class="form-control" value="{SEARCH.date_begin}" type="text" id="date_begin" name="date_begin" readonly="readonly" placeholder="{LANG.date_begin}" />
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" id="date_begin-btn">
								<em class="fa fa-calendar fa-fix">&nbsp;</em>
							</button> </span>
					</div>
					</div>
                
                <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.end_time}</label>
					<div class="input-group">
						<input class="form-control" value="{SEARCH.date_end}" type="text" id="date_end" name="date_end" readonly="readonly" placeholder="{LANG.date_end}" />
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" id="date_end-btn">
								<em class="fa fa-calendar fa-fix">&nbsp;</em>
							</button> </span>
					</div>
                </div>
                <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.place_start}</label>
                    {PLACE_START}
                </div>
                <div class="col-xs-24 col-sm-8 col-md-4">
                    <label>{LANG.place_end}</label>
                    {PLACE_END}
                </div>
                
                    <input type="hidden" name="is_search" value="1" />
                    <input type="submit" class="btn btn-primary" value="{LANG.search}" />
                
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/language/jquery.ui.datepicker-{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/i18n/{NV_LANG_INTERFACE}.js"></script>
<script>
    $('#catid').select2({
        theme: 'bootstrap',
        language: '{NV_LANG_INTERFACE}'
    });
    
	$("#date_begin,#date_end").datepicker({
		dateFormat : "dd/mm/yy",
		changeMonth : true,
		changeYear : true,
		showOtherMonths : true,
	});
</script>
<!-- END: main -->