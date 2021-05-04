<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>::: 사인패드 테스트 :::</title>

   	<script src="${contextPath}/resources/js/jquery-1.11.3.min.js" type="text/javascript">
    </script>
    <script src="${contextPath}/resources/js/signature_pad.min.js" type="text/javascript">
    </script>

    <link rel="stylesheet" href="${contextPath}/resources/css/css.css">
</head>

<body>
<div class="modal fade" id="modal-dialog_sign">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">서명하기</h4>
			</div>
			<div class="modal-body">
				<div id="signature-pad" class="m-signature-pad">
			        <div class="m-signature-pad--body">
			            <canvas></canvas>
			        </div>
			        <div class="m-signature-pad--footer">
			            <div class="description">사인해 주세요~</div>
			            <button type="button" class="button clear" data-action="clear">지우기</button>
			            <button type="button" class="button save" data-action="save">저장</button>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>

    <script>
        var canvas = $("#signature-pad canvas")[0];
        var sign = new SignaturePad(canvas, {
            minWidth: 5,
            maxWidth: 10,
            penColor: "rgb(66, 133, 244)"
        });

        $("[data-action]").on("click", function(){
            if ( $(this).data("action")=="clear" ){
                sign.clear();
            }
            else if ( $(this).data("action")=="save" ){
                if (sign.isEmpty()) {
                    alert("사인해 주세요!!");
                } else {
                    $.ajax({
                        url : "save.jsp",
                        method : "post",
                        dataType : "json",
                        data : {
                            sign : sign.toDataURL()
                        },
                        success : function(r){
                            alert("저장완료 : " + r.filename);
                            sign.clear();
                        },
                        error : function(res){
                            console.log(res);
                        }
                    });
                }
            }
        });


        function resizeCanvas(){
            var canvas = $("#signature-pad canvas")[0];

            var ratio =  Math.max(window.devicePixelRatio || 1, 1);
            canvas.width = canvas.offsetWidth * ratio;
            canvas.height = canvas.offsetHeight * ratio;
            canvas.getContext("2d").scale(ratio, ratio);
        }

        $(window).on("resize", function(){
            resizeCanvas();
        });

        resizeCanvas();
    </script>
</body>
</html>