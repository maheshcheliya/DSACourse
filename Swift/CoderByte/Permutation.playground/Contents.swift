import UIKit

var str = "Permutation - How many ways r items can be placed in n boxes"

func permutations(_ boxes: inout [Int],_ currentItem: Int,_ totalItem:Int ) {
    
    if(currentItem > totalItem) {
        for val in boxes {
            print(val, terminator: "")
        }
        print("")
        return
    }
    
    for i in 0..<boxes.count {
        if(boxes[i] == 0) {
            boxes[i] = currentItem
            permutations(&boxes, currentItem+1, totalItem)
            boxes[i] = 0
        }
    }
}
let n = 4
let r = 2
var boxes = [Int](repeating: 0, count: n)
permutations(&boxes, 1,r)
