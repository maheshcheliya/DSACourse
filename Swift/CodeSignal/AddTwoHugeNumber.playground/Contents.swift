import UIKit

var str = "Code Signal - Add Two Huge Numbers from Singly Linked List"

 public class ListNode<T> {
     public var value: T
     public var next: ListNode<T>?
     public init(_ x: T) {
         self.value = x
         self.next = nil
     }
 }

func addTwoHugeNumbers(a: ListNode<Int>?, b: ListNode<Int>?) -> ListNode<Int>? {
    var aa = a
    var bb = b
    
    var firstString = ""
    var secondString = ""
    
    while(aa != nil) {
        firstString = firstString + String(format: "%04d", aa?.value ?? 0)
        aa = aa?.next ?? nil
    }
    
    while(bb != nil) {
        secondString = secondString + String(format: "%04d", bb?.value ?? 0)
        bb = bb?.next ?? nil
    }
    
    let total = largeSum(firstString, secondString)
    
    var myString = ""
    var myNode : ListNode<Int>?
    
    var i = 0
    var index = total.count - 1
    
    while (index >= 0) {
        if(i % 4 == 0 && myString != "") {
            
            let newNode = ListNode(Int(myString) ?? 0)
            if(myNode == nil) {
                myNode = newNode
            } else {
                var tmpNode = myNode
                while (tmpNode?.next != nil) {
                    tmpNode = tmpNode?.next
                }
                tmpNode?.next = newNode
            }
            myString = getCharAt(index: index, s: total)
        } else {
            myString = getCharAt(index: index, s: total) + myString
        }
        i += 1
        index -= 1
    }
    
    if(myString != "") {
        let newNode = ListNode(Int(myString) ?? 0)
        if(myNode == nil) {
            myNode = newNode
            
        } else {
            var tmpNode = myNode
            while (tmpNode?.next != nil) {
                tmpNode = tmpNode?.next
            }
            tmpNode?.next = newNode
        }
    }
    let reverseNode = reverse(list: myNode)
    return reverseNode
}
func reverse(list: ListNode<Int>?) -> ListNode<Int>? {
    
    var prev : ListNode<Int>? = nil
    var current : ListNode<Int>? = list
    var myNext : ListNode<Int>? = nil
    
    while(current != nil) {
        myNext = current?.next
        current?.next = prev
        prev = current
        current = myNext
    }
    return prev
}
func largeSum(_ s1 : String, _ s2: String) -> String {
    var i = s1.count - 1
    var j = s2.count - 1

    var carry = 0
    var total = ""
    while (i >= 0 || j >= 0) {
        let first = Int(getCharAt(index: i, s: s1)) ?? 0
        let second = Int(getCharAt(index: j, s: s2)) ?? 0
        
        let sum = first + second + carry
        
        let strSum = String(sum)
        
        if strSum.count > 1 {
            carry =  Int(String(getCharAt(index:0 , s: strSum))) ?? 0
        } else {
            carry = 0
        }
        
        var main = ""
        if(i <= 0 && j <= 0) {
            main = strSum
        } else {
            main = String(getCharAt(index: strSum.count - 1, s: strSum))
        }
        total = main + total
        
        i -= 1
        j -= 1
    }
    return total
}


func getCharAt(index: Int, s: String ) -> String {
    if(index > s.count - 1 || index < 0) {
        return "0"
    }
    let startIndex = s.index(s.startIndex, offsetBy: index)
    let limit = s.index(s.startIndex, offsetBy: index + 1)
    let result = s[startIndex..<limit]
    return String(result)

}

//answer: 981,729,123,123,122,312,312,312,312,312,312,316,225,187,094,492,083,696,134,896,065,868,409,586,506,584,991,232,768,426
//9876, 5432, 1999] and b = [1, 8001], the output should be

let firstNode = ListNode(1)
let secondNode = ListNode(9999)
secondNode.next = ListNode(9999)
secondNode.next?.next = ListNode(9999)
secondNode.next?.next?.next = ListNode(9999)
secondNode.next?.next?.next?.next = ListNode(9999)
secondNode.next?.next?.next?.next?.next = ListNode(9999)


//let firstNode = ListNode(9876)
//firstNode.next = ListNode(5432)
//firstNode.next?.next = ListNode(1999)
//
//let secondNode = ListNode(1)
//secondNode.next = ListNode(8001)

//let firstNode = ListNode(123)
//firstNode.next = ListNode(4)
//firstNode.next?.next = ListNode(5)
//
//let secondNode = ListNode(100)
//secondNode.next = ListNode(100)
//secondNode.next?.next = ListNode(100)

var result1 = addTwoHugeNumbers(a: firstNode, b: secondNode)

while result1 != nil {
    print(result1?.value)
    result1 = result1?.next
}

