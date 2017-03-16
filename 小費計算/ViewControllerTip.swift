//
//  ViewControllerTip.swift
//  小費計算
//
//  Created by Jennifer on 2017/3/9.
//  Copyright © 2017年 Jennifer Ｗu. All rights reserved.
//

import UIKit

class ViewControllerTip: UIViewController {

    @IBOutlet weak var txtprice: UITextField!
    
    @IBOutlet weak var sdrtippercent: UISlider!
    
    @IBOutlet weak var lblpercent: UILabel!
    
    @IBOutlet weak var txtAmount: UITextField!
    
    @IBAction func btnCalculate(_ sender: Any) {
        self.view.endEditing(true)
        let str = txtprice.text
        
        if(str=="")
        {
            let alert = UIAlertController(title: "警告", message: "請輸入價錢", preferredStyle: .alert)
            let okaction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okaction)
            self.present(alert, animated: true, completion: nil) 
            
        } else
        {
            let inputString : NSString = str!.trimmingCharacters(in: NSCharacterSet.decimalDigits) as NSString
            if inputString.length > 0 {
                // 不是数字
                let alert = UIAlertController(title: "警告", message: "請輸入數字", preferredStyle: .alert)
                let okaction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okaction)
                self.present(alert, animated: true, completion: nil)

            } else {
                // 是数字
                let result=(Double(txtprice.text!)!*Double(sdrtippercent.value)*0.01)+Double(txtprice.text!)!
                txtAmount.text=String(result)
            }
          
           
        }

        
    }
    
    @IBAction func SliderChange(_ sender: Any) {
        
        let currentValue = String(format: "%.0f", sdrtippercent.value)
        
        lblpercent.text = "\(currentValue) %"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startenternumber(_ sender: Any) {
        txtprice.text=""
        txtAmount.text=""
    }
    @IBAction func closeKeyboard(_ sender: Any) {
        txtprice.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
