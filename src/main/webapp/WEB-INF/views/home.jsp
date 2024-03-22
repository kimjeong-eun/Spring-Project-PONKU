<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
.video-background {
	background: #000;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -99;
	filter: brightness(0.7);
}

.video-foreground, .video-background iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;
}

@media ( min-aspect-ratio : 16/9) {
	.video-foreground {
		height: 300%;
		top: -100%;
	}
}

@media ( max-aspect-ratio : 16/9) {
	.video-foreground {
		width: 300%;
		left: -100%;
	}
}
</style>
</head>
<body>
	<div class="video-background">
		<div class="video-foreground">
			<div id="player"></div>
		</div>
	</div>

	<script>
		var tag = document.createElement('script');
		tag.src = "https://www.youtube.com/iframe_api";
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

		var player;

		function onYouTubeIframeAPIReady() {
			player = new YT.Player('player', {
				playerVars : {
					'autoplay' : 1,
					'controls' : 0,
					'mute' : 1,
					'loop' : 1,
					'playlist' : '_ApV7Lm87cg'
				},
				videoId : '_ApV7Lm87cg', // 영상 고유 주소
				events : {
					'onReady' : onPlayerReady
				}
			});
		}

		function onPlayerReady(event) {
			player.playVideo();
		}

		document.querySelector('.video-background').addEventListener('click',
				function() {
					if (player.isMuted()) {
						player.unMute();
					} else {
						player.mute();
					}
				})
	</script>
</body>
</html>
