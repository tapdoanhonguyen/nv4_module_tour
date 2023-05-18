<!-- BEGIN: main -->
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2-bootstrap.min.css">

<div class="block_search_list">
    <form action="{NV_BASE_SITEURL}index.php" method="get" >
        <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
        <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
        <input type="hidden" name="{NV_OP_VARIABLE}" value="search" />

        <div class="col-xs-24 col-sm-6 col-md-5">
            <input type="text" class="form-control" name="q" value="{SEARCH.q}" placeholder="{LANG.keywords_input}" />
        </div>
        <div class="col-xs-24 col-sm-6 col-md-6">
            <select name="catid" id="catid" class="form-control">
                <option value="0">---{LANG.cat_c}---</option>
                <!-- BEGIN: cat -->
                <option value="{CAT.id}" {CAT.selected}>{CAT.space}{CAT.title}</option>
                <!-- END: cat -->
            </select>
        </div>
        <div class="col-xs-24 col-sm-6 col-md-10">
            {LOCATION}
        </div>
        <div class="col-xs-24 col-sm-6 col-md-2">
            <input type="hidden" name="is_search" value="1" />
            <input type="submit" class="btn btn-primary" value="{LANG.search}" />
        </div>
    </form>
    <div class="clearfix"></div>
</div>

<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/i18n/{NV_LANG_INTERFACE}.js"></script>
<script>
    $('#catid').select2({
        theme: 'bootstrap',
        language: '{NV_LANG_INTERFACE}'
    });
</script>
<!-- END: main -->