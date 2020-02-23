# import json
# import sys
# ....;dsf
# d = {"s":sys.argv[1],"d":"are"}
# with open('D:\software\Eclipse\eclipse workspace\bilibili\src\com\yukino\bilibili\data.json','w+',encoding='utf-8') as file:
#     file.write(json.dumps(d,indent=2,ensure_ascii=False))
import sys

def my_test(str1,str2,str3,str4):
    return "Python函数运行：java调Python测试："+str1+str2+str3+str4
    

if __name__=="__main__":
    print("脚本名：", sys.argv[0])

    my_arg = []
    for i in range(0, len(sys.argv)):
        my_arg.append(sys.argv[i])
    print("Java传入的参数长度为:"+str(len(my_arg)))
    
    result = my_test(my_arg[1],my_arg[2],my_arg[3],my_arg[4])
    print(result)