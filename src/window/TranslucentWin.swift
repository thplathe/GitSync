import Cocoa

class TranslucentWin:NSWindow, NSApplicationDelegate, NSWindowDelegate{
    /**
     *
     */
    override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, `defer` flag: Bool) {
        super.init(contentRect: Win.sizeRect, styleMask: NSTitledWindowMask|NSResizableWindowMask|NSMiniaturizableWindowMask|NSClosableWindowMask, backing: NSBackingStoreType.Buffered, `defer`: false)
        self.contentView!.wantsLayer = true;/*this can and is set in the view*/
        self.backgroundColor = NSColor.grayColor()
        self.opaque = true
        self.makeKeyAndOrderFront(nil)//moves the window to the front
        self.makeMainWindow()//makes it the apps main menu?
        
        self.center()
        //view.wantsLayer = true;//this should be set in the iew not here
        //self.contentView = view
        //self.title = ""/*Sets the title of the window*/
        self.title = ""//GitSync
        
        self.delegate = self
    }
    /*
     * Required by the NSWindow
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}