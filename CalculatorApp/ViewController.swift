//
//  ViewController.swift
//  CalculatorApp
//
//  Created by user199544 on 9/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var advancedButton: UIButton!
    var numberOnScreen:Double=0
    var previousNumber:Double=0
    var performinMath=false
    var operation=0
    var isPlaying:Bool = true
    var historyArray: [String] = []
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var HistoryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        HistoryLabel.isHidden=true;
        // Do any additional setup after loading the view.
    
    
    }
    var txt:String=""

    func sum(value:String){
        txt+=value
        mylabel.text=txt
    }
    func validInput()->Bool{
        var count = 0
                var funcCharIndexes = [Int]()
                
                for char in txt
                {
                    if(specialCharacter(char: char))
                    {
                        funcCharIndexes.append(count)
                    }
                    count += 1
                }
                
                var previous: Int = -1
                
                for index in funcCharIndexes
                {
                    if(index == 0)
                    {
                        return false
                    }
                    
                    if(index == txt.count - 1)
                    {
                        return false
                    }
                    
                    if (previous != -1)
                    {
                        if(index - previous == 1)
                        {
                            return false
                        }
                    }
                    previous = index
                }
                
                return true
            }
            
            func specialCharacter (char: Character) -> Bool
            {
                if(char == "*")
                {
                    return true
                }
                if(char == "/")
                {
                    return true
                }
                if(char == "+")
                {
                    return true
                }
                if(char == "-")
                {
                    return true
                }
               
   
                return false
    }
    
    @IBAction func numbers(_sender:UIButton){
       
            sum(value: String(_sender.tag))
        
    }
    
    @IBAction func buttons(_sender:UIButton){
        
        if(validInput()){
            //previousNumber=Double(mylabel.text!)!
            if _sender.tag==12{
                sum(value: "/")
            }
            if _sender.tag==13{
                sum(value: "*")            }
            if _sender.tag==14{
                sum(value: "-")            }
            if _sender.tag==15{
                sum(value: "+")            }
            
            
        if _sender.tag==16{
            
            let expression = NSExpression(format: txt)
            let result = expression.expressionValue(with: nil, context: nil) as! Int
            let resultString = String(result)
            resultLabel.text = resultString

            historyArray.append("\(txt) = \(resultString)")
            var stingcon = ""
            print(historyArray)
            for element in historyArray {
                stingcon += element + "\n"



            }
            HistoryLabel.text=stingcon

            
        }
        else if  _sender.tag==11 {
            txt=""
            resultLabel.text=""
            mylabel.text=""
        }
        }
        else{
            txt="Error"
        }
      
    }
    @IBAction func advancedButton(_ sender: Any) {
        if isPlaying{
            isPlaying=false;
            advancedButton.setTitle("Standard No History", for: UIControl.State.normal)
            HistoryLabel.isHidden=false;
            

        }
            else{
                HistoryLabel.text=""
                historyArray.removeAll()
                isPlaying = true
                HistoryLabel.isHidden=true;
                advancedButton.setTitle("Advanced No History", for: UIControl.State.normal)


                
            }
        
        }
        
    }


    



