//
//  AbutViewController.swift
//  BullsEye
//
//  Created by Mohamed on 9/3/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//
//<<...IMPORT...>>
import UIKit
import WebKit

final class AbutViewController: UIViewController {
//    <<...IB...>>
    @IBOutlet weak var  webView: WKWebView!
    @IBAction func close (){
        dismiss(animated: true, completion: nil )
    }
//    <<...OPIRATION...>>
    override func viewDidLoad() {
      super.viewDidLoad()
   if  let htmlpath = Bundle.main.path(forResource: "download", ofType: "html" )
   {
    let url = URL(fileURLWithPath: htmlpath )
    let requst = URLRequest (url: url )
    webView.load(requst)
        }
    }
}
