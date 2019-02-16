//
//  ViewController.swift
//  Weather
//
//  Created by IMCS2 on 2/16/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CityTextField: UITextField!
    
    @IBOutlet weak var WeatherTextView: UITextView!
    
    @IBAction func SubmitButton(_ sender: Any) {
        var city = CityTextField.text!
        if city.contains(" "){
            let temp = city.split(separator: " ")
            city = ""
            for i in 0 ..< temp.count{
                city += temp[i]
                if(i != temp.count - 1){
                    city += "-"
                }
            }
//            print(city)
        }
        let URLString = "https://www.weather-forecast.com/locations/\(city)/forecasts/latest"
        let url = URL(string: URLString)
        do{
            let source = try String(contentsOf: url!)
            var tokens = source.components(separatedBy: "<span class=\"phrase\">")
            var data = tokens[1]
            tokens = data.components(separatedBy: "</span")
            data = tokens[0]
            print(data)
            WeatherTextView.text = data
            WeatherTextView.isEditable = false
        }
        catch{
            print("Exception occurred")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

