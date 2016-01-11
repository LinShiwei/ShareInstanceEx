//
//  ViewController.swift
//  ShareInstanceEx
//
//  Created by Linsw on 15/12/28.
//  Copyright © 2015年 Linsw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func shareButton(sender: AnyObject) {
        //创建发送对象实例
        let sendReq=SendMessageToWXReq()
        sendReq.bText = false;//不使用文本信息
        sendReq.scene = 0;//0 = 好友列表 1 = 朋友圈 2 = 收藏
        
        //创建分享内容对象
        let urlMessage = WXMediaMessage.init()
        urlMessage.title = "my share"//分享标题
        urlMessage.description = "from share instance"//分享描述
        urlMessage.setThumbImage(UIImage(named: "list"))//分享图片,使用SDK的setThumbImage方法可压缩图片大小
            //创建多媒体对象
        let webObject = WXWebpageObject.init()
        webObject.webpageUrl = "linshiwei.github.io"//分享链接
            
        //完成发送对象实例
        urlMessage.mediaObject = webObject;
        sendReq.message = urlMessage;
        
        //发送分享信息
        WXApi.sendReq(sendReq)
        
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

