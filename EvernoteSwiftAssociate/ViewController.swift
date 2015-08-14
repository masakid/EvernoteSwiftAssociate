//
//  ViewController.swift
//  EvernoteSwiftAssociate
//
//

import UIKit

class ViewController: UIViewController {

    
    let CONSUMER_KEY    = "YOUR CONSUMER_KEY"
    let CONSUMER_SECRET = "YOUR CONSUMER_SECRET"
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        postTestNote()
    }
    
    private func postTestNote() {
        ENSession.setSharedSessionConsumerKey(CONSUMER_KEY, consumerSecret: CONSUMER_SECRET,
            optionalHost: ENSessionHostSandbox)
        
        var session = ENSession.sharedSession()
        if session.isAuthenticated {
            var note = ENNote()
            note.title = "Test"
            note.content = ENNoteContent(string: "test test test ...")
            session.uploadNote(note, notebook: nil, completion: { noteRef, error in
                if error == nil {
                    println("OK")
                } else {
                    println("Upload note error: \(error)")
                }
            })
        } else {
            session.authenticateWithViewController(self, preferRegistration: false, completion: { error in
                if error == nil {
                    self.postTestNote()
                } else {
                    println("Authentication error: \(error)")
                }
            })
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

