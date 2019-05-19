<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Youtube API 사용 후 검색결과 중, videoId를 얻어왔다고 가정 -->
<%
	String videoId = "Dt5hFexM5BI";
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>

<!-- 부트스트랩 모달 사용위해 필요한 부분 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	 
	$('#trailer').focusin(function() {
		$('#trailerModal').modal();
	});

});
</script>

</head>
<body>
	<!-- ************************ Youtube API를 위해 필요한 부분 ① start ************************-->
    <!-- 주의: src링크에 enablejsapi=1 을 꼭 넣어주어야 한다. -->
 
    <script type="text/javascript">
        /**
         * Youtube API 로드
         */
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
 
        /**
         * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
         * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
         * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
         */
        var player;
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('movieTrailerIFrame', {
//                height: '315',            // <iframe> 태그 지정시 필요없음
//                width: '560',             // <iframe> 태그 지정시 필요없음
//                videoId: '9bZkp7q19f0',   // <iframe> 태그 지정시 필요없음
//                playerVars: {             // <iframe> 태그 지정시 필요없음
//                    controls: '2'
//                },
                events: {
                    'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                    'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
                }
            });
        }
        function onPlayerReady(event) {
            console.log('onPlayerReady 실행');
 
            // 플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
            event.target.playVideo();
        }
        var playerState;
        function onPlayerStateChange(event) {
            playerState = event.data == YT.PlayerState.ENDED ? '종료됨' :
                    event.data == YT.PlayerState.PLAYING ? '재생 중' :
                    event.data == YT.PlayerState.PAUSED ? '일시중지 됨' :
                    event.data == YT.PlayerState.BUFFERING ? '버퍼링 중' :
                    event.data == YT.PlayerState.CUED ? '재생준비 완료됨' :
                    event.data == -1 ? '시작되지 않음' : '예외';
 
            console.log('onPlayerStateChange 실행: ' + playerState);
        }
    </script>
	<!-- ************************ Youtube API를 위해 필요한 부분 ① end ************************-->
	
<button type="button" id="trailer" class="btn btn-primary">예고편</button>

<div id="trailerModal" class="modal fade" role="dialog">
<h5 class="modal-title" id="myModalLabel">예고편</h5>
    <div class="modal-dialog modal-lg">
        <div class="modal-content modal-lg">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>    
            <div class="modal-body text-center">
            	<!-- ********************* Youtube API를 위해 필요한 부분 ② ********************* -->
            	<iframe id="movieTrailerIFrame" width="100%" height="500px" src="https://www.youtube.com/embed/<%=videoId%>?rel=0&enablejsapi=1" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>

</body>
</html>