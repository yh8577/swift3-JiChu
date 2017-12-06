//: Playground - noun: a place where people can play

import UIKit

// 数组
print("数组")
var arr = ["a","b","c","d"]
let arr1 = [3,5,6,7,8]
let arr2 : [Any] = ["a","b","c","d",8]

let p = CGPoint(x: 10, y: 300)
let arr3 = [p]
print(arr3)

let arr4 : [Any] = ["a",1,p]
print(arr4)

let arr5 : [Any] = ["a",1,NSValue(cgPoint: p)]
print(arr5)

// 数组遍历
print("数组遍历")
for i in 0..<arr.count {
    print(arr[i])
}

for i in arr {
    print(i)
}

// 枚举遍历,返回元组.
print("枚举遍历,返回元组.")
for i in arr.enumerated() {
    print(i)
}

for i in arr.enumerated() {
    print("\(i.offset) \(i.element)")
}

for (k,v) in arr.enumerated() {
    print("\(k) \(v)")
}

// 反序
print("反序")
for i in arr.reversed() {
    print(i)
}

for (k,v) in arr.enumerated().reversed() {
    print("\(k) \(v)")
}

// 这样是错误的.key没有被反序
print("这样是错误的.key没有被反序")
for (k,v) in arr.reversed().enumerated() {
    print("\(k) \(v)")
}

// 增,删,改
print("增,删,改")
print("增")
arr.append("老板")
print(arr)

print("改")
arr[0] = "huig"
print(arr)

print("数组越界")
// fatal error: Index out of range
//arr[5] = "aaaa"

print("删")
arr.remove(at: 3)
print(arr)

print("删除全部,保留空间")
arr.removeAll(keepingCapacity: true)
print("\(arr) 容量:\(arr.capacity)")


print("删除全部")
arr = ["a","s","啊","g","吖吖"]
arr.removeAll()
print(arr)


print("数组容量")
for i in 0...8 {
    arr.append("\(i)")
    print("开辟容量以倍数增长")
    print("\(arr) 容量: \(arr.capacity)")
}

print("数组合并")
print("数组合并必须是相同类型")
var arr6 = arr as [Any]
arr6 += arr2
print(arr6)




