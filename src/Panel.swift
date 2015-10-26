import Foundation
import Cocoa

class Panel:NSView {
    static var leftPadding = 12
    static var rightPadding = 12
    init() {
        let x = Table.width+Panel.leftPadding
        let y = Win.topPadding
        let width = Win.width-Table.width-Panel.leftPadding-Panel.rightPadding
        let height = Win.height-Win.topPadding-EditMenu.height
        let rect:NSRect = NSRect(x:x, y: y, width: width,height:height)//view.bounds
        super.init(frame:rect)
        createContent()
    }
    /**
    * TODO: create the align methods, you need them!!!
    */
    func createContent(){
        
        //Name: text inputfield
        //let width:Int = 300//Int(self.frame.width) - Panel.leftPadding - Panel.rightPadding
        let nameTextInput = TextInput(300,36,"Name: ","")
        addSubview(nameTextInput)
        //Local Path: text input field and browse button
        let localPathContainer = Container(350,36)
        addSubview(localPathContainer)
        
        let localPathTextInput = TextInput(550,36,"Local path: ","")
        localPathContainer.addSubview(localPathTextInput)
        
        //browse button
        let browseButton = Create.simpleTextButton("Browse")
        localPathContainer.addSubview(browseButton)//Add button to view
        browseButton.frame.origin.x = localPathTextInput.frame.origin.x + localPathTextInput.frame.width +  12
        //browseButton.frame.origin.y = localPathTextInput.frame.origin.y
        
        
        //Remote path: text input field
        let remotePathTextInput = TextInput(300,36,"Remote path: ","")
        addSubview(remotePathTextInput)
        
        Align.vertically(self.subviews, Panel.leftPadding, 12, 12)
        
        //Subscribe: checkBoxButton
        //Broadcast: checkBoxButton
        //Active: checkBoxButton
        //Relay: checkBoxButton (early beta function for servers, always uses theirs update and forgoes the conflict resolution dialog)
        //keychain id:
    }
    required init?(coder: NSCoder) {//try to get rid of this
        fatalError("init(coder:) has not been implemented")
    }
    /*
    * Draws the background
    */
    override func drawRect(dirtyRect: NSRect) {
        let pathRect = NSInsetRect(self.bounds, 1, 1);
        let path = NSBezierPath(roundedRect:pathRect, xRadius:0, yRadius:0);
        path.lineWidth = 1
        NSColor.whiteColor().setFill();
        NSColor.grayColor().setStroke();
        path.fill()
        path.stroke()
        super.wantsDefaultClipping
    }
    /*
    * This makes sure that the view draws from top left corner
    */
    override var flipped:Bool {
        get {
            return true
        }
    }
    /*
    * Disables clipping of the view
    */
    override var wantsDefaultClipping : Bool {
        return false
    }
}