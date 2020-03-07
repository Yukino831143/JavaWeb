
//初始化参数
var rankRouteParams = {
    "type" : 1,
    "rid": 0,
    "arc_type": 0,
    "day": 3,
    "season_type": 1
}
/*前端页面通过点击时间获取参数*/
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



//全站榜 原创榜 点击获取参数
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
                rankRouteParams.season_type = 1;
                break;
            case "cinema":
                rankRouteParams.type = 5;	//无用
                rankRouteParams.season_type = 3;
                break;
            case "rookie":
                rankRouteParams.type = 3;
                break;
            default:
                alert("出错了");
            
        }
        send2BackEnd();
    });
    
}




//全站、动画、游戏 点击获取参数
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


//将前端获取的参数，统一发送到后端获取具体的数据
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

/*从后端通过前端的参数，获取的数据，用来填充前端的数据*/
function updateData(json){
    if("data" in json){ //全站榜 原创榜 新人榜
        $(".rank-list-head .rank_tips .tip-txt").text(json.data.note); 
        fillList(json);
    }else{ //新番榜 影视榜
        $(".rank-list-head .rank_tips .tip-txt").text(json.result.note); 
        fillList(json);
        
    }
    
    // for(var i=0;i<json.data.list.length;i++){
    //     $(".rank-item .content .info .title:eq(\""+i+"\")").text(json.data.list[i].title);
    //     var authorHtml= "<i class='b-icon author'></i>" + json.data.list[i].author;
    //     var viewHtml= "<i class='b-icon view'></i>" + dataHandler(json.data.list[i].video_review);
    //     var playHtml= "<i class='b-icon play'></i>" + dataHandler(json.data.list[i].play); 
    //     $(".rank-item .content .info .detail .data-box:eq(\""+i*3+"\")").html(playHtml);//播放量
    //     $(".rank-item .content .info .detail .data-box:eq(\""+(i*3+1)+"\")").html(viewHtml);//评论
    //     $(".rank-item .content .info .detail .data-box:eq(\""+(i*3+2)+"\")").html(authorHtml);//作者


    //     $(".rank-item .content .info .pts div:eq(\""+i+"\")").text(json.data.list[i].pts);//评分

    //     $(".rank-item .content .img .cover img:eq(\""+i+"\")").attr("src",json.data.list[i].pic);//封面
    //     $(".rank-item .content .img a:eq(\""+i+"\")").attr("href","https://www.bilibili.com/video/av"+json.data.list[i].aid);//封面链接指向	
    //     $(".rank-item .content .info .title:eq(\""+i+"\")").attr("href","https://www.bilibili.com/video/av"+json.data.list[i].aid);//标题链接指向
    //     if("others" in json.data.list[i]){
            
    //         if("title" in json.data.list[i].others[0]){
    //             $(".other .other-link .title:eq(\""+i+"\")").text(json.data.list[i].others[0].title);
    //         }
    //         if("pts" in json.data.list[i].others[0]){
    //             $(".other strong:eq(\""+i+"\")").text(json.data.list[i].others[0].pts);
    //         }					
    //     }								
    // }
    
}

function fillList(json){
    if("data" in json){//全站榜 原创榜 新人榜
        for(var i=0;i<json.data.list.length;i++){
            $(".rank-item .content .info .pgc-info").remove();//删除新番榜 影视榜添加的更新集数说明
            $(".other-panel:eq(\""+i+"\")").css("display","inline");
            $(".lazy-img img:eq(\""+i+"\")").css({"width":"100%","height":"100%"});
            $(".rank-item:eq(\""+i+"\")").css("display","inline");//以上两条是针对新番榜和影视榜只有50条记录的，隐藏信息恢复和头像正常显示
            $(".rank-item .num:eq(\""+i+"\")").text(i+1);//排名
            $(".rank-item .content .info .title:eq(\""+i+"\")").text(json.data.list[i].title);
            var authorHtml= "<i class='b-icon author'></i>" + json.data.list[i].author;
            var viewHtml= "<i class='b-icon view'></i>" + dataHandler(json.data.list[i].video_review);
            var playHtml= "<i class='b-icon play'></i>" + dataHandler(json.data.list[i].play); 
            $(".rank-item .content .info .detail .data-box:eq(\""+i*3+"\")").html(playHtml);//播放量
            $(".rank-item .content .info .detail .data-box:eq(\""+(i*3+1)+"\")").html(viewHtml);//评论
            $(".rank-item .content .info .detail .data-box:eq(\""+(i*3+2)+"\")").html(authorHtml);//作者
    
    
            $(".rank-item .content .info .pts div:eq(\""+i+"\")").text(json.data.list[i].pts);//评分
    
            $(".rank-item .content .img .cover img:eq(\""+i+"\")").attr("src",json.data.list[i].pic);//封面
            $(".lazy-img img").css("width","100%");
            $(".lazy-img img").css("height","100%");
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
    }else{ //新番榜 影视榜
        
        for(var i=0;i<100;i++){
            if(i<json.result.list.length){
                $(".rank-item .num:eq(\""+i+"\")").text(i+1);//排名
                $(".rank-item .content .info .title:eq(\""+i+"\")").text(json.result.list[i].title);
                var playHtml= "<i class='b-icon play'></i>" + dataHandler(json.result.list[i].stat.view); //播放量
                var viewHtml= "<i class='b-icon view'></i>" + dataHandler(json.result.list[i].stat.danmaku);//弹幕数
                var followHtml= "<i class='fav'></i>" + dataHandler(json.result.list[i].stat.follow);//追番人数
                
                
                $(".rank-item .content .info .detail .data-box:eq(\""+i*3+"\")").html(playHtml);//播放量
                $(".rank-item .content .info .detail .data-box:eq(\""+(i*3+1)+"\")").html(viewHtml);//评论
                $(".rank-item .content .info .detail .data-box:eq(\""+(i*3+2)+"\")").html(followHtml);//作者
                
                var cssJson = {
                   "width": "12px",
                   "height": "12px",
                   "margin-right" : "5px",
                   "display" : "inline-block",
                   "vertical-align" : "text-top",
                   "background-image" : "url(\"asserts/bangumi-zf-icon.png\")",//注意，这个属性是写入的ftl中的html代码，因此想对路径是ftl而非js
                   "background-repeat" : "no-repeat",
                };
                $(".rank-item .content .info .detail .data-box .fav:eq(\""+i+"\")").css(cssJson);
                
        
                $(".rank-item .content .info .pts div:eq(\""+i+"\")").text(json.result.list[i].pts);//评分
        
                $(".rank-item .content .img .cover img:eq(\""+i+"\")").attr("src",json.result.list[i].cover+"@90w_120h.webp");//封面
                $(".lazy-img img").css("width","auto");
                $(".lazy-img img").css("height","auto");

                $(".rank-item .content .img a:eq(\""+i+"\")").attr("href",json.result.list[i].url);//封面链接指向	
                $(".rank-item .content .info .title:eq(\""+i+"\")").attr("href",json.result.list[i].url);//标题链接指向
                $(".other-panel:eq(\""+i+"\")").css("display","none");//多余的other栏

                var pgcInfo = "<div class='pgc-info'>"+json.result.list[i].new_ep.index_show+"</div>";
                // console.log(233);
                // console.log($(".rank-item .content .info .pgc-info").length);
                if($(".rank-item .content .info .pgc-info").length<json.result.list.length){ //避免重复添加
                    $(".rank-item .content .info .title:eq(\""+i+"\")").after(pgcInfo);
                    $(".rank-item .content .info .pgc-info:eq(\""+i+"\")").css("color","#99a2aa");
                }
                
            }else{//新番榜和影视榜只有前五十榜单，所以隐藏一部分
                $(".lazy-img img:eq(\""+i+"\")").css({"width":"100%","height":"100%"});
                $(".rank-item:eq(\""+i+"\")").css("display","none");
            }
            
            							
        }
    }
    
}

function dataHandler(data){
    if(data<9999){
        return data;
    }else{
        return (data/10000).toFixed(1) + "万";
    }
}

$(document).ready(send2BackEnd());

