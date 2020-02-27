import requests
import re
import json
from urllib import parse
import sys
import io
#sys.stdout = io.TextIOWrapper(sys.stdout.buffer,encoding='gb18030')
headers = {
            "User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36"
        }
class Bilibili():
    def __init__(self):
        self.api = ['https://api.bilibili.com/x/space/acc/info?mid=','https://api.bilibili.com/x/relation/stat?vmid=','https://api.bilibili.com/x/space/upstat?mid=','https://api.live.bilibili.com/room/v1/Room/getRoomInfoOld?mid=','https://api.bilibili.com/x/space/arc/search?mid=','https://api.bilibili.com/x/web-interface/view?aid=']        
        self.keyword = {'keyword':sys.argv[1]}
        #self.url = "https://search.bilibili.com/upuser?keyword=%E6%B3%9B%E5%BC%8F"
        self.url = "https://search.bilibili.com/upuser?" + parse.urlencode(self.keyword)
        self.name = "" #up
        self.uid = "" #uid
        self.sign = "" #签名
        self.level = "" #等级
        self.follower = "" #粉丝数
        self.following = "" #up关注数
        self.face = "" #头像
        self.face__64x64 = "" #头像 64*64 (缩略图)
        self.certification = "" #个人认证
        self.view = "" #播放量
        self.liveStatus = ""#直播状态
        self.liveUrl = ""#直播地址
        self.latestAvDic = {}#最新投稿信息
        self.allInfoDic ={} #全部信息
    def printInfo(self):
        self.allInfoDic['name'] = self.name
        self.allInfoDic['uid'] = self.uid
        self.allInfoDic['sign'] = self.sign
        self.allInfoDic['level'] = self.level
        self.allInfoDic['follower'] = self.follower
        self.allInfoDic['following'] = self.following
        self.allInfoDic['face'] = self.face
        self.allInfoDic['face__64x64'] = self.face__64x64
        self.allInfoDic['certification'] = self.certification
        self.allInfoDic['view'] = self.view
        self.allInfoDic['liveStatus'] = self.liveStatus
        self.allInfoDic['liveUrl'] = self.liveUrl
        self.allInfoDic['latestAvDic'] = self.latestAvDic
        jsonStr = json.dumps(self.allInfoDic,ensure_ascii=False)
        print(jsonStr)
        
        
    def run(self):
        #print(self.url)
        s=requests.session()
        response=s.get(self.url,headers=headers)
        text=response.text
        pattern=re.compile('.*?class="c cl".*?img src="(.*?)" alt.*?<h3 class="xw0">.*?<a href="(.*?)" onclick=.*?title="(.*?)">.*?</a>',re.S)
        pattern = re.compile('.*?class="up-face".*?href="(.*?)" title="(.*?)".*?target',re.S)
        results=re.findall(pattern,text)
        #self.userSpaceUrl = "https:" + results[0][0]
        # res = s.get(self.userSpaceUrl,headers=headers)
        # print(res.text)
        spaceUrl = results[0][0]
        pattern = re.compile(".*/(\d*)")
        results=re.findall(pattern,spaceUrl)
        self.uid = results[0]
        api1 = self.api[0] + self.uid
        api2 = self.api[1] + self.uid
        api3 = self.api[2] + self.uid
        api4 = self.api[3] + self.uid
        api5 = self.api[4] + self.uid + '&pn=1&ps=1'
        api6 = self.api[5]

        res = s.get(api1,headers=headers)
        #print(res.text)
        pattern = re.compile('"name":"(.*?)".*?"face":"(.*?)".*?"sign":"(.*?)".*?"level":(\d*).*?"title":"(.*?)"',re.S)
        results = re.findall(pattern,res.text)
        self.name = results[0][0]
        self.face = results[0][1]
        self.face__64x64 = results[0][1] + "_64x64.jpg"
        self.sign = results[0][2]
        self.level = results[0][3]
        self.certification = results[0][4]
        
        res = s.get(api2,headers=headers)
        #print(res.text)
        pattern = re.compile('"following":(\d*).*?"follower":(\d*)',re.S)
        results = re.findall(pattern,res.text)
        self.following = results[0][0]
        self.follower = results[0][1]
        #print(self.follower)

        res = s.get(api3,headers=headers)
        #print(res.text)
        pattern = re.compile('"view":(\d*).*?"likes":(\d*)',re.S)
        results = re.findall(pattern,res.text)
        #print(results)
        self.view = results[0][0]
        self.likes = results[0][1]
        #print(self.likes)

        res = s.get(api4,headers=headers)
        #print(res.text)
        pattern = re.compile('"liveStatus":(\d*).*?"url":"(.*?)"',re.S)
        results = re.findall(pattern,res.text)
        #print(results)
        self.liveStatus = results[0][0]
        self.liveUrl = results[0][1]
        #print(self.liveStatus + self.liveUrl)
        
        res = s.get(api5,headers=headers)
        #print(res.text)
        self.latestAvDic["aid"] = re.findall(re.compile('"aid":(\d*)',re.S),res.text)[0] 
        #print(self.latestAvDic["aid"])
        res = s.get(api6+self.latestAvDic["aid"],headers=headers)
        #print(res.text)
        dataDic = json.loads(res.text) #type dic
        self.latestAvDic["pic"] = dataDic['data']['pic'] #封面
        self.latestAvDic["pic_160w_100h"] = dataDic['data']['pic']+"@160w_100h_100Q_1c.webp" #封面 160*100 缩略图
        self.latestAvDic["title"] = dataDic['data']['title']#标题
        self.latestAvDic["desc"] = dataDic['data']['desc']#描述
        self.latestAvDic["danmaku"] = dataDic['data']['stat']['danmaku']#弹幕树
        self.latestAvDic["favorite"] = dataDic['data']['stat']['favorite'] #收藏
        self.latestAvDic["coin"] = dataDic['data']['stat']['coin'] #硬币
        self.latestAvDic["share"] = dataDic['data']['stat']['share'] #分享
        self.latestAvDic["like"] = dataDic['data']['stat']['like'] #点赞
        #print(self.latestAvDic)
        self.printInfo()
        
if __name__=='__main__':
    bilibili=Bilibili()
    bilibili.run()
