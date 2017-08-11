import Foundation
@testable import Utils

extension AutoInitConflict{
    typealias State = (pathExists:Bool,hasPathContent:Bool,isGitRepo:Bool,areRemotesEqual:Bool)
    typealias TextData = (issue:String,proposal:String)
    /**
     * Creates the text for the AutoInitPrompt
     */
    var text:TextData{
        Swift.print("AutoInitConflict.text")
        var issue:String = ""
        var proposal:String = ""
        let state:State = (pathExists,hasPathContent,isGitRepo,areRemotesEqual)
        Swift.print("state: " + "\(state)")
        switch state {
        case (true,true,true,false):
            issue = "There is already a git project in the folder: \(repoItem.local) with a different remote URL"
            proposal = "Do you want to keep the files, download the git repo from remote and start a merge wizard?"
        case (true,true,false,_):
            issue = "The folder \(repoItem.localPath) is not a git repo but there are pre-exisiting files"
            proposal = "Do you want to keep the files, download the git repo from remote and start a merge wizard?"
        case (true,false,_,_):
            issue = "The folder in path: " + "\(repoItem.localPath) is empty"
            proposal = "Do you want to create a folder and download files from remote?"
        case (false,_,_,_):
            issue = "The path \(repoItem.localPath) doesn't exist"
            proposal = "Do you want to create it and download files from remote "//\(repoItem.remotePath)
        default:
            fatalError("Has no strategy for this scenario \(state)")
        }
        return (issue,proposal)
    }
    /**
     * NOTE: after this you often want to : MergeUtils.manualMerge(repoItem,{})
     */
    func process(){
        let state:State = (pathExists,hasPathContent,isGitRepo,areRemotesEqual)
        Swift.print("AutoInitConflic.process() state: \(state)")
        switch state {
        case (true,true,true,false):
            if curRemotePath == "" {//does not have remote repo attached
                _ = GitModifier.attachRemoteRepo(repoItem.localPath,repoItem.remotePath)//--attach remote repo
            }else{//--the .git folder already has a remote repo attached, but is different from repoItem.remote
                _ = GitModifier.detachRemoteRepo(repoItem.localPath/*branch*/)//--promt the user if he wants to use the existing remote origin, this will skip the user needing to input a remote url
                _ = GitModifier.attachRemoteRepo(repoItem.localPath,repoItem.remotePath)
            }
        case (true,true,false,_):
            _ = GitModifier.initialize(repoItem.localPath)
            _ = GitModifier.attachRemoteRepo(repoItem.localPath,repoItem.branch)//--add new remote origin
        case (true,false,_,_):
            _ = GitModifier.clone(repoItem.remotePath,repoItem.localPath)
        case (false,_,_,_):
            _ = GitModifier.clone(repoItem.remotePath,repoItem.localPath)//--this will also create the folders if they dont exist, even nested
        default:
            fatalError("Has no strategy for this scenario: \(state) ")
        }
    }
}