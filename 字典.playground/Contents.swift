//: Playground - noun: a place where people can play

import UIKit

// 字典
print("字典")
// 空字典
let dict1 = [String: Any]()
print(dict1)

// 字典
let dict2 : [String : Any] = ["a":"a","b":"b","c":"c","d":18]
print(dict2)

let dict3 = ["a":"a","b":"b","c":"c"]
print(dict3)

// 字典数组
let dict4 = [["a":"a","b":"b","c":"c","d":180],["a":"a","b":"b","c":"c","d":88],["a":"a","b":"b","c":"c","d":120]]
print(dict4)

let dict5 : [[String : Any]]  = [["a":"a","b":"b","c":"c","d":180],["a":"a","b":"b","c":"c","d":88],["a":"a","b":"b","c":"c","d":120]]
print(dict5)

print("增,删,改")
print("增")
// key不存在就新增
var dict6 : [String : Any] = ["a":"a","b":"b","c":"c","d":180]
dict6["title"] = "老大"
print(dict6)

print("改")
// key存在就修改
dict6["a"] = "我的"
print(dict6)

print("删")
dict6.removeValue(forKey: "a")
print(dict6)

// 全部删除
dict6.removeAll()
print(dict6)


print("遍历")
dict6 = ["a":"a","b":"b","c":"c","d":180]

// 返回的是元组
for d in dict6 {
    print(d)
}

for d in dict6 {
    print("\(d.key) \(d.value)")
}

for (k,v) in dict6 {
    print("\(k) \(v)")
}

print("合并")
// key存在会修改,key不存在会新增
dict6 = ["a":"a","b":"b","c":"c","d":180]
let dict7 : [String : Any] = ["name":"张三","age":18,"height":180]

for d in dict7 {
    dict6[d.key] = dict7[d.key]
}
print(dict6)





