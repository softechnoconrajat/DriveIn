//
//  VechileTimeValue.swift
//  AutoLayout
//
//  Created by Raja Sinha on 8/14/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit

class VechileTimeValue: UIViewController {

    var labelName : UILabel = UILabel()
    
    var timer = Timer()
    
    var time = 0
    
    var status = 0
    
    func startTimer(_ label : UILabel, _ vechTime: Int, _ Vechstatus: Int){
        
        labelName = label
        
        time = vechTime
        
        status = Vechstatus
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(VechileTimeValue.action), userInfo: nil, repeats: true)
    }
    
    @objc func action(){
        
        let label = labelName
        
        time += 1
        
        let  a = time % 60 //Seconds
        var  b = time / 60 //Minutes
        
        if b > 59 {
            b = 0
        }
        
        
        DispatchQueue.main.async {
            label.text =  "\(b)  :  \(a)"
        }
        
        colorChange(a, b, label, status)
        
    }
    
    func colorChange(_ a:Int, _ b:Int, _ label:UILabel, _ status:Int) {
        
        let a : Int = a
        let b : Int = b
        let label :UILabel = label
        let status: Int = status
        
        DispatchQueue.main.async {
            
            if status == 1{
                if ( b == 0 && a < 45) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 0 && a > 45) || (b == 0 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else if b>0 {
                    label.backgroundColor = UIColor.red
                }
                
                
            }//end of status == 1
                
            else if status == 2{
                
                if (b <= 1 && a < 60) || (b == 2 && a < 30) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 2 && a > 30) || (b == 2 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else {
                    label.backgroundColor = UIColor.red
                }
            } //end os status == 2
        }//End of DispatchQueue.main.async
        
        
    } // End of colour change function
    
    
    
}

