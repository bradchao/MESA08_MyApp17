//
//  ViewController.swift
//  MyApp17
//
//  Created by user22 on 2017/9/26.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func doGet1(_ sender: Any) {
        //let url = URL(string: "http://10.2.24.136/iii01.php")
        // 出現 對話筐
        let alert = UIAlertController(title: "歡迎光臨", message: "登入", preferredStyle: .alert)
        
        alert.addTextField { (textAccount) in
            textAccount.placeholder = "輸入帳號"
        }
        alert.addTextField { (textPasswd) in
            textPasswd.placeholder = "輸入密碼"
            textPasswd.isSecureTextEntry = true
        }

        let okAction = UIAlertAction(title: "Login", style:.default) {
            (action) in
            let account = alert.textFields![0].text
            let passwd = alert.textFields![1].text

            print("Input:\(account!):\(passwd!)")
            self.login(account: account!, passwd: passwd!)
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true) {
            print("show")
        }
        
        
    }
    
    private func login(account:String, passwd:String){
        let stringURL = "http://10.2.24.136/iii02.php?account=" +
        account + "&passwd=" + passwd
        print(stringURL)
        let url = URL(string: stringURL)
        do{
            let result = try String(contentsOf: url!)
            if result == "OK" {
                print("Login Success")
            }else{
                print("Login Failure")
            }
        }catch{
            print("error")
        }
    }
    
    @IBAction func doPost(_ sender: Any) {
        let url = URL(string: "http://10.2.24.136/iii03.php")
        
        var req = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        req.httpBody = "account=brad&passwd=123456".data(using: .utf8)
        req.httpMethod = "POST"
        
        let config = URLSessionConfiguration.default
        let session  = URLSession(configuration: config)
        let task = session.dataTask(with: req) {
            (data, response, error) in
            guard error == nil else {return}
            
            let result = String(data: data!, encoding: String.Encoding.utf8)
            print(result!)
            
        }
        task.resume()
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

