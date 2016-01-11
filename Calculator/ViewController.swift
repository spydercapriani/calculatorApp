//
//  ViewController.swift
//  Calculator
//
//  Created by Daniel Gilbert on 1/8/16.
//  Copyright © 2016 Daniel Gilbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Labels
    @IBOutlet weak var lblCalculation: UILabel!
    
    // Variables
    var variableString:String = "0"
    var equationValues:[Double] = []
    var operatorValue:String = ""
    var answer:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblCalculation.text = variableString
        equationValues = [Double(variableString)!, 0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Function Button Actions
    @IBAction func calculateButtonPressed(sender: UIButton) {
        updateOperator("=")
        lblCalculation.text = answer!
    }
    
    @IBAction func plusButtonPressed(sender: UIButton) {
        updateOperator("+")
    }
    
    @IBAction func minusButtonPressed(sender: UIButton) {
        updateOperator("-")
    }
    
    @IBAction func divideButtonPressed(sender: UIButton) {
        updateOperator("/")
    }
    
    @IBAction func multiplyButtonPressed(sender: UIButton) {
        updateOperator("*")
    }
    
    // Value Button Actions
    
    @IBAction func plusMinusButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("plusMinus").description
    }
    
    @IBAction func goBackButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("goBack").description
    }
    
    @IBAction func decimalButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable(".").description
    }
    
    @IBAction func oneButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("1").description
    }
    
    @IBAction func twoButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("2").description
    }
    
    @IBAction func threeButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("3").description
    }
    
    @IBAction func fourButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("4").description
    }
    
    @IBAction func fiveButtonPressed(sender: AnyObject) {
        lblCalculation.text = createVariable("5").description
    }
    
    @IBAction func sixButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("6").description
    }
    
    @IBAction func sevenButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("7").description
    }
    
    @IBAction func eightButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("8").description
    }
    
    @IBAction func nineButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("9").description
    }
    
    @IBAction func zeroButtonPressed(sender: UIButton) {
        lblCalculation.text = createVariable("0").description
    }
    
    // Helper Functions
    func createVariable(value:String) -> Double{
        switch(value){
        case "1":
            updateVariable("1")
            break
        case "2":
            updateVariable("2")
            break
        case "3":
            updateVariable("3")
            break
        case "4":
            updateVariable("4")
            break
        case "5":
            updateVariable("5")
            break
        case "6":
            updateVariable("6")
            break
        case "7":
            updateVariable("7")
            break
        case "8":
            updateVariable("8")
            break
        case "9":
            updateVariable("9")
            break
        case "0":
            updateVariable("0")
            break
        case ".":
            if(!variableString.containsString(".")){
                variableString.append(Character("."))
            }
            break
        case "goBack":
            if variableString.characters.count > 1 {
                variableString.removeAtIndex(variableString.endIndex.predecessor())
            }else{
                variableString = "0"
            }
            break
        case "plusMinus":
            if !variableString.containsString("-"){
                variableString.insert("-", atIndex: variableString.startIndex)
            }else{
                variableString.removeAtIndex(variableString.characters.indexOf("-")!)
            }
            break
        default:
            print("This should not ever evaluate")
        }
        
        equationValues[1] = getVariable() // Update Equation Variables
        
        return getVariable()
    }
    
    /*
        Handles updating the variable string
    */
    func updateVariable(value:String){
        if variableString[variableString.startIndex] == "0" && !variableString.containsString(".") {
            variableString = value
            equationValues[1] = getVariable()
        }else{
            variableString.append(Character(value))
            equationValues[1] = getVariable()
        }
    }
    
    func setVariable(value:Double){
        variableString = value.description
        equationValues[1] = Double(variableString)!
    }
    
    func getVariable() -> Double {
        return Double(variableString)!
    }
    
    /*
        Handles updating the equationValues
    */
    func updateEquationValues(){
        if equationValues[0] == 0 {
            equationValues[0] = equationValues[1]
        }else{
            equationValues[0] = performCalculation()
        }
        variableString = 0.description
        equationValues[1] = getVariable()
    }
    
    /*
        Handles operator updates
    */
    func updateOperator(value:String){
        updateEquationValues()
        lblCalculation.text = equationValues[0].description
        operatorValue = value
        if operatorValue == "=" {
            answer = equationValues[0].description
            equationValues[1] = equationValues[0]
            equationValues[0] = 0
        }
    }
    
    func performCalculation() -> Double{
        switch(operatorValue){
        case "+":
            equationValues[0] = equationValues[0] + equationValues[1]
            break
        case "-":
            equationValues[0] = equationValues[0] - equationValues[1]
            break
        case "*":
            equationValues[0] = equationValues[0] * equationValues[1]
            break
        case "/":
            if equationValues[1] != 0{
                equationValues[0] = equationValues[0] / equationValues[1]
            }
            break
        default:
            print("Default Statement executed")
        }
        return equationValues[0]
    }
}

