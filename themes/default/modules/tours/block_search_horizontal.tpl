<!-- BEGIN: main -->
<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2-bootstrap.min.css">

<div class="block_search">
    <form action="{NV_BASE_SITEURL}index.php" method="get" class="form-horizontal" >
        <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
        <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
        <input type="hidden" name="{NV_OP_VARIABLE}" value="search" />

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-4 col-md-4 control-label">{LANG.keywords}</label>
                    <div class="col-xs-12 col-sm-20 col-md-20">
                        <input type="text" class="form-control" name="q" value="{SEARCH.q}" placeholder="{LANG.keywords_input}" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-4 col-md-4 control-label">{LANG.cat}</label>
                    <div class="col-xs-12 col-sm-20 col-md-20">
                        <select name="catid" id="catid" class="form-control">
                            <option value="0">---{LANG.cat_c}---</option>
                            <!-- BEGIN: cat -->
                            <option value="{CAT.id}" {CAT.selected}>{CAT.space}{CAT.title}</option>
                            <!-- END: cat -->
                        </select>
                    </div>
                </div>
            
            
                <div class="form-group">
                    <label class="col-xs-12 col-sm-4 col-md-4 control-label">{LANG.place_end}</label>
                    <div class="col-xs-12 col-sm-20 col-md-20">
                        {PLACE_END}
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-4 col-md-4 control-label"></label>
                    <div class="col-xs-12 col-sm-20 col-md-20">
                        <input type="submit" class="btn btn-primary" value="{LANG.search}" />
                    </div>
                </div>
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