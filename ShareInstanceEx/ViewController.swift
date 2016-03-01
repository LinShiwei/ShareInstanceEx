//
//  ViewController.swift
//  ShareInstanceEx
//
//  Created by Linsw on 15/12/28.
//  Copyright © 2015年 Linsw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBAction func shareButton(sender: AnyObject) {
        share(0)
    }
    @IBAction func groupShareButton(sender: AnyObject) {
        share(1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        urlText.text = "linshiwei.github.io"
        descriptionText.text = "来自：我的分享应用"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func share(kind:Int32){
        //创建发送对象实例
        let sendReq=SendMessageToWXReq()
        sendReq.bText = false;//不使用文本信息
        sendReq.scene = kind;//0 = 好友列表 1 = 朋友圈 2 = 收藏
        
        //创建分享内容对象
        let urlMessage = WXMediaMessage.init()
        urlMessage.title = titleText.text//分享标题
        urlMessage.description = descriptionText.text//分享描述
        urlMessage.setThumbImage(UIImage(named: "shareRed"))//分享图片,使用SDK的setThumbImage方法可压缩图片大小
        //创建多媒体对象
        let webObject = WXWebpageObject.init()
        webObject.webpageUrl = urlText.text//分享链接
        
        //完成发送对象实例
        urlMessage.mediaObject = webObject;
        sendReq.message = urlMessage;
        
        //发送分享信息
        WXApi.sendReq(sendReq)
    }
}

