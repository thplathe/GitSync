import Cocoa
//white background
//svg icon test
//setup views leftSideBarView and MainContentView

class StashView:CustomView {
    var leftSideBar:LeftSideBar?
    override func resolveSkin() {
        var css = ""//E8E8E8
        css += "Window Element#background{fill:#EFEFF4;fill-alpha:0;}"//<--you should target a bg element not the window it self, since now everything inherits these values
        StyleManager.addStyle(css)
        super.resolveSkin()
        Swift.print("Hello world")
        leftSideBar = addSubView(LeftSideBar(75,200,self)) as? LeftSideBar
        createCustomTitleBar()
        addSubView(MainContent(300-75,300,self))
    }
    func createCustomTitleBar() {
        StyleManager.addStylesByURL("~/Desktop/css/titleBar.css")
        section = leftSideBar!.addSubView(Section(75,16,leftSideBar,"titleBar")) as? Section
        closeButton = section!.addSubView(Button(0,0,section!,"close")) as? Button/*<--TODO: the w and h should be NaN, test if it supports this*/
        minimizeButton = section!.addSubView(Button(0,0,section!,"minimize")) as? Button
        maximizeButton = section!.addSubView(Button(0,0,section!,"maximize")) as? Button
    }
    override func createTitleBar() {
    }
}
class LeftSideBar:Element{
    override func resolveSkin() {
        let css = "LeftSideBar{float:left;clear:left;}"
        StyleManager.addStyle(css)
        Swift.print("MainContent.resolveSkin()")
        super.resolveSkin()
        //background = addSubView(Element(width,height,self,"background")) as? IElement
    }
    
}
class MainContent:Element{
    //var background:IElement?
    /**
     * Draws the graphics
     */
    override func resolveSkin() {
        let css = "MainContent{fill:white;fill-alpha:1;float:left;clear:none;corner-radius:0px 6px 0px 6px;}"
        StyleManager.addStyle(css)
        Swift.print("MainContent.resolveSkin()")
        super.resolveSkin()
        //background = addSubView(Element(width,height,self,"background")) as? IElement
    }

    override func setSize(width: CGFloat, _ height: CGFloat) {
        super.setSize(width, height)
        //background?.setSize(width, height)
    }
}


