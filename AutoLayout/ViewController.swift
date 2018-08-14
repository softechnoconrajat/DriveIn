//
//  ViewController.swift
//  AutoLayout
//
//  Created by Rajat Sinha on 7/25/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit
import Moscapsule

var code: Int = Int()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    var screenWidth : CGFloat = 0.0
    var screenHeight : CGFloat = 0.0
    
    var vT = VechileCurrentTime()

   

    
    
    //initializing variable
    
    
    
    // {} is referred to as closure, or anon. function
    
    
    // Logo for the Herfy app
    
    let logo : UIImageView = {
        let logo = UIImageView()
        
        logo.image = UIImage(named: "h_logo")
        logo.isHighlighted = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        
        
        return logo
        
    }()
    
    
    
    
    // Label for day and Time Display
    
    let dayTimeLabel : UILabel = {
        let label = UILabel()
        
        //this enables autolayout for headLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        return label
    }()
    
    
    //Label for herfy title
    
//    let headLabel : UILabel = {
//        let label = UILabel()
//
//        //this enables autolayout for headLabel
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "HERFY"
//        label.contentMode = .scaleAspectFit
//        return label
//    }()
//
    
    // label for Order Queue Title
    let orderLabel : UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.contentMode = .scaleAspectFit
    label.text = "Order Queue"
    return label
    }()
    
    
    // label for Delivery Queue Title
    let deliveryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Delivery Queue"
        return label
    }()
    
    // label for Delivered Title
    let deliveredLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "Delivered"
        return label
    }()
    
    // label for Order Queue Data
    let orderData : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        //label.font = UIFont(name: "Helveticaneue_Bold", size: 32.0)
        return label
    }()
    
    // label for Delivery Queue Data
    let deliveryData : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    
    // Timer1 for delivery Data
    
    let deliveryTimer1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
      //  label.backgroundColor = UIColor.red
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    // Timer2 for delivery Data
    
    let deliveryTimer2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
      //  label.backgroundColor = UIColor.blue
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    // Timer3 for delivery Data
    
    let deliveryTimer3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
      //  label.backgroundColor = UIColor.green
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    // Timer4 for delivery Data
    
    let deliveryTimer4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
       // label.backgroundColor = UIColor.yellow
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    
    //Order Timer 1

    let orderTimer1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
       // label.backgroundColor = UIColor.magenta
         label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    // label for Delivered Data
    let deliveredData : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    
    // Label to display average delivery Time
    
    let averageDel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0"
        return label
    }()
    
    let averageDetTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFit
        label.text = "0 : 0"
        return label
    }()

    var button : UIButton = {
        
        var button = UIButton(type: .custom)
        //button.setTitle("Restaurants", for: .normal)
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(pressDrop), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        return button
    }()
    
    var tableViews = UITableView()
    
    
    
    
    
   
    
    
//
//    let pressHere : UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Restaurants", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//       // button.addTarget(self, action: #selector(pressNow), for: .touchUpInside)
//        button.backgroundColor = UIColor.black
//        return button
//    }()
    
    
    
    
    //MQTT Implementation
    
    func mqttCall(){
        

        let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
        let hostID = "13.126.194.18"
        
        let mqttConfig = MQTTConfig(clientId: clientID, host: hostID, port: 1883, keepAlive: 60)
        
        // create new MQTT Connection
        //       let mqttClient = MQTT.newConnection(mqttConfig)
        //
        
        
        let mqttClient = MQTT.newConnection(mqttConfig, connectImmediately: false)
        mqttClient.connectTo(host: hostID, port: 1883, keepAlive: 2){
            result in
            if result == MosqResult.mosq_success {
                self.pressNow()
                
            }
            else {
                // error handling for connection failure
                print("Not sucessfully Connected!")
            }
            
            
        }
        
        mqttClient.subscribe("world", qos: 2) { (messageId, grantedQos) in
            NSLog("subscribed (mid=\(messageId),grantedQos=\(grantedQos))")
        }
        
        
        
        
        mqttClient.disconnect {  result in
            if result == MosqResult.mosq_success{
                // successful disconnection you requested
                print("Subscribing Again")
                self.mqttCall()
            }
            else{
                // other cases such as unexpected disconnection.
                print("Abruptly Disconnected!")
                self.mqttCall()
            }
        } // end of disconnect
    }//End of MQTT Function

    
    func averagePerformance(time: Int, count: Int){
        let time : Int = time
        let count : Int = count
        
        let aver : Int
        
        var a : Int = 0
        var b : Int = 0
        
        aver = time/count
        
        a = aver % 60 //Seconds
        b = aver / 60 //Minutes
        
        if b > 59 {
            b = 0
        }
        
        DispatchQueue.main.async {
            
            self.averageDel.text = "\(b)  :  \(a)"
            
        }
        
    
}//End of average Performance
    
    // update Time for the timer
    
   
    func orderqueue(orderQueue: Array<Int>)  {
        
        let oQ : Array<Int>
        oQ = orderQueue
    
        if oQ.isEmpty == false{
           vT.startTimer( orderTimer1, oQ[0], 1)
           
            
        }
        else{
            
            vT.hide(label: orderTimer1)
        }
      
    }//End of OrderQueurArray
    
    
    
    func deliveryQueue(deliveryQueue: Array<Int>) {
        
            let dQ : Array<Int>
            dQ = deliveryQueue
            
            if dQ.isEmpty == false{
                if dQ.count == 1 {
                    
                    vT.startTimer( deliveryTimer1, dQ[0],  2)
                    
                    self.vT.hide(label: self.deliveryTimer2)
                    self.vT.hide(label: self.deliveryTimer3)
                    self.vT.hide(label: self.deliveryTimer4)
                    
                }
                else if dQ.count == 2 {
                    vT.startTimer(deliveryTimer1,  dQ[0], 2)
                    vT.startTimer( deliveryTimer2, dQ[1], 2)
                    
                    
                    self.vT.hide(label: self.deliveryTimer3)
                    self.self.vT.hide(label: self.deliveryTimer4)
                    
                }
                else if dQ.count == 3 {
                                    vT.startTimer( deliveryTimer1,  dQ[0],  2)
                                    vT.startTimer( deliveryTimer2,  dQ[1],  2)
                                    vT.startTimer( deliveryTimer3,  dQ[2],  2)
                    
                    
                    self.vT.hide(label: self.deliveryTimer4)
                    
                }
                else {
                                      vT.startTimer( deliveryTimer1,  dQ[0],  2)
                                      vT.startTimer( deliveryTimer2,  dQ[1], 2)
                                      vT.startTimer(deliveryTimer3,  dQ[2],  2)
                                      vT.startTimer( deliveryTimer3,  dQ[3], 2)
                    
                }
            }
            else{
                self.vT.hide(label: self.deliveryTimer1)
                self.self.vT.hide(label: self.deliveryTimer2)
                self.self.vT.hide(label: self.deliveryTimer3)
                self.vT.hide(label: self.deliveryTimer2)
            }
        
    } // End of delivery queue function
    

// function to update time
    
   @objc func updateSaudiTime(){


          let date = Date()
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
          dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")

          let str = dateFormatter.string(from : date)


          self.dayTimeLabel.text = str

    } //End of function updateTime.

    
    
    
    
    
    

    
//
//    func abc () {
//
//       // var x = expectedTime()
//
//        let (x, y, z) = expectedTime()
//        print(x[0])
//        print(y[0])
//        print(z[0])
//
//    }
//
    
    // Variable Declaration for Expected Time eT, Maximum Interval, and Order Queue
    
    var a : [Int] = []
    var b : [Int] = []
    var c : [String] = []
    
    var rest_Id : Int = Int()
    var dropDownOption : [String] = Array()
    var rest_name : String = String()
    
    var restDetails = [String: Int]()
    
    
    //Function to ghet the expected time for delivery and populating the array
    func expectedTime()->(a:Array<Int>, b:Array<Int>, c:Array<String>, restDetails:[String : Int]){
        
        
        let url = URL(string: "http://13.126.194.18:4200/api/expTime")
        
        do{
            let data =  try Data(contentsOf: url!)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            if let array = json as? [Any] {
                
                for x in array{
                    if let dataStatus = x as? [String:Any] {
                        
                        if  let eT = dataStatus["max_interval"]  as? Int  {
                            
                            a += [eT]
                            
                        }
                        
                        if let mI = dataStatus["expected_interval"] as? Int{
                            b += [mI]
                        }
                        
                        if let qN = dataStatus["queue_name"] as? String{
                            c += [qN]
                        }
                    }//end of dataStatus loop
                } // end of for array loop
                
                for (index, value) in array.enumerated() {
                    if(index > 2){
                        //guard let rest_details = value as? String else {return}
                        
                        if let rest_details = value as? [String: Any]{
                            
                            if let id = rest_details["id"] as? Int {
                                rest_Id = id
                            }
                            
                            if let restName = rest_details["name"] as? String {
                                rest_name = restName
                                dropDownOption += [restName]
                            }
                            
                            
                            // button.dropView.dropDownOptions = dropDownOption
                             dropdownList = dropDownOption
                            
                            
                        }
                        
                        restDetails[rest_name] = rest_Id
                        
                    }
                }
                
                
            }//end of Array Loop
            
        }//end of Do Array Loop
            
        catch {
            print(error)
        }
        return (a,b,c, restDetails )
    }//End of function to calculate expected Time
    
    

    
    
    var flag = 0
    
    var dropdownList : Array<String> = Array()
    
    
// Main View Did Load Function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize : CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        self.setupLayout()
       // self.expectedTime()
        
      //  mqttCall()
        
        Timer.scheduledTimer(timeInterval: 0.10, target: self, selector: #selector(ViewController.updateSaudiTime), userInfo: nil, repeats: true)
        
    }
    
    
    
    // Layout of the views
    
    func setupLayout(){
        
    
        view.backgroundColor = UIColor.black
        
        //Container for header view
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.black
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        
        
        
         headerView.addSubview(logo)
        
         logo.topAnchor.constraint(equalTo: headerView.topAnchor, constant:11).isActive = true
         logo.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0).isActive = true
         logo.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -290).isActive = true
         logo.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.90).isActive = true
        
        headerView.bringSubviewToFront(logo)
        
        
        
        // Contenet of header conatainer
//        headerView.addSubview(headLabel)
//
//        headLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 25).isActive = true
//        headLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5).isActive = true
//        headLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -300).isActive = true
//        headLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
//        headLabel.textAlignment = .center
//        headLabel.font = UIFont(name: "Helveticaneue_Bold", size: 16.0)
//        headLabel.textColor = UIColor.white
//        headLabel.backgroundColor = UIColor.yellow
//
        
        
       // Day Time Label
        
         headerView.addSubview(dayTimeLabel)
//
        dayTimeLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10).isActive = true
        dayTimeLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 85).isActive = true
        dayTimeLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
       
        dayTimeLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.9).isActive = true
        dayTimeLabel.textAlignment = .center
        dayTimeLabel.font = UIFont(name: "Arial", size: 18.0)
        dayTimeLabel.textColor = UIColor.white
        
       // label.font = UIFont.boldSystemFontOfSize(16.0)
        
        //dayTimeLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        
//        dayTimeLabel.shadowOffset = CGSize(width: 2, height: 4)
//        dayTimeLabel.shadowColor = UIColor.red
////
        
        
//
//        // Button "Press Here" inside header container
//
//        headerView.addSubview(pressHere)
//        pressHere.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 25).isActive = true
//        pressHere.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 280).isActive = true
//        pressHere.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -2).isActive = true
//        pressHere.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
    
        
       
    
        
        
        //Container for order view
        let orderView = UIView()
        orderView.backgroundColor = UIColor.subViewContainerColor
        view.addSubview(orderView)
    
        orderView.translatesAutoresizingMaskIntoConstraints = false
        orderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2).isActive = true
        orderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        orderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        orderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        
        //Image View For Container
        
//        orderView.addSubview(imageView)
//
//        imageView.centerXAnchor.constraint(equalTo: orderView.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: orderView.centerYAnchor).isActive = true
////        imageView.topAnchor.constraint(equalTo: orderView.topAnchor, constant: 20).isActive = true
////        imageView.leadingAnchor.constraint(equalTo: orderView.leadingAnchor).isActive = true
////        imageView.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant :-100).isActive = true
//        imageView.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 1.00 ).isActive = true
//
        
        
        
        
        // Contenet of Order View conatainer
        
        // order Title
        orderView.addSubview(orderLabel)
        orderLabel.centerXAnchor.constraint(equalTo: orderView.centerXAnchor, constant: -100).isActive = true
        //orderLabel.centerYAnchor.constraint(equalTo: orderView.centerYAnchor).isActive = true
        
        orderLabel.centerYAnchor.constraint(equalTo: orderView.centerYAnchor, constant: -80).isActive = true
        
        orderLabel.heightAnchor.constraint(equalTo:  orderView.heightAnchor, multiplier: 0.2).isActive = true
        orderLabel.textAlignment = .center
        orderLabel.font = UIFont(name: "Arial", size: 20.0)
        orderLabel.textColor = UIColor.black
        
        orderLabel.shadowOffset = CGSize(width: 2, height: 4)
        orderLabel.shadowColor = UIColor.white
        


        // order Data
        
        orderView.addSubview(orderData)
        orderData.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 0).isActive = true
        orderData.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 10).isActive = true
        orderData.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -220).isActive = true
        orderData.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.78).isActive = true
        
        
        orderData.backgroundColor = UIColor.orderBGColor
        orderData.textAlignment = .center
        
       
        orderData.font = UIFont(name: "Arial", size: 70)
        
        orderData.textColor = .white
        orderData.shadowOffset = CGSize(width: 8, height: 4)
        orderData.shadowColor = UIColor.black
    

        
        // Order Queue Timer1
        
        orderView.addSubview(orderTimer1)
        
        orderTimer1.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 80).isActive = true
        orderTimer1.leadingAnchor.constraint(equalTo: orderData.trailingAnchor, constant: 10).isActive = true
        orderTimer1.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -120).isActive = true
        orderTimer1.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.35).isActive = true
        
        
        orderTimer1.isHidden = true
        
        
        
    
        //Container for delivery view
        
        let deliveryView = UIView()
        deliveryView.backgroundColor = UIColor.subViewContainerColor
        view.addSubview(deliveryView)
        
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
        deliveryView.topAnchor.constraint(equalTo: orderView.bottomAnchor, constant: 2).isActive = true
        deliveryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        deliveryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        deliveryView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        //Delivery Title

        
        deliveryView.addSubview(deliveryLabel)
        deliveryLabel.centerXAnchor.constraint(equalTo: deliveryView.centerXAnchor, constant: -100).isActive = true
//        deliveryLabel.centerYAnchor.constraint(equalTo: deliveryView.centerYAnchor).isActive = true
        deliveryLabel.centerYAnchor.constraint(equalTo: deliveryView.centerYAnchor, constant: -80).isActive = true
        deliveryLabel.heightAnchor.constraint(equalTo:  deliveryView.heightAnchor, multiplier: 0.2).isActive = true
        deliveryLabel.textAlignment = .center
        deliveryLabel.font = UIFont(name: "Arial", size: 20.0)
        deliveryLabel.textColor = UIColor.black
        
        deliveryLabel.shadowOffset = CGSize(width: 2, height: 4)
        deliveryLabel.shadowColor = UIColor.white
        
        //delivery Data
        deliveryView.addSubview(deliveryData)
        
        deliveryData.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 0).isActive = true
        deliveryData.leadingAnchor.constraint(equalTo: deliveryView.leadingAnchor, constant: 10).isActive = true
        deliveryData.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -220).isActive = true
        deliveryData.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.78 ).isActive = true
        
        deliveryData.backgroundColor = UIColor.deliveryBGColor
        deliveryData.textAlignment = .center
        deliveryData.font = UIFont(name: "Arial", size: 70.0)
        
        
        deliveryData.textColor = .white
        deliveryData.shadowOffset = CGSize(width: 8, height: 4)
        deliveryData.shadowColor = UIColor.black
        
        
        
        //Delivery Timer1
    
        deliveryView.addSubview(deliveryTimer1)
        
       deliveryTimer1.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 80).isActive = true
       deliveryTimer1.leadingAnchor.constraint(equalTo: deliveryData.trailingAnchor, constant: 10).isActive = true
       deliveryTimer1.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -120).isActive = true
       deliveryTimer1.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true
        
        deliveryTimer1.isHidden = true
    
        //Delivery Timer2

        deliveryView.addSubview(deliveryTimer2)

        deliveryTimer2.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 80).isActive = true
        deliveryTimer2.leadingAnchor.constraint(equalTo: deliveryTimer1.trailingAnchor, constant: 10).isActive = true
        deliveryTimer2.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -20).isActive = true
        deliveryTimer2.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true

        deliveryTimer2.isHidden = true
        
        //Delivery Timer3

        deliveryView.addSubview(deliveryTimer3)

        deliveryTimer3.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant:0).isActive = true
        deliveryTimer3.leadingAnchor.constraint(equalTo: deliveryData.trailingAnchor, constant: 10).isActive = true
        deliveryTimer3.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant:-120).isActive = true
        deliveryTimer3.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true

        deliveryTimer3.isHidden = true
        
        //Delivery Timer4

        deliveryView.addSubview(deliveryTimer4)

        deliveryTimer4.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant:0).isActive = true
        deliveryTimer4.leadingAnchor.constraint(equalTo: deliveryTimer3.trailingAnchor, constant: 10).isActive = true
        deliveryTimer4.trailingAnchor.constraint(equalTo: deliveryView.trailingAnchor, constant: -20).isActive = true
        deliveryTimer4.heightAnchor.constraint(equalTo: deliveryView.heightAnchor, multiplier: 0.35).isActive = true

        deliveryTimer4.isHidden = true
        
        
        
        //Container for delivered view
        
        let deliveredView = UIView()
        deliveredView .backgroundColor = UIColor.subViewContainerColor
        view.addSubview(deliveredView )
        
        deliveredView .translatesAutoresizingMaskIntoConstraints = false
        deliveredView .topAnchor.constraint(equalTo: deliveryView.bottomAnchor, constant: 2).isActive = true
        deliveredView .leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 3.5).isActive = true
        deliveredView .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -3.5).isActive = true
        deliveredView .heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.29).isActive = true
        
        
        // Contenet of delivered View conatainer
        
         deliveredView.addSubview( deliveredLabel)
        deliveredLabel.centerXAnchor.constraint(equalTo: deliveredView.centerXAnchor, constant:-100).isActive = true
//         deliveredLabel.centerYAnchor.constraint(equalTo: deliveredView.centerYAnchor).isActive = true
         deliveredLabel.centerYAnchor.constraint(equalTo: deliveredView.centerYAnchor, constant: -80).isActive = true
         deliveredLabel.heightAnchor.constraint(equalTo:  deliveredView.heightAnchor, multiplier: 0.2).isActive = true
         deliveredLabel.textAlignment = .center
         deliveredLabel.font = UIFont(name: "Arial", size: 20.0)
         deliveredLabel.textColor = UIColor.black
        
        deliveredLabel.shadowOffset = CGSize(width: 2, height: 4)
        deliveredLabel.shadowColor = UIColor.white
        
        
        //delivered Data
        
        deliveredView.addSubview(deliveredData)
        
        deliveredData.topAnchor.constraint(equalTo: deliveredLabel.bottomAnchor, constant: 0).isActive = true
        deliveredData.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 10).isActive = true
        deliveredData.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -220).isActive = true
        deliveredData.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.78).isActive = true
        
        deliveredData.backgroundColor = UIColor.deliveredBGColor
        deliveredData.textAlignment = .center
        deliveredData.font = UIFont(name: "Arial", size: 70.0)
        
        deliveredData.textColor = .white
        deliveredData.shadowOffset = CGSize(width: 8, height: 4)
        deliveredData.shadowColor = UIColor.black
        
        
        deliveredView.addSubview(averageDel)
        
        averageDel.topAnchor.constraint(equalTo: deliveredView.topAnchor, constant: 65).isActive = true
        averageDel.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 160).isActive = true
        averageDel.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -10).isActive = true
        averageDel.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.60).isActive = true
        averageDel.font = UIFont(name: "Arial", size: 38.0)
        
        averageDel.backgroundColor = UIColor.black
        averageDel.textColor = UIColor.red
        
        averageDel.textAlignment = NSTextAlignment.center
        
        
        
        // Title for delivery average
        
        deliveredView.addSubview(averageDetTitle)
        
        averageDetTitle.topAnchor.constraint(equalTo: deliveredView.topAnchor, constant: 33).isActive = true
        averageDetTitle.leadingAnchor.constraint(equalTo: deliveredView.leadingAnchor, constant: 160).isActive = true
        averageDetTitle.trailingAnchor.constraint(equalTo: deliveredView.trailingAnchor, constant: -10).isActive = true
        averageDetTitle.heightAnchor.constraint(equalTo: deliveredView.heightAnchor, multiplier: 0.25).isActive = true
        averageDetTitle.font = UIFont(name: "Arial", size: 20.0)
        
        averageDetTitle.backgroundColor = UIColor.black
        averageDetTitle.textColor = UIColor.white
        averageDetTitle.text = "Overall Average"
        
       
        
        averageDetTitle.textAlignment = NSTextAlignment.center
        
        
        orderView.addSubview(button)
        button.setTitle("Resturents", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.topAnchor.constraint(equalTo: orderView.topAnchor, constant: 5).isActive = true
        button.leadingAnchor.constraint(equalTo: orderView.leadingAnchor, constant: 240).isActive = true
        button.trailingAnchor.constraint(equalTo: orderView.trailingAnchor, constant: -5).isActive = true
        button.heightAnchor.constraint(equalTo: orderView.heightAnchor, multiplier: 0.22).isActive = true
        
        
        // for tableView
        orderView.addSubview(tableViews)
        
        //registering the cell
        tableViews.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //It's give button x position and y position
        
        tableViews.frame = CGRect(x: button.frame.origin.x, y: button.frame.origin.y, width: button.frame.width, height: 100)
        tableViews.delegate = self
        tableViews.dataSource = self
        
        tableViews.isHidden = true
        
    }//End of setupLayout function
    
    
    
    
// function pressDrop
    @objc func pressDrop(){
        if flag == 0 {
            // hide so height 0
            UIView.animate(withDuration: 0.1){
                self.tableViews.frame = CGRect(x: self.button.frame.origin.x, y: self.button.frame.origin.y + self.button.frame.height, width: self.button.frame.width, height: 0)
                self.tableViews.isHidden = true

                // set flag to 1
                self.flag = 1
            }
            
        }
        else{
            //show
            UIView.animate(withDuration: 0.1){
                
                self.tableViews.frame = CGRect(x: self.button.frame.origin.x, y: self.button.frame.origin.y + self.button.frame.height, width: self.button.frame.width, height: 100)
                self.tableViews.isHidden = false
                
                // set flag to 1
                self.flag = 0
                
            }
        }
    } //End of PressDrop Function
    
    
    
    // number of selection in dropdown
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in dropdown
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropdownList.count
    }
    
    // height of each dropdown row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //display in dropdown list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViews.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "cell"
        cell.textLabel?.text = dropdownList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get the value for the row
        button.setTitle(dropdownList[indexPath.row], for: .normal)
        
        self.tableViews.frame = CGRect(x: self.button.frame.origin.x, y: self.button.frame.origin.y + self.button.frame.height, width: self.button.frame.width, height: 0)
        self.tableViews.isHidden = true
        
        self.flag = 1
        pr(string: dropdownList[indexPath.row])
    }
    
    var restCode = Int()
    func pr(string: String){
        
                let (_, _, _, restDetails) = expectedTime()
               // code = restDetails[string]!
                restCode = restDetails[string]!
                pressNow()
    }
    
// Function for resturents details
    
    @objc func pressNow() {
        
        var orderQueueArr : Array<Int> = Array()
        var deliveryQueueArr : Array<Int> = Array()
        //        var deliveredQueueArr : Array<Int> = Array()
        
        
        var deliveredQueueData : Int = Int()
        
        var secondsInOrder1 : Int = Int()
        var secondsInOrder2 : Int = Int()
        
      
        
        let parameters = ["resID": restCode]
        
        guard let url = URL(string : "http://13.126.194.18:4200/api/log") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            else{return}
        
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            //            if let response = response {
            //                //print(response)
            //            }
            if let data = data{
                    
                if data.isEmpty == false{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                    
                    if let array = json as? [String:Any] {
                        self.initScreen()
                        if let code = array["log"] as? [Any]{
                            var x = 0
                            var y = 0
                            var z = 0
                            let date = Date()
                            let dateFormatter = DateFormatter()
                            var stringToDate : Date
                            
                            for user in code{
                
                            if let userDict = user as? [String:Any] {
                                    
                            if let status = userDict["status"] as? Int {
                            if status == 1 {
                                            
                                if let orderQueData = userDict["passage_queue"] as? String {
                                                
                                //Calculate current Saudi Time
                                                
                                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                
                                                
                                //Differenece in Time
                                                
                                stringToDate = dateFormatter.date(from: orderQueData)!
                                var secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                                
                                orderQueueArr += [secondsInOrder]
                                                
                                }//End of Order Queue Loop
                                            
                                x = x+1
                                            
                                } // End of Status == 1 Loop
                                            
                                else if status == 2 {
                                            
                                if let deliveryQueData = userDict["order_queue"] as? String {
                                                
                                //calculate Current saudi Time
                                                
                                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                
                                                
                                                
                                //difference in Time
                                                
                                stringToDate = dateFormatter.date(from: deliveryQueData)!
                                
                                // return Seconds In Delivery Queue return Type Int
                                let secondsInDelivery = date.seconds(from: stringToDate)
                                    
                                                
                                                
                                // self.updateVechileTimer(sec: secondsInDelivery, stat: status)
                                                
                                deliveryQueueArr += [secondsInDelivery]
                                                
                                                
                                                
                                }//End of delivery Queue Data
                                            
                                y = y + 1
                                            
                                } // End of Status == 2 Loop
                                            
                                else if status == 3 {
                                            
                                            
                                    if let deliveredQueData = userDict["delivery_queue"] as? String {
                                                
                                        //Calculate current Saudi Time
                                                
                                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                        dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                
                                                
                                        //Differenece in Time
                                                
                                        stringToDate = dateFormatter.date(from: deliveredQueData)!
                                        var secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                                
                                        //deliveredQueueArr += [secondsInOrder]
                                        secondsInOrder1 = secondsInOrder
                                                
                                                
                                        }//End of Order Queue Loop
                                            
                                    if let orderQueData = userDict["passage_queue"] as? String {
                                                
                                                //Calculate current Saudi Time
                                                
                                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000'Z'"
                                        dateFormatter.timeZone = TimeZone.init(identifier: "Asia/Riyadh")
                                                
                                                
                                                //Differenece in Time
                                                
                                        stringToDate = dateFormatter.date(from: orderQueData)!
                                        var secondsInOrder = date.seconds(from: stringToDate) // return Seconds In Order Queue return Type Int
                                                
                                        secondsInOrder2 = secondsInOrder
                                                
                                        // orderQueueArr += [secondsInOrder]
                                                
                                        }//End of PassageQueue Data
                                            
                                        deliveredQueueData += secondsInOrder2 - secondsInOrder1
                                            
                                            
                                        z = z + 1
                                            
                                    }//end of status == 3 Loop
                                        
                                    } //end of for user Loop
                             
                                }//End of Status Loop
                            } //End of UserDict Loop
                            DispatchQueue.main.async {
                                self.orderData.text = String(x)
                                self.deliveryData.text = String(y)
                                self.deliveredData.text = String(z)
                                
                            }
                            self.orderqueue(orderQueue: orderQueueArr)
                            self.deliveryQueue(deliveryQueue: deliveryQueueArr)
                            self.averagePerformance(time: deliveredQueueData, count: z)
                            
                            
                        } //end of do
    
                    }//End of "Code" Loop
                
                }//End of "Array" Loop
                    
                catch{
                    print(error)
                } //end of catch
                    
            }//End of If Empty Startement
            else{
                print("empty data")
            }
            }// end of data task
        
        }.resume()//end of seesion.datatask
      
    } // End of Fuction to bring resturents data
    
    
    //Function to initilize screen at the time of each selection
    func initScreen(){
        DispatchQueue.main.async {
            self.orderData.text = String(0)
            self.deliveryData.text = String(0)
            self.deliveredData.text = String(0)
            self.orderTimer1.isHidden = true
            self.deliveryTimer1.isHidden = true
            self.deliveryTimer2.isHidden = true
            self.deliveryTimer3.isHidden = true
            self.deliveryTimer4.isHidden = true
            self.averageDel.text = "0  :  0"
        }
        
    }//End of Function to initilize screen at the time of each selection
    
}// End of main class

// Function to change backGround Colour from the hexa Deciamal Codes

extension UIColor {
    
    func colorFromHex(_ hex:String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      
        if hexString.hasPrefix("#"){
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6{
            return UIColor.black
        }
        
        var rgb:UInt32 = 0
        
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000)>>16)/255.0,
            green: CGFloat((rgb & 0x00FF00)>>8)/255.0,
            blue : CGFloat(rgb & 0x0000FF)/255.0, alpha:1.0)
        
      
        
  } // End of colorFromHex
    
     static let orderBGColor = UIColor().colorFromHex("#5271C2")
     static let deliveryBGColor = UIColor().colorFromHex("#35a541")
     static let deliveredBGColor = UIColor().colorFromHex("#bdb235")
     static let  titleBGColor = UIColor().colorFromHex("#666666")
     static let  subViewContainerColor = UIColor().colorFromHex( "#e5e5e5")
   
}//End of UIColor


extension Date {
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
}// End of Extension Date


class VechileCurrentTime {
    
    
    
    var labelName : UILabel = UILabel()
    
    var timer = Timer()
    
    var time = 0
    
    var status = 0
    
    func startTimer(_ label : UILabel, _ vechTime: Int, _ Vechstatus: Int){
        
        labelName = label
        
        time = vechTime
        
        status = Vechstatus
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(VechileCurrentTime.action), userInfo: nil, repeats: true)
    }
    
    func hide(label:UILabel){
        let label : UILabel = label
        DispatchQueue.main.async {
            label.isHidden = true
        }
        
        
    }
    
    @objc func action(){
        
        let label = labelName
        
        DispatchQueue.main.async {
            label.isHidden = false
        }
        
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
    
    
    
//    //timer
//    var timer = Timer()
//
//    @objc func updateTime(label:UILabel, time : Int, status: Int)  {
//
//        let label : UILabel = label
//        var time : Int = time
//        let status : Int = status
//
//        DispatchQueue.main.async {
//        label.isHidden = false
//        }
//
//        var b : Int
//        var a : Int
//
//        time += 1
//        a = time % 60 //Seconds
//        b = time / 60 //Minutes
//
//        if b > 59 {
//            b = 0
//        }
//
//        DispatchQueue.main.async {
//
//            label.text = "\(b) : \(a)"
//
//        }
//
//        colorChange(a: a, b: b, label:label, status:status)
//
//    }// End of updateTime function
//
//
//
//
////Color Change Function for the Vechniles in the queue
//
//    func colorChange(a:Int, b:Int, label:UILabel, status:Int) {
//
//        let a : Int = a
//        let b : Int = b
//        let label :UILabel = label
//        let status: Int = status
//
//        DispatchQueue.main.async {
//
//            if status == 1{
//                if ( b == 0 && a < 45) {
//                    label.backgroundColor = UIColor.green
//                }
//                else if (b == 0 && a > 45) || (b == 0 && a < 59) {
//                    label.backgroundColor = UIColor.yellow
//                }
//                else if b>0 {
//                    label.backgroundColor = UIColor.red
//                }
//
//
//            }//end of status == 1
//
//            else if status == 2{
//
//                if (b <= 1 && a < 60) || (b == 2 && a < 30) {
//                    label.backgroundColor = UIColor.green
//                }
//                else if (b == 2 && a > 30) || (b == 2 && a < 59) {
//                    label.backgroundColor = UIColor.yellow
//                }
//                else {
//                    label.backgroundColor = UIColor.red
//                }
//            } //end os status == 2
//        }
//
//
//    } // End of colour change function
//
//
//    func hide(label:UILabel){
//        let label : UILabel = label
//        DispatchQueue.main.async {
//               label.isHidden = true
//        }
//
//    }// End of function Hide.
//
//
    
    
    
    
    
    
}// end of vechileCurrentTime class





/*
 

 //Variable decleration
 
 var timer = Timer()
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 timeStart()
 
 setupLayout()
 
 }
 
 func timeStart(){
 timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(ViewController.updateTime)), userInfo: nil, repeats: true)
 }
 
 */

