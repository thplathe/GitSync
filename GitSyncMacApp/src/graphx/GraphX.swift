import Foundation
@testable import Utils
@testable import Element

class GraphX:Element{
    override func resolveSkin() {
        super.resolveSkin()
        createUI()
    }
    /**
     *
     */
    func createUI(){
        
    }
}
class GraphArea:Element{
    //graphDots
    //graphLine
    //points
    //prevPoints
    //contentContainer
    override func resolveSkin() {
        super.resolveSkin()
        //createUI()
    }
    //createGraphLine
    //createGraphPoints
}
/**
 * Rationale: We dont use list at first. Since Element is more optimized for UI with 1000s items etc atm. We can just mask it
 * Rationale: grapharea should probably just progress this UI element
 */
class TimeBar:Element{
    //timeLabels
    override func resolveSkin() {
        super.resolveSkin()
        //createTimeLables()
    }
}
class ValueBar:Element{
    //var valueLables:[TextArea] = []
    override func resolveSkin() {
        super.resolveSkin()
        //createValueLables()
    }
}