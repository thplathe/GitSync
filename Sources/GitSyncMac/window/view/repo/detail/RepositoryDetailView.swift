import Foundation
@testable import Utils
@testable import Element
//Continue here 🏀
    //padding and element inside the text things. to simulate text content
    //add resize code
    //ditch the close btns etc
    //simulate header with centered btns
    //resize the window in gif anim
    //add to element project, white bg
class DebugText:Element {
    override func resolveSkin() {
        super.resolveSkin()
    }
}
class DebugTextArea:Element {
    lazy var text:Element = {return self.addSubView(DebugText(NaN,NaN,self,"text1"))}()
    override func resolveSkin() {
        super.resolveSkin()
        _ = text
    }
}
class DebugTextInput:Element {
    lazy var text:Element = {return self.addSubView(DebugText(NaN,NaN,self,"text1"))}()
    lazy var textArea:Element = {return self.addSubView(DebugTextArea(NaN,NaN,self,"text2"))}()
    override func resolveSkin() {
        super.resolveSkin()
        _ = text
        _ = textArea
    }
}
class TestItem:Element{
    lazy var text1:Element = {return self.addSubView(Element(NaN,NaN,self,"text1"))}()
    lazy var text2:Element = {return self.addSubView(Element(NaN,NaN,self,"text2"))}()
    override func resolveSkin() {
         var css:String = ""
         css += "RepositoryDetailView TestItem{fill:orange;width:100%;height:48px;float:left;clear:left;padding-right:100px;}"
         css += "RepositoryDetailView TestItem{fill:yellow;}"//padding-top:12px;padding-left:12px;padding-right:-24px;
         css += "RepositoryDetailView TestItem #text1{fill:purple;width:100px;height:48px;float:left;clear:none;}"
         css += "RepositoryDetailView TestItem #text2{fill:green;width:100%;height:48px;float:left;clear:none;}"
         /*css += "RepositoryDetailView TextInput{width:100%;height:48px;float:left;clear:left;fill:Blue;fill-alpha:1;}"
         css += "RepositoryDetailView TextInput Text{width:100px;fill:yellow;fill-alpha:1;}"
         css += "RepositoryDetailView TextInput TextArea{width:100%;fill:blue;fill-alpha:1;}"
         css += "RepositoryDetailView TextInput TextArea Text{width:100%;fill:purple;fill-alpha:1;}"
         */
        StyleManager.addStyle(css)
        super.resolveSkin()
         _ = text1
         _ = text2
    }
}
class RepositoryDetailView:Element {
    lazy var contentContainer:Container = {return self.addSubView(Container(self.width,self.height,self,"lable"))}()
    lazy var item:TestItem = {return self.contentContainer.addSubView(TestItem(NaN,NaN,self.contentContainer))}()
    
    //lazy var nameTextInput:TextInput = {return self.contentContainer.addSubView(TextInput(self.width, 32, "Name: ", "", self.contentContainer))}()
    //lazy var localPathTextInput:TextInput = {return self.contentContainer.addSubView(TextInput(self.width, 32, "Local-path: ", "", self.contentContainer))}()
    override func resolveSkin() {
        var css:String = ""
        css += "RepositoryView RepositoryDetailView{fill:red;width:100%;float:left;clear:none;}"
        css += "RepositoryDetailView{float:left;clear:left;100%;}"
        css += "RepositoryDetailView Container#lable{float:left;clear:left;width:100%;padding-right:0px;}"
        StyleManager.addStyle(css)
        super.resolveSkin()
        _ = contentContainer
        _ = item
       
        //_ = nameTextInput
        //_ = localPathTextInput
    }
}
