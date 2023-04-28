//
//  ViewController.swift
//  iOS-environment
//
//  Created by lym on 2023/3/21.
//

import UIKit
import YMExtension

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        environment()
    }

    func environment() {
        let appBundleID = Bundle.ext.appBundleID
        let appDisplayName = Bundle.ext.appDisplayName
        let appVersion = Bundle.ext.appVersion
        let appBuildVersion = Bundle.ext.appBuildVersion
        print("appBundleID = \(appBundleID)")
        print("appDisplayName = \(appDisplayName)")
        
        var evn = ""
#if DEBUG
        evn = "DEBUG"
#endif
        
#if RELEASE
        evn = "RELEASE"
#endif
        
#if APPSTORE
        evn = "APPSTORE"
#endif
        print("evn = \(evn)")
        
        let icon = UIImageView()
        icon.image = R.image.icon_personal_about()
        view.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.textAlignment = .left
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        textView.text = """
                iOS项目工程化配置
                BundleID = \(appBundleID)
                DisplayName = \(appDisplayName)
                evn = \(evn)
                appVersion = \(appVersion)
                appBuildVersion = \(appBuildVersion)
        """
    }
}
