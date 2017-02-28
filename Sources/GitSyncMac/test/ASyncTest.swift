import Foundation
@testable import Utils

//do 2 things async,
//then in each 2 things do 3 things async but do something on mainthread when these 4 things are all finished

class ASyncTest {
    /**
     *
     */
    init(){
        for i in 0..<2{//do 2 things async
            bgQueue.async {
                mainQueue.async {
                    for e in 0..<3{
                        bgQueue.sync{
                            bgQueue.async{//do 3 things async
                                sleep(IntParser.random(1, 6).uint32)
                                Swift.print("i: \(i) e: \(e)")
                            }
                        }
                    }
                }
            }
        }
        /*
        var i:Int = 0
        func onComplete(/*_ idx:Int,_ result:String*/){
            i += 1
            Swift.print("onComplete: " + "\(i)")
            if(i == arr.count){
                Swift.print("all concurrent tasks completed")
                Swift.print("arr: " + "\(arr)")//[(0, "a", "0a"), (1, "b", "1b"), (2, "c", "2c"), (3, "d", "3d")]
            }
        }
        */
    }
}
