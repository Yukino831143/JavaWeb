$(".search-button").click(function(){
    var keyword = $("#search-keyword").val();
    console.log(keyword);
    $.ajax({
        "url":"/bilibili/info",
        "type":"get",
        "data":{"upName":keyword},
        "dataType":"json",
        "success":function(json){
            processDate(json);
        }
    });
});

function processDate(json){
    $(".name>span").text(json["name"]);
    level2pic(parseInt(json["level"]));/*添加等级图标*/
    $("#uid").text(json["uid"]);
    $("#sign").text(json["sign"]);
    $("#follower").text(json["follower"]);
    //添加个人认证图标和对应文字
    faceSubicon(json["certification"],json);
    
    $("#view").text(json["view"]);
    $("#liveStatus").text(json["liveStatus"]);
    $("#aid").text(json["latestAvDic"]["aid"]);
    $("#title").text(json["latestAvDic"]["title"]);
    $("#desc").text(json["latestAvDic"]["desc"]);
    $("#favorite").text(json["latestAvDic"]["favorite"]);
    $("#coin").text(json["latestAvDic"]["coin"]);
    $("#share").text(json["latestAvDic"]["share"]);
    $("#like").text(json["latestAvDic"]["like"]);
    $("#danmaku").text(json["latestAvDic"]["danmaku"]);
    $(".face").css({"background-image":"url(\""+json["face__64x64"]+"\")","background-repeat":"no-repeat"});
    $(".latestAv .cover").css({"background-image":"url(\""+json["latestAvDic"]["pic_160w_100h"]+"\")","background-repeat":"no-repeat"});
}

function faceSubicon(subicon,json){
    if(subicon != ""){
        $(".face-subicon").addClass("personal-auth");
        
    }else{
        $(".face-subicon").removeClass("personal-auth");
    }
    $("#certification").text(json["certification"]);
}

function level2pic(level){
    switch(level){
        case 0:
            $(".m-level").addClass("level0");
            break;
        case 1:
            $(".m-level").addClass("level1");
            break;
        case 2:
            $(".m-level").addClass("level2");
            break;
        case 3:
            $(".m-level").addClass("level3");
            break;
        case 4:
            $(".m-level").addClass("level4");
            break;
        case 5:
            $(".m-level").addClass("level5");
            break;
        case 6:
            $(".m-level").addClass("level6");
            break;
        default:
            alert("等级错误");
            
    }
}


