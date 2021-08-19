//
//  ViewController.swift
//  app1
//
//  Created by Кирилл on 25.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var courses: UIButton!
    @IBOutlet weak var Settings: UIButton!
    @IBOutlet var valuts: [UIButton]!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var plusic: UIButton!
    @IBOutlet var pen: UIButton!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var convertor: UIButton!
    @IBOutlet weak var label1: label_main!
    @IBOutlet weak var scroll2: UIScrollView!
    @IBOutlet var h_scroll: NSLayoutConstraint!
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view_gradient: UIView!
    @IBOutlet var label_scroll: new_label!
    @IBOutlet var scroll_2_vals: [UIButton]!
    @IBOutlet weak var scroll_valutes: UIScrollView!
    
    
    var valute:String = ""
    var colors:[CGColor] = [
        UIColor(red: 0.22, green: 0.15, blue: 0.57, alpha: 1.0).cgColor,
        UIColor(red: 0.17, green: 0.13, blue: 0.37, alpha: 1.0).cgColor,
        UIColor(red: 0.14, green: 0.11, blue: 0.31, alpha: 1.0).cgColor]
    static var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        let get_str = ViewController.defaults.string(forKey: "valute")
        let my_text:String = get_str == nil ? "EUR" : get_str!
        valute = my_text
        let pencolor = UIColor(red: 0.145, green: 0.102, blue: 0.358, alpha: 1)
        pen.layer.backgroundColor = pencolor.cgColor
        pen.layer.shadowColor = UIColor(red: 0.32, green: 0, blue: 1, alpha: 0.11).cgColor
        pen.layer.shadowRadius = 20
        pen.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        plusic.layer.backgroundColor = pencolor.cgColor
        plusic.layer.shadowColor = UIColor(red: 0.32, green: 0, blue: 1, alpha: 0.11).cgColor
        plusic.layer.shadowRadius = 20
        plusic.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        let currentdate = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "dd.MM.yy"
        let datastring =  formatter.string(from: currentdate)
        day.text = datastring
       valuts.forEach({$0.layer.cornerRadius = 10})
        let gesture = UITapGestureRecognizer(target: self, action: #selector(someAction))
        view.addGestureRecognizer(gesture)
        convertor.layer.cornerRadius = 0.5 * convertor.bounds.size.width
        convertor.imageEdgeInsets = UIEdgeInsets(top: -28, left: -42, bottom: -58, right: -42)
        Settings.imageEdgeInsets = UIEdgeInsets(top: 4, left: 3, bottom: 4, right: 3)
        courses.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label1.layer.cornerRadius = 14
        label1.layer.masksToBounds = true
        day.layer.cornerRadius = 14
        view1.layer.backgroundColor = UIColor(red: 0.078, green: 0.051, blue: 0.212, alpha: 1).cgColor
        view2.layer.backgroundColor =  UIColor(red: 0.078, green: 0.051, blue: 0.212, alpha: 1).cgColor
        scroll_2_vals.forEach({$0.layer.cornerRadius = 10})
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func someAction()
    {
        scroll.isHidden = true
        scroll2.isHidden = true
    }
    
    @IBAction func button_pen(_ sender: Any) {
       
    }
    
    @IBAction func scroll_on(_ sender: Any) {
        scroll.isHidden = false
    }
    
    var x = AppDelegate()
    @IBAction func RUR(_ sender: Any) {
        valute = "RUB"
        label1.change_text(text: "RUB")
        label1.change_text2(text: "Российский рубль")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "RUB")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }

    @IBAction func USD(_ sender: Any) {
        valute = "USD"
        label1.change_text(text: "USD")
        label1.change_text2(text: "Доллар США")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "USD")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    
    @IBAction func JPY(_ sender: Any) {
        valute = "JPY"
        label1.change_text(text: "JPY")
        label1.change_text2(text: "Японская иена")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "JPY")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func EUR(_ sender: Any) {
        valute = "EUR"
        label1.change_text(text: "EUR")
        label1.change_text2(text: "Евро")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "EUR")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    
    @IBAction func AUD(_ sender: Any) {
        valute = "AUD"
        label1.change_text(text: "AUD")
        label1.change_text2(text: "Австралийский доллар")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "AUD")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func CAD(_ sender: Any) {
        valute = "CAD"
        label1.change_text(text: "CAD")
        label1.change_text2(text: "Канадский доллар")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "CAD")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func CHF(_ sender: Any) {
        valute = "CHF"
        label1.change_text(text: "CHF")
        label1.change_text2(text: "Швейцарский франк")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "CHF")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func CNY(_ sender: Any) {
        valute = "CNY"
        label1.change_text(text: "CNY")
        label1.change_text2(text: "Китайский юань")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "CNY")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func CZK(_ sender: Any) {
        valute = "CZK"
        label1.change_text(text: "CZK")
        label1.change_text2(text: "Чешская крона")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "CZK")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func GBP(_ sender: Any) {
        valute = "GBP"
        label1.change_text(text: "GBP")
        label1.change_text2(text: "Фунт стерлингов")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "GBP")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func NOK(_ sender: Any) {
        valute = "NOK"
        label1.change_text(text: "NOK")
        label1.change_text2(text: "Норвежская крона")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "NOK")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func SEK(_ sender: Any) {
        valute = "SEK"
        label1.change_text(text: "SEK")
        label1.change_text2(text: "Шведская крона")
        label_scroll.subviews.forEach({ $0.removeFromSuperview() })
        label_scroll.y = 0
        label1.change_image(text: "SEK")
        scroll.isHidden = true
        ViewController.defaults.set(valute, forKey: "valute")
        x.repeat_action()
        label_scroll.paste_all(all: AppDelegate.all)
    }
    @IBAction func plus(_ sender: Any) {
        scroll2.isHidden = false
    }
    
    /*@IBAction func add_rur(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
    }
    
    @IBAction func add_jpy(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    
    @IBAction func add_usd(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    
    @IBAction func add_eur(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    @IBAction func add_aud(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    @IBAction func add_cad(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    
    @IBAction func add_chf(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    
    @IBAction func add_cny(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    @IBAction func add_czk(_ sender: UIButton){
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    @IBAction func add_gbp(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    @IBAction func add_nok(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }
    
    @IBAction func add_sek(_ sender: UIButton) {
        scroll2.isHidden = true
        label_scroll.addlabel(val1: valute, name_val: sender.currentTitle!)
        h_scroll.constant += 100
        scroll.isHidden = true
    }*/
}
/*extension ViewController{
    override func encodeRestorableState(with coder: NSCoder) {
        coder.encode(valute, forKey: "val_name")
        super.encodeRestorableState(with: coder)
    }

    override func decodeRestorableState(with coder: NSCoder) {
        var id = coder.decodeObject(forKey: "val_name") as! String
        valute = id
        label1.change_text(text: id)
        label1.change_image(text: id)
    }
}*/

