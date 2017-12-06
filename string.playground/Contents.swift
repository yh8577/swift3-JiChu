//: Playground - noun: a place where people can play

import UIKit


let str = "hello world你好"

// 字符串遍历
for c in str.characters {
    print(c)
}

// 字符串字节
print(str.lengthOfBytes(using: .utf8))

// 字符串个数
print(str.characters.count)


// NSString 取字符串长度
let nsStr = str as NSString

print(nsStr.length)

// String字符串拼接

let str1 = "gjjhk交换机 \(str)"
print(str + str1)

let str2 : String? = nil

let str3 = "\(str) \(str1) \(str2 ?? "")"

print(str3)

// 字符串格式化

let h = 8
let m = 9
let s = 7

let dateStr = "\(h):\(m):\(s)"

let dateDtr1 = String(format: "%02d:%02d:%02d", h,m,s)

print(dateDtr1)

// 字符串子串,一般使用NSString, swift取子串的方法暂时不是很好用

let s1 = nsStr.substring(with: NSMakeRange(2,3))
print(s1)

// swift 取子串
str.startIndex
str.endIndex
let str4 = str.substring(from: "ww".endIndex)
print(str4)

let str5 = str.substring(to: "aa".endIndex)
print(str5)

let range = str.range(of: "he")

print(range)
//print(str.substring(with: range))





