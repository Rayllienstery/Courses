//
//  ViewController.swift
//  CICDCourseApp
//
//  Created by Konstantin Kolosov on 12.02.2024.
//

import SwiftUI
import AppCenterAnalytics
import AppCenterCrashes
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showCrashAlertIfNecessary()
        startObversation()
    }

    fileprivate func showCrashAlertIfNecessary() {
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Whoops", message: "Looks like app crashed. Send report?", preferredStyle: .alert)
            alert.addAction(.init(title: "Yes", style: .default))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.present(alert, animated: true)
            }
        }
    }

    private func startObversation() {
        withObservationTracking({
            let _ = dataModel.counter
        }, onChange: { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.startObversation()
                self?.updateButtonTitle()
            }
        })
    }

    let dataModel = DataModel()

    @IBAction func counterTap(_ sender: Any) {
        dataModel.counter += 1
        Analytics.trackEvent("My custom event")
        Analytics.trackEvent("Counter", withProperties: ["value": .init(dataModel.counter)])
    }

    @IBAction func crashTap(_ sender: Any) {
        Crashes.generateTestCrash()
    }
    
    private func updateButtonTitle() {
        button.setTitle("Button \(dataModel.counter)", for: .normal)
    }
}

@Observable class DataModel {
    var counter = 0
}

class CalculationManager {
    func getSum(one: Int, two: Int) -> Int { one + two }
    func getDif(one: Int, two: Int) -> Int { one - two }
    func getMul(one: Int, two: Int) -> Int { one * two }
    func getPar(one: Int, two: Int) -> Int { one / two }

    deinit { debugPrint("deinit: CalculationManager") }
}
