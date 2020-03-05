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
	
	<script type="text/javascript">
		var rankRouteParams = {
			"type" : 1,
    		"rid": 0,
    		"arc_type": 0,
    		"day": 3,
    		"season_type": 1
  		}
		/*投稿排序 和 日排序*/
		var dropdown1 = $(".rank-tab-wrap .rank-dropdown:first");
		var dropdown2 = $(".rank-tab-wrap .rank-dropdown:last");
		var selected1 = $(".bili-dropdown .selected:first");
		var selected2 = $(".bili-dropdown .selected:last");
		var list1 = $(".bili-dropdown .dropdown-list:first");
		var list2 = $(".bili-dropdown .dropdown-list:last");
		var item = $(".dropdown-list .dropdown-item");
		dropdown1.on("mouseover",function(){
			list1.css({"display":"inline"});
		});
		dropdown1.mouseleave(function(){
			list1.css({"display":"none"});
		});
		dropdown2.on("mouseover",function(){
			list2.css({"display":"inline"});
		});
		dropdown2.mouseleave(function(){
			list2.css({"display":"none"});
		});
		var arg_type = [0,1];
		var day =[1,3,7,30];
		var type_day = arg_type.concat(day);
		
		for(var i=0;i<arg_type.length;i++){			
			var temp = $(".dropdown-list .dropdown-item:eq(\""+i+"\")");
			temp.attr("value",arg_type[i]);
			//temp.on("click",{"selected":selected1,"object":temp},callback)
			temp.on("click",function(){
				console.log($(this));
				var value = $(this).attr("value");
				var text = $(this).text();
				selected1.text(text);
				rankRouteParams.arc_type = parseInt(value);
				for(var j=0;j<arg_type.length;j++){
					list_li = $(".dropdown-list .dropdown-item:eq(\""+j+"\")");
					list_li.css("display","inline");
				}
				$(this).css("display","none");
				console.log("arc_type="+rankRouteParams.arc_type+";"+"day="+rankRouteParams.day);
				send2BackEnd();
			});
		}

		for(var i=arg_type.length;i<type_day.length;i++){			
			var temp = $(".dropdown-list .dropdown-item:eq(\""+i+"\")");
			temp.attr("value",type_day[i]);
			//temp.on("click",{"selected":selected1,"object":temp},callback)
			temp.on("click",function(){
				console.log($(this));
				var value = $(this).attr("value");
				var text = $(this).text();
				selected2.text(text);
				rankRouteParams.day = parseInt(value);
				for(var j=arg_type.length;j<type_day.length;j++){
					list_li = $(".dropdown-list .dropdown-item:eq(\""+j+"\")");
					list_li.css("display","inline");
				}
				$(this).css("display","none");
				console.log("arc_type="+rankRouteParams.arc_type+";"+"day="+rankRouteParams.day);
				send2BackEnd();
			});
		}
		/*投稿排序 和 日排序*/

		
		/*全站榜 原创榜 。。。*/
		menu_lis = $(".rank-head>.rank-menu>li")
		for(var i=0;i<menu_lis.length;i++){
			menu_lis.eq(i).on("click",function(){
				$(".rank-head>.rank-menu>.active").removeClass("active");
				$(this).addClass("active");
				var value = $(this).attr("type");
				switch(value){
					case "all":
						rankRouteParams.type = 1;
						break;
					case "origin":
						rankRouteParams.type = 2;
						break;
					case "bangumi":
						rankRouteParams.type = 4; //无用
						break;
					case "cinema":
						rankRouteParams.type = 5;	//无用
						break;
					case "rookie":
						rankRouteParams.type = 3;
						break;
					default:
						alert("出错了");
					
				}
				console.log(value+"="+rankRouteParams.type);
				send2BackEnd();
			});
			
		}
		/*全站榜 原创榜 。。。*/

		//全站、动画、游戏
		var channels = [0,1,168,3,129,4,36,188,160,119,155,5,181];
		var ranktabLis = $(".rank-tab>li");
		for(var i=0;i<ranktabLis.length;i++){
			ranktabLis.eq(i).attr("value",channels[i]);
			ranktabLis.eq(i).on("click",function(){
				$(".rank-tab>.active").removeClass("active");
				$(this).addClass("active");
				rankRouteParams.rid = parseInt($(this).attr("value"));
				console.log("rid"+"="+rankRouteParams.rid);
				send2BackEnd();
			});
		}
		//全站、动画、游戏

		function send2BackEnd(){
			$.ajax({
				"url":"/bilibili/ranklist",
				"type":"get",
				"data":rankRouteParams,
				"dataType":"json",
				"success":function(json){
					console.log(json);
					updateData(json);
				}
			});
		}
		function updateData(json){
			$(".rank-list-head .rank_tips .tip-txt").text(json.data.note);
			for(var i=0;i<json.data.list.length;i++){
				$(".rank-item .content .info .title:eq(\""+i+"\")").text(json.data.list[i].title);
				var authorHtml= "<i class='b-icon author'></i>" + json.data.list[i].author;
				var viewHtml= "<i class='b-icon view'></i>" + json.data.list[i].video_review;
				var playHtml= "<i class='b-icon play'></i>" + json.data.list[i].play; 
				$(".rank-item .content .info .detail .data-box:eq(\""+i*3+"\")").html(playHtml);//播放量
				$(".rank-item .content .info .detail .data-box:eq(\""+(i*3+1)+"\")").html(viewHtml);//评论
				$(".rank-item .content .info .detail .data-box:eq(\""+(i*3+2)+"\")").html(authorHtml);//作者


				$(".rank-item .content .info .pts div:eq(\""+i+"\")").text(json.data.list[i].pts);//评分

				$(".rank-item .content .img .cover img:eq(\""+i+"\")").attr("src",json.data.list[i].pic);//封面
				$(".rank-item .content .img a:eq(\""+i+"\")").attr("href","https://www.bilibili.com/video/av"+json.data.list[i].aid);//封面链接指向	
				$(".rank-item .content .info .title:eq(\""+i+"\")").attr("href","https://www.bilibili.com/video/av"+json.data.list[i].aid);//标题链接指向
				if("others" in json.data.list[i]){
					
					if("title" in json.data.list[i].others[0]){
						$(".other .other-link .title:eq(\""+i+"\")").text(json.data.list[i].others[0].title);
					}
					if("pts" in json.data.list[i].others[0]){
						$(".other strong:eq(\""+i+"\")").text(json.data.list[i].others[0].pts);
					}					
				}								
			}
			
		}
		
		$(document).ready(send2BackEnd());
		

		
		
		
		


		
		
	console.log(rankRouteParams);	
	</script>
</body>
</html>