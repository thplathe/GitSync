import Foundation
@testable import Element
@testable import Utils

class CommitView:Element{
    static var selectedIdx:Int = 1
    lazy var list:CommitsList = self.createCommitList()
    var commitDetailView:CommitDetailView?
    lazy var intervalTimer:SimpleTimer = .init(interval: 60, onTick: self.onTick)/*This timer fires every n seconds and initiates the AutoSync process if apropriate*/
    override func resolveSkin() {
        super.resolveSkin()//self.skin = SkinResolver.skin(self)//
        Swift.print("before list created")
        _ = list/*creates the GUI List*/
        Swift.print("after list created")
        intervalTimer.start()//starts the ticking
        Swift.print("intervalTimer started")
    }
    /**
     * New
     */
    func onTick(){
        Swift.print("onTick()")
        intervalTimer.stop()
        if list._state.isReadyToSync {
            Swift.print("isReadyToSync")
            self.list.initSyncFromInterval({self.intervalTimer.start()})/*only restarts after sync completes*/
        }else{
            Swift.print("try again in 60 seconds")
            self.intervalTimer.start()/*try again in n seconds*/
        }
    }
    /**
     * EventHandler when a CommitsListItem is clicked
     */
    func onListSelect(_ event:ListEvent){
        CommitView.selectedIdx = list.selectedIdx!
        let commitData:[String:String] = list.dp.getItemAt(event.index)!
        Nav.setView(.detail(.commit(commitData)))
    }
    override func onEvent(_ event:Event) {
        if event.type == ListEvent.select {onListSelect(event as! ListEvent)}
        //else {super.onEvent(event)}//forward other events
    }
    override func setSize(_ width: CGFloat, _ height: CGFloat) {
        Swift.print("CommitView.width: " + "\(width)")
        Swift.print("list.frame.width: " + "\(list.frame.width)")
        Swift.print("list.contentContainer.width: " + "\(list.contentContainer.skinSize.w)")
        
        //Swift.print("list.rbContainer.width: " + "\(list.rbContainer)")
        /*Swift.print("list.contentContainer.frame.width: " + "\(list.contentContainer.frame.width)")
         */
        super.setSize(width, height)
    }
}

