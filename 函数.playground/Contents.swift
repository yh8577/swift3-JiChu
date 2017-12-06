//: Playground - noun: a place where people can play

import UIKit

func sum(x: Int, y: Int ) -> Int {
    return x + y
}
print(sum(x: 10, y: 20))


func sum1(_ x: Int,_ y: Int ) -> Int {
    return x + y
}

print(sum1(10, 20))

func sum2(num1 x: Int,num2 y: Int ) -> Int {
    return x + y
}

sum2(num1: 10, num2: 20)

func sum3(x: Int = 1,y: Int = 2) -> Int {
    return x + y
}

print(sum3())
print(sum3(x: 10))
print(sum3(x: 20))
print(sum3(x: 10, y: 20))

func demo() {
    print("ok")
}
print(demo())

func demo1() -> () {
    print("ok1")
}
print(demo1())

func demo2() -> Void {
    print("ok2")
}
print(demo2())

