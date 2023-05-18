<!-- BEGIN: main -->
<div class="search_header">
<form action="{NV_BASE_SITEURL}index.php" method="get">
	<input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
	<input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" />
	<input type="hidden" name="{NV_OP_VARIABLE}" value="search" />
	<input class="sb-search-input" placeholder="Tên địa danh." type="text" value="{SEARCH.q}" name="q" id="search">
	<input type="hidden" name="is_search" value="1" />
	<button class="sb-icon-search" type="submit" value="{LANG.search}"><i class="fa fa-search"></i></button>
	<p>Tìm kiếm : <a href="{NV_BASE_SITEURL}search/?q=Mien%20tay&is_search=1">Mien tay</a>, <a href="{NV_BASE_SITEURL}search/?q=Phu%20Quoc&is_search=1">Phu Quoc</a>, <a href="{NV_BASE_SITEURL}search/?q=Nha%20Trang&is_search=1">Nha Trang</a>, ...</p>
</form>
</div>
<!-- END: main -->