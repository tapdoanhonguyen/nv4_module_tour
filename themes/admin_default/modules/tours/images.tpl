<!-- BEGIN: main -->
<div class="images">
	<!-- BEGIN: error -->
	<div class="alert alert-danger">{ERROR}</div>
	<!-- END: error -->

	<div class="text-right m-bottom">
		<button class="btn btn-success btn-xs images-add">
			<em class="fa fa-upload fa-lg">&nbsp;</em>{LANG.images_add}
		</button>
	</div>

	<div id="uploader" class="m-bottom"
		<!-- BEGIN: images_add -->
		style="display: block"
		<!-- END: images_add -->>
		<p>{LANG.images_none_support}</p>
	</div>

	<div class="clearfix"></div>

	<form action="" method="post">
		<input type="hidden" name="rows_id" value="{ID}" />

		<!-- BEGIN: data -->
		<!-- BEGIN: loop -->
		<div class="panel panel-default" id="other-image-div-{DATA.number}">
			<div class="panel-body">
				<div class="col-xs-24 col-sm-4 col-md-4">
					<input type="hidden" name="otherimage[{DATA.number}][id]" value="{DATA.id}"> <input type="hidden" name="otherimage[{DATA.number}][basename]" value="{DATA.title}"> <input type="hidden" name="otherimage[{DATA.number}][homeimgfile]" value="{DATA.homeimgfile}"> <input type="hidden" name="otherimage[{DATA.number}][thumb]" value="{DATA.thumb}"> <a href="#" onclick="modalShow('{DATA.basename}', '<img src=\'{DATA.filepath}\' />'); return false;"> <img class="img-thumbnail m-bottom" src="{DATA.filepath}">
					</a>
					<p class="text-center">
						<i class="fa fa-trash-o fa-lg">&nbsp;</i><a href="" onclick="nv_delete_other_images( {DATA.id} ); return false;">{LANG.images_delete}</a>
					</p>
				</div>
				<div class="col-xs-24 col-sm-20 col-md-20">
					<!--
    				<div class="form-group">
    					<div class="input-group">
    						<input class="form-control" type="text" name="homeimg" id="homeimg" value="{rowcontent.homeimgfile}"/>
    						<span class="input-group-btn">
    							<button class="btn btn-default" type="button" id="selectimg">
    								<em class="fa fa-folder-open-o fa-fix">&nbsp;</em>
    							</button>
    						</span>
    					</div>
    				</div>
    				-->
					<div class="form-group">
						<input type="text" name="otherimage[{DATA.number}][title]" value="{DATA.title}" class="form-control" placeholder="{LANG.images_name}">
					</div>
					<div class="form-group">
						<textarea name="otherimage[{DATA.number}][description]" class="form-control" placeholder="{LANG.images_description}">{DATA.description}</textarea>
					</div>
				</div>
			</div>
		</div>
		<!-- END: loop -->
		<!-- END: data -->

		<div id="image-other"></div>

		<div class="text-center alert alert-info info-image-number">
			{LANG.images_empty}<br />
			<!-- BEGIN: alert_image_add -->
			<a href="javascript:void(0);" class="images-add">[{LANG.images_add}]</a>
			<!-- END: alert_image_add -->
		</div>

		<div class="text-center btn-submit"
			<!-- BEGIN: btn_submit -->
			style="display: block"
			<!-- END: btn_submit -->>
			<input type="submit" class="btn btn-primary" value="{LANG.save}" name="submit" />
		</div>
	</form>
</div>

<link type="text/css" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<link type="text/css" href="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" rel="stylesheet" />

<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/plupload/plupload.full.min.js"></script>

<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/plupload/jquery.plupload.queue/jquery.plupload.queue.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{TEMPLATE}/js/plupload/i18n/vi.js"></script>

<script type="text/javascript">
    $(function() {
        var uploader = $("#uploader").pluploadQueue({
	        // General settings
	        runtimes : 'html5,flash,silverlight,html4',
	        url : '{UPLOAD_URL}',
	 
	        // Maximum file size
	        max_file_size : '{MAXFILESIZE}mb',
	 
	        //chunk_size: '{MAXFILESIZE}mb',
	 
	        // Resize images on clientside if we can
	        resize : {
	            width : '{NV_MAX_WIDTH}',
	            height : '{NV_MAX_HEIGHT}',
	            quality : 99,
	            crop: false // crop to exact dimensions
	        },
	 
	        // Specify what files to browse for
	        filters : [
	            //{title : "Image files", extensions : "jpg,gif,png,jpeg"}
	            {title : "Image files", extensions : "png,gif,jpg,bmp,tif,tiff,jpe,jpeg,jfif,ico"}
	        ],
	 
	        // Rename files by clicking on their titles
	        rename: true,
	         
	        // Sort files
	        sortable: true,
	 
	        // Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
	        dragdrop: true,
	 
	        // Views to activate
	        views: {
	            list: true,
	            thumbs: true, // Show thumbs
	            active: 'thumbs'
	        },
	 
	        // Flash settings
	        flash_swf_url : '{NV_BASE_SITEURL}themes/{TEMPLATE}/js/plupload/Moxie.swf',
	     
	        // Silverlight settings
	        silverlight_xap_url : '{NV_BASE_SITEURL}themes/{TEMPLATE}/js/plupload//Moxie.xap',
	        
	        multi_selection: true,
			prevent_duplicates: true,
			multiple_queues: false,
			init: {
				FilesAdded: function (up, files) {},
				UploadComplete: function (up, files) {
					$(".plupload_button").css("display", "inline");
					$(".plupload_upload_status").css("display", "inline");
					$("html, body").animate({ scrollTop: $('.btn-submit').offset().top }, 1000);
				}
			}
	    });
        
        var uploader = $("#uploader").pluploadQueue();
       
		uploader.bind('BeforeUpload', function(up) {
			 up.settings.multipart_params = {
					'folder': ''
			 };
		});
		var i = '{COUNT}';
		uploader.bind('FileUploaded', function(up, file, response) {
			var content = $.parseJSON(response.response).data;
    		var item='';
    			item+='<div class="panel panel-default new-images-append" id="other-image-div-' + i + '">';
    			item+='<div class="panel-body">';
    			item+='				<div class="col-xs-24 col-sm-4 col-md-4">';
    			item+='					<input type="hidden" name="otherimage['+ i +'][id]" value="0">';
    			item+='					<input type="hidden" name="otherimage['+ i +'][basename]" value="'+ content['basename'] +'">';
    			item+='					<input type="hidden" name="otherimage['+ i +'][homeimgfile]" value="'+ content['homeimgfile'] +'">';
    			item+='					<input type="hidden" name="otherimage['+ i +'][thumb]" value="'+ content['thumb'] +'">';
    			item+='					<a href="#" onclick="modalShow(\'' + content['basename'] + '\', \'<img src=' + content['image_url'] + ' />\' ); return false;" >';
    			item+='						<img class="img-thumbnail m-bottom" src="'+ content['thumb'] +'">';
    			item+='					</a>';
    			item+='					<p class="text-center"><i class="fa fa-trash-o fa-lg">&nbsp;</i><a href="" onclick="nv_delete_other_images_tmp(\'' + content['image_url'] + '\', \'' + content['thumb'] + '\', ' + i + '); return false;">{LANG.images_delete}</a></p>';
    			item+='				</div>';
    			item+='				<div class="col-xs-24 col-sm-20 col-md-20">';
    			item+='					<div class="form-group">';
    			item+='						<input type="text" name="otherimage['+ i +'][title]" value="' + content['basename'] + '" class="form-control" placeholder="{LANG.images_name}">';
    			item+='					</div>';
    			item+='					<div class="form-group">';
    			item+='						<textarea name="otherimage['+ i +'][description]" class="form-control" placeholder="{LANG.images_description}"></textarea>';
    			item+='					</div>';
    			item+='				</div>';
    			item+='</div>';
    			item+='</div>';
    			item+='</div>';
    			$('#image-other').append(item);
    			++i;
    	});
    
		uploader.bind("UploadComplete", function () {
		    $('.btn-submit').show();
		    $('.info-image-number').hide();
		});

		uploader.bind('QueueChanged', function() {

		});

		$('#uploader').append('<em class="fa fa-close fa-lg fa-pointer close-upload" onclick="$(\'#uploader\').hide(); $(\'.images-add\').show(); return false;">&nbsp;</em>');
    });

	$('.images-add').click(function(){
	    $('#uploader').show();
	    $('.images-add').hide();
	    $("html, body").animate({scrollTop: 0}, 1000);
	});
</script>

<!-- END: main -->