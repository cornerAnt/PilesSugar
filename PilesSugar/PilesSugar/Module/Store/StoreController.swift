//
//  StoreController.swift
//  PilesSugar
//
//  Created by SoloKM on 16/1/24.
//  Copyright © 2016年 SoloKM. All rights reserved.
//

import UIKit
private let urlString = "http://buy.duitang.com/buy/#/entry?from=app&_urlopentype=page&app_version=5.9&app_code=gandalf&__urlopentype=pageweb&_k=h6lmof"

class StoreController: UIViewController {

    
    private var button : UIButton!
    
   private var webView = UIWebView()
    
    override func loadView() {
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       let request =  NSURLRequest(URL: NSURL(string: urlString)!)
        
        webView.loadRequest(request)
        
        button = UIButton(type: UIButtonType.Custom)
        
        
        button.setBackgroundImage(UIImage(named: "icon_back_dark"), forState: UIControlState.Normal)
    
        button.addTarget(self, action: Selector("leftBarButtonClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        button.sizeToFit()
    
      
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
       
        
        webView.delegate = self
 
    }
    
    @objc private func leftBarButtonClick(){
        
        webView.goBack()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}

extension StoreController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        
     
       
        button.hidden = !webView.canGoBack

        navigationItem.title = "加载中.."
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        navigationItem.title = "堆糖商店"

    }
}