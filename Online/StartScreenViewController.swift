//
//  StartScreenViewController.swift
//  Authentication
//
//  Created by Lechner, Sami on 02/03/2017.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import SAPFoundation
import SAPCommon

class StartScreenViewController: UIViewController, SAPURLSessionDelegate {

    @IBOutlet var infoText: UITextView!

    enum AuthenticationState {
        case notYetStarted
        case started
        case succeeded
    }

    var currentAuthenticationState = AuthenticationState.notYetStarted
    var oDataModel: ODataModel?
    /// the variable in the AppDelegate holding the current active session to the HCP
    var urlSession: SAPURLSession? {
        didSet {
            oDataModel = ODataModel(urlSession: urlSession!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        urlSession = SAPURLSession(delegate: self)
        let httpObserver = SAPcpmsObserver(applicationID: Authenticator.Constants.appID)
        urlSession?.register(httpObserver)
        infoText.text = "Authentication about to start"
    }

    override func viewDidAppear(_: Bool) {
        switch currentAuthenticationState {
        case .notYetStarted:
            currentAuthenticationState = .started
            infoText.text = "Authentication started"
            Authenticator(urlSession: urlSession!).authenticate { _ in
                OperationQueue.main.addOperation {
                    self.currentAuthenticationState = .succeeded
                }
            }
            break
        case .succeeded:
            performSegue(withIdentifier: "authenticationSuccessfull", sender: nil)
            infoText.text = "Authentication was successful"
            break
        case .started:
            // If this is still in the started state,
            infoText.text = "Authentication failed"
        }

    }

    /// Handler to prepare the segue
    ///
    /// - Parameters:
    ///   - segue:
    ///   - sender:
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "authenticationSuccessfull" {

            let view = segue.destination as! UINavigationController
            let activeView = view.topViewController as! homecontroller
            activeView.initialize(oDataModel: oDataModel!)
        }
    }
}
