//: Playground - noun: a place where people can play

import UIKit

func sum(x: Int, y: Int) -> Int {
    
    return x + y
}

print(sum(x: 10, y: 20))


// 定义常量记录,函数
let f = sum

print(f(10, 30))

// 定义闭包
// let b1: () -> ()
let b1 = {
    print("hello")
}
b1()

let b2 = { (x: Int) -> () in
    print(x)
}

b2(20)

let b3 = { (x: Int) -> Int in
    return x + 250
}

b3(250)

