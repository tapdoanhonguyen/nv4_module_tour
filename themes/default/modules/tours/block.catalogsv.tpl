<!-- BEGIN: main -->

<link rel="stylesheet" type="text/css"	href="{NV_BASE_SITEURL}themes/{TEMPLATE}/css/ddsmoothmenu.css" />
<script type="text/javascript"	src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/ddsmoothmenu.js"></script>
<script type="text/javascript">
ddsmoothmenu.init({
	arrowimages: {down:['downarrowclass', '{NV_BASE_SITEURL}themes/{TEMPLATE}/images/down.gif', 23], right:['rightarrowclass', '{NV_BASE_SITEURL}themes/{TEMPLATE}/images/arrow_left_orange.png']},
	mainmenuid: "smoothmenus_{ID}",
	zIndex: 200,
	orientation: 'v',
	classname: 'ddsmoothmenu-v',
	contentsource: "markup"
})
</script>
<div id="smoothmenus_{ID}" class="ddsmoothmenu-v">
	<ul>
		{CONTENT}
	</ul>

</div>


<!-- END: main -->