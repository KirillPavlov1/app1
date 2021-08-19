//
//  AppDelegate.swift
//  app1
//
//  Created by Кирилл on 25.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static var all = all_valutes()

    static var value_converter : Double = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let get_str = converter.ViewController.defaults.string(forKey: "valute")
        self.main_valute = get_str == nil ? "EUR" : get_str!
        AppDelegate.all = get_values()
        let get_str2 = convert.defaults.string(forKey: "valute1")
        let my_text:String = get_str2 == nil ? "EUR" : get_str2!
        let get_str3 = convert.defaults.string(forKey: "valute2")
        let my_text2:String = get_str3 == nil ? "NOK" : get_str3!
        AppDelegate.value_converter = Double(find_quotes_convertor(val1: my_text, val2: my_text2, count: 1)) ?? 0
        return true
    }
    
    func application (_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
      return true
    }

    func application (_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
      return true
    }

    var main_valute: String = ""
    
    func repeat_action()
    {
        let get_str = ViewController.defaults.string(forKey: "valute")
        self.main_valute = get_str == nil ? "EUR" : get_str!
        AppDelegate.all = get_values()
    }

    func replace_valutes()
    {
        let get_str2 = convert.defaults.string(forKey: "valute1")
        let my_text:String = get_str2 == nil ? "EUR" : get_str2!
        let get_str3 = convert.defaults.string(forKey: "valute2")
        let my_text2:String = get_str3 == nil ? "NOK" : get_str3!
        AppDelegate.value_converter = Double(find_quotes_convertor(val1: my_text, val2: my_text2, count: 1)) ?? 0
    }
    
    func get_values() -> all_valutes{
        var all = all_valutes()
        all.RUB = find_quotes_convertor(val1: self.main_valute, val2: "RUB", count: 1)
        all.USD = find_quotes_convertor(val1: self.main_valute, val2: "USD", count: 1)
        all.EUR = find_quotes_convertor(val1: self.main_valute, val2: "EUR", count: 1)
        all.AUD = find_quotes_convertor(val1: self.main_valute, val2: "AUD", count: 1)
        all.CAD = find_quotes_convertor(val1: self.main_valute, val2: "CAD", count: 1)
        all.CHF = find_quotes_convertor(val1: self.main_valute, val2: "CHF", count: 1)
        all.CNY = find_quotes_convertor(val1: self.main_valute, val2: "CNY", count: 1)
        all.CZK = find_quotes_convertor(val1: self.main_valute, val2: "CZK", count: 1)
        all.GBP = find_quotes_convertor(val1: self.main_valute, val2: "GBP", count: 1)
        all.NOK = find_quotes_convertor(val1: self.main_valute, val2: "NOK", count: 1)
        all.SEK = find_quotes_convertor(val1: self.main_valute, val2: "SEK", count: 1)
        all.JPY = find_quotes_convertor(val1: self.main_valute, val2: "JPY", count: 1)
        return(all)
    }
    
}

struct all_valutes{
    var RUB : String = ""
    var USD : String = ""
    var EUR : String = ""
    var AUD : String = ""
    var CAD : String = ""
    var CHF : String = ""
    var CNY : String = ""
    var CZK : String = ""
    var GBP : String = ""
    var NOK : String = ""
    var SEK : String = ""
    var JPY : String = ""
}
