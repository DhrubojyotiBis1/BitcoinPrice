//
//  ViewController.swift
//  bitcoinPrice
//
//  Created by Dhrubojyoti on 03/01/19.
//  Copyright © 2019 Dhrubojyoti. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    let bitCoinData = BitcoinData()
    var displayPrice:Float = 0.0
    var symboleOfCurrency = ""
    

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.dataSource = self
        pickerView.delegate = self
        self.neworking()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (bitCoinData.countryCurrency.count)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bitCoinData.selectedCurrencyIndexNumber = row
        self.neworking()

        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bitCoinData.countryCurrency[row]
        
    }
    
    func neworking() {
        Alamofire.request(bitCoinData.url,method: .get)
            .responseJSON {(responce) in
                if responce.result.isSuccess{
                    
                    let json :JSON = JSON(responce.result.value!)
                    self.depectPrice(ofData: json)
                    
                }else{
                    self.bitcoinPriceLabel.text = "Check your internet connection!"
                }
        }
    }
    
    func depectPrice(ofData json:JSON){
        
        switch bitCoinData.selectedCurrencyIndexNumber {

        case 1:
            displayPrice = json["BRL"]["buy"].float!
            symboleOfCurrency = json["BRL"]["symbol"].string!
        case 2:
            displayPrice = json["CAD"]["buy"].float!
            symboleOfCurrency = json["CAD"]["symbol"].string!
        case 3:
            displayPrice = json["CHF"]["buy"].float!
            symboleOfCurrency = json["CHF"]["symbol"].string!
        case 4:
            displayPrice = json["CLP"]["buy"].float!
            symboleOfCurrency = json["CLP"]["symbol"].string!
        case 5:
            displayPrice = json["CNY"]["buy"].float!
            symboleOfCurrency = json["CNY"]["symbol"].string!
        case 6:
            displayPrice = json["DKK"]["buy"].float!
            symboleOfCurrency = json["DKK"]["symbol"].string!
        case 7:
            displayPrice = json["EUR"]["buy"].float!
            symboleOfCurrency = json["EUR"]["symbol"].string!
        case 8:
            displayPrice = json["GBP"]["buy"].float!
            symboleOfCurrency = json["GBP"]["symbol"].string!
        case 9:
            displayPrice = json["HKD"]["buy"].float!
            symboleOfCurrency = json["HKD"]["symbol"].string!
        case 10:
            displayPrice = json["INR"]["buy"].float!
            symboleOfCurrency = json["INR"]["symbol"].string!
        case 11:
            displayPrice = json["ISK"]["buy"].float!
            symboleOfCurrency = json["ISK"]["symbol"].string!
        case 12:
            displayPrice = json["JPY"]["buy"].float!
            symboleOfCurrency = json["JPY"]["symbol"].string!
        case 13:
            displayPrice = json["KRW"]["buy"].float!
            symboleOfCurrency = json["KRW"]["symbol"].string!
        case 14:
            displayPrice = json["NZD"]["buy"].float!
            symboleOfCurrency = json["NZD"]["symbol"].string!
        case 15:
            displayPrice = json["PLN"]["buy"].float!
            symboleOfCurrency = json["PLN"]["symbol"].string!
        case 16:
            displayPrice = json["RUB"]["buy"].float!
            symboleOfCurrency = json["RUB"]["symbol"].string!
        case 17:
            displayPrice = json["SEK"]["buy"].float!
            symboleOfCurrency = json["SEK"]["symbol"].string!
        case 18:
            displayPrice = json["SGD"]["buy"].float!
            symboleOfCurrency = json["SGD"]["symbol"].string!
        case 19:
            displayPrice = json["THB"]["buy"].float!
            symboleOfCurrency = json["THB"]["symbol"].string!
        case 20:
            displayPrice = json["TWD"]["buy"].float!
            symboleOfCurrency = json["TWD"]["symbol"].string!
        case 21:
            displayPrice = json["USD"]["buy"].float!
            symboleOfCurrency = json["USD"]["symbol"].string!
        default:
            displayPrice = json["AUD"]["buy"].float!
            symboleOfCurrency = json["AUD"]["symbol"].string!
        }
        
        bitcoinPriceLabel.text = "\(displayPrice) \(symboleOfCurrency)"
        
    }
}

