<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="referrer" content="no-referrer">
<title>Insert title here</title>
<link rel="stylesheet" href="css/rankList.css">
</head>
<body>
	<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
	
	<div class="main-inner b-warp">
		<div class="rank-container">
			<div class="rank-head">
				<ul class="rank-menu">
					<li type="all" class="active">
						<span class="rank-icon all"></span>
						<span class="text">全站榜</span>
					</li>
					<li type="origin">
						<span class="rank-icon origin"></span>
						<span class="text">原创榜</span>
					</li>
					<li type="bangumi">
						<span class="rank-icon bangumi"></span>
						<span class="text">新番榜</span>
					</li>
					<li type="cinema">
						<span class="rank-icon cinema"></span>
						<span class="text">影视榜</span>
					</li>
					<li type="rookie">
						<span class="rank-icon rookie"></span>
						<span class="text">新人榜</span>
					</li>
				</ul>
			</div>
			
			<div class="rank-body">
				<div seasontype="1" class="rank-tab-wrap">
					<ul class="rank-tab">
						<li class="active">全站</li>
						<li class="">国创相关</li>
						<li class="">音乐</li>
						<li class="">舞蹈</li>
						<li class="">游戏</li>
						<li class="">科技</li>
						<li class="">数码</li>
						<li class="">动画</li>
						<li class="">生活</li>
						<li class="">鬼畜</li>
						<li class="">时尚</li>
						<li class="">娱乐</li>
						<li class="">影视</li>
					</ul>
					<div class="rank-type-dropdown">
						<div class="bili-dropdown rank-dropdown"><span class="selected">全部投稿</span><i class="icon icon-arrow-down"></i>
							<ul class="dropdown-list">
								<li class="dropdown-item" style="display:none;">全部投稿</li>
								<li class="dropdown-item" style="display:;">近期投稿</li>
							</ul>
						</div>
						<div class="bili-dropdown rank-dropdown"><span class="selected">三日榜</span><i class="icon icon-arrow-down"></i>
							<ul class="dropdown-list">
								<li class="dropdown-item" style="display:;">日排行</li>
								<li class="dropdown-item" style="display:none;">三日榜</li>
								<li class="dropdown-item" style="display:;">周排行</li>
								<li class="dropdown-item" style="display:;">月排行</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="rank-list-head">
					<div class="rank_tips">
						<i class="b-icon-tip"></i>
						<span class="tip-txt">${test!"eee"}</span>
					</div>
				</div>
				<div class="rank-list-wrap">
					<ul class="rank-list">
						
						<#list 1..100 as i>
							<li class="rank-item">
							<div class="num">1</div>
							<div class="content">
								<div class="img">
									<a href="https://www.bilibili.com/video/av92252043" target="_blank">
										<div class="lazy-img cover">
											<img alt="《崩坏3》动画短片「天穹流星」" src="https://i2.hdslb.com/bfs/archive/2ee7d828e6defd70f932dc6ae098e9429da3a8ac.jpg@114w_70h.webp">
										</div>
									</a>
									<div class="watch-later-trigger w-later"></div>
								</div>
								<div class="info">
									<a href="https://www.bilibili.com/video/av92252043" target="_blank" class="title">《崩坏3》动画短片「天穹流星」</a>
									<!---->
									<div class="detail"><span class="data-box">
										<i class="b-icon play"></i>294.9万</span>
										<span class="data-box"><i class="b-icon view"></i>10.7万</span>
										<a target="_blank" href="//space.bilibili.com/27534330">
											<span class="data-box"><i
													class="b-icon author"></i>崩坏3第一偶像爱酱</span></a>
									</div>
									<div class="pts">
										<div>7913794</div>综合得分
									</div>
								</div>
								<div class="other-panel">
									<div class="other"><a target="_blank" href="//www.bilibili.com/video/av92253209" class="other-link"><span
												class="title">「Starfall」——《崩坏3》印象曲（演唱者：袁娅维）</span><span>综合评分</span><strong>1987119</strong></a>
									</div><a class="more-data" style="display:none;">显示UP主全部上榜视频<i></i></a>
								</div>
							</div>
						</li>
						</#list>
					</ul>
					
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="js/rankList.js"></script>
</body>
</html>