//
//  quotation.swift
//  app1
//
//  Created by Кирилл on 11.05.2021.
//

import Foundation


struct quote: Codable{
    let converted: Double
}

func find_quotes(val1: String, val2:String) -> String{
    let urlString = "https://api.polygon.io/v1/conversion/" + val1 + "/" + val2 + "?amount=1&precision=4&apiKey=fbr79axfr6cfkKPPim1ITWn2_uSo736K"
    let url = URL(string: urlString)!
    var a: String = ""
    if let data = try? Data(contentsOf: url) {
        a = parse(json: data)
    }
    return (a)
}
func find_quotes_convertor(val1: String, val2:String, count:Double) -> String{
    let urlString = "https://api.polygon.io/v1/conversion/" + val1 + "/" + val2 + "?amount=" + String(count) + "&precision=4" + "&apiKey=fbr79axfr6cfkKPPim1ITWn2_uSo736K"
    let url = URL(string: urlString)!
    var a: String = ""
    if let data = try? Data(contentsOf: url) {
        a = parse(json: data)
    }
    return (a)
}
func parse(json: Data) -> String {
    let decoder = JSONDecoder()
    var a: String = ""
    var x: Double = 0
    if let jsonPetitions = try? decoder.decode(quote.self, from: json) {
        x = jsonPetitions.converted
    }
    a = String(x)
    return (a)
}
func count_value(count:Double) -> String{
    
    var str: String = ""
    var value: Double = 0
    var s :String = convert.GlobalVariable.acc
    var i: Int =  Int(pow(10, Double(convert.GlobalVariable.acc) ?? 1))
    var check:Double = AppDelegate.value_converter
    value = Double(round(count * AppDelegate.value_converter * Double(i)) / Double(i))
    str = String(value)
    return (str)
}
