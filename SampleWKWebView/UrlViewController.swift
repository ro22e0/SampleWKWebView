//
//  UrlViewController.swift
//  Gymglish
//
//  Created by Ronaël Bajazet on 17/01/2016.
//  Copyright © 2016 Gymglish. All rights reserved.
//

import UIKit
import WebKit
import Social

class UrlViewController: UIViewController, WKNavigationDelegate {
    
    // MARK: - Properties
    var webView: WKWebView?
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var fowardButton: UIBarButtonItem!
    
    // This value is passed by UrlTableViewController in prepareForSegue(_:sender:)
    var urlText: String?
   
    // MARK: - Methods
    override func loadView() {
        super.loadView()

        self.webView = WKWebView()
        self.view = self.webView
        self.webView?.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = self.urlText
        
        if let url = NSURL(string: "http://" + self.urlText!) {
            let req = NSURLRequest(URL:url)
            self.webView!.loadRequest(req)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - WKNavigationDelegate
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.navigationItem.title = self.webView?.title
        self.backButton.enabled = (self.webView?.canGoBack)!
        self.fowardButton.enabled = (self.webView?.canGoForward)!
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        let alertVC = UIAlertController(title: "Error", message: ((error as NSError).localizedDescription), preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertVC.addAction(ok)
        self.presentViewController(alertVC, animated: true) { () -> Void in }
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        let alertVC = UIAlertController(title: "Error", message: ((error as NSError).localizedDescription), preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alertVC.addAction(ok)
        self.presentViewController(alertVC, animated: true) { () -> Void in }
    }
    
    // MARK: Actions
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        if self.webView!.canGoBack {
            self.webView?.goBack()
        }
    }
    
    @IBAction func goFoward(sender: UIBarButtonItem) {
        if self.webView!.canGoForward {
            self.webView?.goForward()
        }
    }
    
    @IBAction func reload(sender: UIBarButtonItem) {
        self.webView?.reload()
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func share(sender: UIBarButtonItem) {
        let textTitle = (self.webView?.title)! as String
        let link = (self.webView?.URL)! as NSURL
        
        let objectsToShare = [textTitle, link]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
}
