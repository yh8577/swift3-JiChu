//: Playground - noun: a place where people can play

import UIKit

for i in 0..<5 {
    print(i)
}

for i in 0...5 {
    print(i)
}

let r1 = 0..<5
print(r1)

let r2 = 0...5
print(r2)

// 反序
for i in (0..<10).reversed() {
    print(i)
}

for i in r2.reversed() {
    print(i)
}


