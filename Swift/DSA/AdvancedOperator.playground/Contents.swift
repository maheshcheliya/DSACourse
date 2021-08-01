import UIKit

// find odd even using & operator
func findOddEven() {
    for i in 1...10 {
        // find odd even without modulo sign
        if( i & 1 == 0) {
            print("\(i) is even")
        } else {
            print("\(i) is odd")
        }
    }
}
//findOddEven()

// swap two number without third variable
func swapWithoutThirdVariable() {
    var a = 2
    var b = 5
    
    a = a ^ b
    b = a ^ b
    a = a ^ b
    print("a is :\(a) and b is : \(b)")
}
swapWithoutThirdVariable()

// find trailing zeros of factorial number n = 30
func findTrailingZeroOfNumber(_ n:Int) {
    var i = 5
    var result = 0
    while (i <= n) {
        result += n / i
        i *= 5
    }
    print(result)
}
findTrailingZeroOfNumber(30)

func fastPower(a: inout Int, b: inout Int) -> Int {
    var result = 1
    while (b > 0) {
        if ((b&1) != 0) {
            result = result * a
        }
        a = a * a
        b = b >> 1
    }
    return result
}
func fastPower2(a: inout Int, b: inout Int, n: inout Int) -> Int {
    var result = 1
    while (b > 0) {
        if ((b&1) != 0) {
            result = (result * (a % n)) % n
        }
        a = (a % n * a % n) % n
        b = b >> 1
    }
    return result
}

var aa = 12
var bb = 7
//9223372036854775807
var result = fastPower(a: &aa, b: &bb)
print(result)

var value = 3978432
var power = 5
var n = 1000000007
result = fastPower2(a: &value, b: &power, n: &n)
print(result)
