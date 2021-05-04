<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="${contextPath}/resources/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/animate.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/style-responsive.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->

	<!-- ================== BEGIN PAGE CSS STYLE ================== -->
	<link href="${contextPath}/resources/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet" />
	<link href="${contextPath}/resources/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css" rel="stylesheet" />
	<!-- ================== END PAGE CSS STYLE ================== -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/pace/pace.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery/jquery-1.9.1.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	<link href="${contextPath}/resources/plugins/DataTables/css/data-table.css" rel="stylesheet" />
	<script src="${contextPath}/resources/plugins/DataTables/js/jquery.dataTables.js"></script>
	<script src="${contextPath}/resources/js/table-manage-default.demo.min.js"></script>

	<!-- Attachment -->
	<link href="${contextPath}/resources/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" />
    <link href="${contextPath}/resources/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
    <link href="${contextPath}/resources/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />

	<style type="text/css">

		#receiverInput {
			text-align: left;
			color: lightgray;
			font-size: 1em;
		}

		.bg-white {
			height : 614px;
		}

		.m-b-15 {
			margin-bottom: 55px !important;
		}

		body {
			background: white;
		}

		.p-0 {
			margin-bottom: 15px;
		}

	</style>

</head>
<body>
	<div class="p-30 bg-white m-t-0">
	    <!-- begin email form -->
	    <form id="fileupload" action="writeMessenger" method="POST" name="email_to_form" enctype="multipart/form-data">
	        <!-- begin email to -->
	        <div class="m-b-15">
		        <label class="control-label">To:</label>
				<a href="#modal-dialog" class="btn btn-block btn-white" data-toggle="modal" id="receiverInput">클릭하여 수신자를 선택하세요.</a>
			</div>
	        <!-- end email to -->

			<!-- attachment -->
			<div class="m-b-15">
				<label class="control-label">attachment:</label>

				<div class="panel panel-inverse">
					<div class="row fileupload-buttonbar">
						<div class="col-md-12">
							<div class="col-md-6">
								<span class="btn btn-success btn-block fileinput-button">
									<i class="fa fa-plus"></i>
								    <span>Add files...</span>
								    <input type="file" name="files[]" multiple id="fileInput">
								</span>
							</div>
							<div class="col-md-6">
								<button type="reset" class="btn btn-warning btn-block cancel" id="resetUploadBtn">
								    <i class="fa fa-ban"></i>
								    <span>Reset upload</span>
								</button>
							</div>
						</div>
						<!-- The table listing the files available for upload/download -->
						<table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
					</div>
				</div>
			</div>

	        <!-- begin email content -->
	        <div class="m-b-15">
		        <label class="control-label">Content:</label>
				<textarea class="textarea form-control" name="messengerContent" id="messengerContent" rows="12" placeholder="Enter text ..."></textarea>
			</div>
	        <!-- end email content -->
	        <div class="col-md-12 p-0">
		        <div class="col-md-6 p-0 p-r-5">
		        	<input type="button" id='cancleBtn' class="btn btn-danger btn-block" value="cancle">
		        </div>
		        <div class="col-md-6 p-0 p-l-5">
		        	<input type="button" id='saveFileBtn' class="btn btn-primary btn-block" value="send">
		        </div>
		        </div>
		        <!-- tags hidden -->
		        <div id="hiddenArea"></div>
	    	</form>
        </div>

	<!-- The template to display files available for upload -->
    <script id="template-upload" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-upload fade">
                <td class="col-md-1">
                    <span class="preview"></span>
                </td>
                <td>
                    <p class="name">{%=file.name%}</p>
                </td>
                <td>
                    <p class="size">Processing...</p>
                </td>
                <td>
                    {% if (!i) { %}
                        <button class="btn btn-danger btn-xs m-r-5 cancel">
                            <i class="fa fa-ban"></i>
                            <span>Cancel</span>
                        </button>
                    {% } %}
                </td>
            </tr>
        {% } %}
    </script>
    <!-- The template to display files available for download -->
    <script id="template-download" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-download fade">
                <td>
                    <span class="preview">
                        {% if (file.thumbnailUrl) { %}
                            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                        {% } %}
                    </span>
                </td>
                <td>
                    <p class="name">
                        {% if (file.url) { %}
                            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                        {% } else { %}
                            <span>{%=file.name%}</span>
                        {% } %}
                    </p>
                    {% if (file.error) { %}
                        <div><span class="label label-danger">Error</span> {%=file.error%}</div>
                    {% } %}
                </td>
                <td>
                    <span class="size">{%=o.formatFileSize(file.size)%}</span>
                </td>
                <td>
                    {% if (file.deleteUrl) { %}
                        <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                            <i class="glyphicon glyphicon-trash"></i>
                            <span>Delete</span>
                        </button>
                        <input type="checkbox" name="delete" value="1" class="toggle">
                    {% } else { %}
                        <button class="btn btn-warning cancel">
                            <i class="glyphicon glyphicon-ban-circle"></i>
                            <span>Cancel</span>
                        </button>
                    {% } %}
                </td>
            </tr>
        {% } %}
    </script>




	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${contextPath}/resources/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${contextPath}/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="${contextPath}/resources/plugins/jquery-tag-it/js/tag-it.min.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
	<script src="${contextPath}/resources/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
	<script src="${contextPath}/resources/js/email-compose.demo.min.js"></script>

	<script src="${contextPath}/resources/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/vendor/tmpl.min.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/vendor/load-image.min.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.fileupload-image.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.fileupload-audio.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.fileupload-video.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="${contextPath}/resources/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>

	<script src="${contextPath}/resources/js/form-multiple-upload.demo.min.js"></script>
	<script src="${contextPath}/resources/js/apps.min.js"></script>
	<script src="${contextPath}/resources/js/SockJs.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	<script type="text/javascript">
		$(document).ready(function() {
	        App.init();
	        EmailCompose.init();
	        TableManageDefault.init();
	        FormMultipleUpload.init();
	     });

	     var fileData = [];
	     $("#fileInput").change(function(){
	        var fileList = $("#fileInput")[0].files;
	        for(var i=0; i<fileList.length; i++){
	           fileData.push(fileList[i]);
	        }
	     });

	     $("#saveFileBtn").click(function(){
	    	 var formData = new FormData($('#fileUploadForm')[0]);
	        if(fileData.length > 0){
	           for(var i in fileData){
	              formData.append("files", fileData[i]);
	           }
	        }

	        var messengerContent = $("#messengerContent").val();
	        var tags = [];

	        $("input[name=tags]").each(function(){
	        	tags.push($(this).val());
	        });

	        formData.append("messengerContent", messengerContent);
	        formData.append("tags", tags);
	        $.ajax({
	           url : "writeMessenger",
	           data : formData,
	           type : "POST",
	           dataType : "json",
	           cache: false,
	           contentType: false,
	           processData: false,
	           async : true,
	           success : function(data) {
	        	   	webSocket = new SockJS('/onepart/messenger');
		   			webSocket.onerror = function(event) {
		   				alert(event.data);
		   			};
		   			// 연결 성공 시 실행
		   			webSocket.onopen = function(event) {
		   				console.log('websocket connection success...');
		   				// 연결 성공 시 Map에 seq, session 담기
		   				var message = {};
		   				message.type = 'refreshCount';
		   				message.target = tags;
		   				webSocket.send(JSON.stringify(message));
		   			};

		   			setTimeout(function() {
		        	    location.href = 'moveMessenger';
					}, 2000);

	           }
	        });
	     });

	     $('#resetUploadBtn').click(function(){
	    	 for(var i=0; i<fileData.length; i++){
	        	delete fileData[i];
	        }
	     });

	     $('#cancleBtn').click(function(){
	    	 location.href = 'moveMessenger';
	     });

		$(document).on('click', '.cancel', function(){
			var deleteFileNm = $(this).parents('tr').children('td').eq(1).find('p').text();
			for(var i in fileData){
				if(fileData[i].name == deleteFileNm){
					delete fileData[i];
				}
			}
		});



	</script>
	<jsp:include page="writeMessengerFormModal.jsp"/>

</body>
</html>