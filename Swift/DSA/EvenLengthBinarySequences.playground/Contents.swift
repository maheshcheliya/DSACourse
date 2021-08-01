import UIKit

// Even length Binary sequences

func findAllSequences(_ difference: Int,_ output: inout [String],_ start:Int,_ end: Int) {
    
    if(abs(difference) > (end-start+1) / 2) {
        return
    }
    
    // if all bits are filled
    if(start > end) {
        // if sum of first n bits and last n bits are same
        if(difference == 0) {
            print(output)
        }
        return
    }
    
    
    // fill first bit as 0 and last bit as 1
    output[start] = "0"
    output[end] = "1"
    findAllSequences(difference+1, &output, start+1, end-1)
    
    // fill first bit as 1 and last bit as 1
    output[start] = "1"
    output[end] = "1"
    findAllSequences(difference, &output, start+1, end-1)
    
    // fill first bit as 0 and last bit as 0
    output[start] = "0"
    output[end] = "0"
    findAllSequences(difference, &output, start+1, end-1)
    
    // fill first bit as 1 and last bit as 0
    output[start] = "1"
    output[end] = "0"
    findAllSequences(difference-1, &output, start+1, end-1)
}
let n = 2
var output = [String](repeating: "", count: n*2+1)
output[2*n]="\0"

findAllSequences(0, &output, 0, 2*n - 1)
