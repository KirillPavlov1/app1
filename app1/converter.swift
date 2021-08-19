//
//  converter.swift
//  app1
//
//  Created by Кирилл on 29.05.2021.
//

import UIKit

class convert: UIViewController{
    
   
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var width_label: NSLayoutConstraint!
    @IBOutlet weak var Button2: label2_convertor!
    @IBOutlet weak var courses: UIButton!
    
    @IBAction func update_label(_ sender: UIButton) {
        if (sender.tag == 10)
        {
            
            if (self.x.contains("."))
            {
                return
            }
            label_1.text = label_1.text! + ","
            self.x = self.x + "."
            self.money = Double(self.x)!
            return
        }
        if (sender.tag == 11)
        {
            label_1.text = "0"
            self.x = "0"
            self.money = 0
            width_label.constant = 93
            Button2.label_converted.text = "0"
            Button2.width = 100
            if let constraint = (Button2.contentView.constraints.filter{$0.firstAttribute == .width}.first) {
                constraint.constant = CGFloat(Button2.width)
                    }
            return
        }
        if (self.money != 0)
        {
            label_1.text = label_1.text! + String(sender.tag)
            self.x = self.x + String(sender.tag)
            self.money = Double(self.x)!
            width_label.constant += 10
            converter_string = count_value(count: money)
            Button2.label_converted.text = converter_string.replacingOccurrences(of: ".", with: ",")
            Button2.width = Float(converter_string.count) * 10 + 100
            if let constraint = (Button2.contentView.constraints.filter{$0.firstAttribute == .width}.first) {
                constraint.constant = CGFloat(Button2.width)
                    }
        }
        else
        {
            var s:String
            s = label_1.text!
            if (s.last != ",")
            {
                label_1.text = String(sender.tag)
                self.x = self.x + String(sender.tag)
                self.money = Double(self.x)!
                converter_string = count_value(count: money)
                Button2.label_converted.text = converter_string.replacingOccurrences(of: ".", with: ",")
                Button2.width = Float(converter_string.count) * 10 + 100
                if let constraint = (Button2.contentView.constraints.filter{$0.firstAttribute == .width}.first) {
                    constraint.constant = CGFloat(Button2.width)
                        }
                return
            }
            label_1.text =  label_1.text! + String(sender.tag)
            self.x = self.x + String(sender.tag)
            self.money = Double(self.x)!
            width_label.constant += 10
            converter_string = count_value(count: money)
            Button2.label_converted.text = converter_string.replacingOccurrences(of: ".", with: ",")
            Button2.width = Float(converter_string.count) * 10 + 100
            if let constraint = (Button2.contentView.constraints.filter{$0.firstAttribute == .width}.first) {
                constraint.constant = CGFloat(Button2.width)
                    }
        }
            
    }
    @IBOutlet var back_button: UIButton!
    @IBOutlet var delete_digit: UIButton!
    @IBOutlet var convertor: UIButton!
    @IBOutlet var buttons_digits: [UIButton]!
    @IBOutlet var but7: UIButton!
    @IBOutlet var but8: UIButton!
    @IBOutlet var but9: UIButton!
    @IBOutlet var but4: UIButton!
    @IBOutlet var but5: UIButton!
    @IBOutlet var but6: UIButton!
    @IBOutlet var but1: UIButton!
    @IBOutlet var but2: UIButton!
    @IBOutlet var but3: UIButton!
    @IBOutlet var but0: UIButton!
    @IBOutlet var but_zap: UIButton!
    @IBOutlet var button_1: label_convertor!
    @IBOutlet var button_2: label2_convertor!
    @IBOutlet var flag1: UIImageView!
    @IBOutlet var flag2: UIImageView!
    @IBOutlet var Scroll1: UIScrollView!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var Scroll2: UIScrollView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet var scroll_vals: [UIButton]!
    
    @IBOutlet weak var l_name2: UILabel!
    @IBOutlet weak var s_name2: UILabel!
    @IBOutlet weak var l_name: UILabel!
    @IBOutlet weak var s_name: UILabel!
    var money:Double = 0
    var x:String = "0"
    var valute1:String = "EUR"
    var valute2:String = "NOK"
    struct GlobalVariable{
        static var acc:String = "1"
    }
    var blockOperation = BlockOperation {}
    let queue = OperationQueue()
    var converter_string:String = ""
    static let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pencolor = UIColor(red: 0.145, green: 0.102, blue: 0.358, alpha: 1)
        back_button.layer.backgroundColor = pencolor.cgColor
        back_button.layer.shadowColor = UIColor(red: 0.32, green: 0, blue: 1, alpha: 0.11).cgColor
        back_button.layer.shadowRadius = 20
        back_button.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        settings.imageEdgeInsets = UIEdgeInsets(top: 4, left: 3, bottom: 4, right: 3)
        view2.backgroundColor = UIColor(red: 0.078, green: 0.051, blue: 0.212, alpha: 1)
        convertor.layer.cornerRadius = 0.5 * convertor.bounds.size.width
        convertor.imageEdgeInsets = UIEdgeInsets(top: -28, left: -42, bottom: -58, right: -42)
        delete_digit.imageEdgeInsets = UIEdgeInsets(top: -5, left: -23, bottom: -20, right: -25)
        courses.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let imageName = "krestik"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        buttons_digits.forEach({$0.layer.backgroundColor = UIColor(red: 0.14, green: 0.09, blue: 0.33, alpha: 1).cgColor})
        buttons_digits.forEach({$0.layer.cornerRadius = 4})
        buttons_digits.forEach({$0.setTitleColor(.white, for: .normal)})
        button_1.layer.cornerRadius = 14
       button_1.layer.masksToBounds = true
        button_2.layer.cornerRadius = 14
       button_2.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        delete_digit.addSubview(imageView)
        NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: delete_digit, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
           NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: delete_digit, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        button_2.layer.backgroundColor = UIColor(red: 0.137, green: 0.094, blue: 0.333, alpha: 1).cgColor
        let get_str = convert.defaults.string(forKey: "valute1")
        let my_text:String = get_str == nil ? "EUR" : get_str!
        let get_str2 = convert.defaults.string(forKey: "valute2")
        let my_text2:String = get_str2 == nil ? "NOK" : get_str2!
        self.valute1 = my_text
        self.valute2 = my_text2
        flag1.image = UIImage(named: my_text)
        flag2.image = UIImage(named: my_text2)
        flag1.layer.cornerRadius = 17
        flag2.layer.cornerRadius = 17
        let gesture = UITapGestureRecognizer(target: self, action: #selector(someAction))
        view.addGestureRecognizer(gesture)
        scroll_vals.forEach({$0.layer.cornerRadius = 10})
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @objc func someAction()
    {
        Scroll1.isHidden = true
        Scroll2.isHidden = true
    }
    func x(val: String){
        self.s_name.text = val
    }
    func update_cost(){
        converter_string = count_value(count: money)
        Button2.label_converted.text = converter_string.replacingOccurrences(of: ".", with: ",")
    }
    var App = AppDelegate()
    @IBAction func add_rur(_ sender: Any) {
        self.valute1 = "RUB"
        self.flag1.image = UIImage(named: self.valute1)
        button_1.change_text(text: "RUB")
        button_1.change_text2(text: "Российский рубль")
        Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_jpy(_ sender: Any) {
        self.valute1 = "JPY"
            self.flag1.image = UIImage(named: self.valute1)
        Scroll1.isHidden = true
        button_1.change_text(text: "JPY")
        button_1.change_text2(text: "Японская иена")
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_usd(_ sender: UIButton) {
        
        self.valute1 = "USD"
        self.flag1.image = UIImage(named: self.valute1)
        button_1.change_text(text: "USD")
        button_1.change_text2(text: "Американский доллар")
        Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_eur(_ sender: UIButton) {
        self.valute1 = "EUR"
            self.flag1.image = UIImage(named: self.valute1)
        button_1.change_text(text: "EUR")
        button_1.change_text2(text: "Евро")
        Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }

    @IBAction func add_aud(_ sender: UIButton) {
        self.valute1 = "AUD"
        self.flag1.image = UIImage(named: self.valute1)
        button_1.change_text(text: "AUD")
        button_1.change_text2(text: "Австралийский доллар")
        Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }

    @IBAction func add_cad(_ sender: UIButton) {
        self.valute1 = "CAD"
            self.flag1.image = UIImage(named: self.valute1)
        button_1.change_text(text: "CAD")
        button_1.change_text2(text: "Канадский доллар")
            Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_chf(_ sender: UIButton) {
        self.valute1 = "CHF"
        self.flag1.image = UIImage(named: self.valute1)
        button_1.change_text(text: "CHF")
        button_1.change_text2(text: "Швейцарский франк")
        Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_cny(_ sender: UIButton) {
        self.valute1 = "CNY"
        flag1.image = UIImage(named: valute1)
        button_1.change_text(text: "CNY")
        button_1.change_text2(text: "Китайский юань")
        Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    @IBAction func add_czk(_ sender: UIButton){
        self.valute1 = "CZK"
        flag1.image = UIImage(named: valute1)
        button_1.change_text(text: "CZK")
        button_1.change_text2(text: "Чешская крона")
        Scroll1.isHidden = true
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()

    }
    @IBAction func add_gbp(_ sender: UIButton) {
        Scroll1.isHidden = true
        self.valute1 = "GBP"
        flag1.image = UIImage(named: valute1)
        button_1.change_text(text: "GBP")
        button_1.change_text2(text: "Фунт стерлингов")
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    @IBAction func add_nok(_ sender: UIButton) {
        self.valute1 = "NOK"
        flag1.image = UIImage(named: valute1)
        Scroll1.isHidden = true
        button_1.change_text(text: "NOK")
        button_1.change_text2(text: "Норвежская крона")
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_sek(_ sender: UIButton) {
        self.valute1 = "SEK"
        flag1.image = UIImage(named: valute1)
        Scroll1.isHidden = true
        button_1.change_text2(text: "Шведская крона")
        button_1.change_text(text: "SEK")
        convert.defaults.set(valute1, forKey: "valute1")
        App.replace_valutes()
        update_cost()

    }
    @IBAction func inst_valute1(_ sender: Any) {
        Scroll1.isHidden = false
    }
    
    @IBAction func add_rur2(_ sender: UIButton) {
        self.valute2 = "RUB"
        self.flag2.image = UIImage(named: self.valute2)
        button_2.change_text(text: "RUB")
        button_2.change_text2(text: "Российский рубль")
        Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_jpy2(_ sender: UIButton) {
        self.valute2 = "JPY"
        self.flag2.image = UIImage(named: self.valute2)
        button_2.change_text(text: "JPY")
        button_2.change_text2(text: "Японская иена")
        Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_usd2(_ sender: UIButton) {
        self.valute2 = "USD"
        self.flag2.image = UIImage(named: self.valute2)
        button_2.change_text(text: "USD")
        button_2.change_text2(text: "Американский доллар")
        Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_eur2(_ sender: UIButton) {
        self.valute2 = "EUR"
        self.flag2.image = UIImage(named: self.valute2)
        button_2.change_text(text: "EUR")
        button_2.change_text2(text: "Евро")
        Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    @IBAction func add_aud2(_ sender: UIButton) {
        self.valute2 = "AUD"
        self.flag2.image = UIImage(named: self.valute2)
        button_2.change_text(text: "AUD")
        button_2.change_text2(text: "Австралийский доллар")
        Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    @IBAction func add_cad2(_ sender: UIButton) {
        self.valute2 = "CAD"
            self.flag2.image = UIImage(named: self.valute2)
        button_2.change_text(text: "CAD")
        button_2.change_text2(text: "Канадский доллар")
            Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_chf2(_ sender: UIButton) {
        self.valute2 = "CHF"
        self.flag2.image = UIImage(named: self.valute2)
        button_2.change_text(text: "CHF")
        button_2.change_text2(text: "Швейцарский франк")
            Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_cny2(_ sender: UIButton) {
        self.valute2 = "CNY"
        flag2.image = UIImage(named: valute2)
        button_2.change_text(text: "CNY")
        button_2.change_text2(text: "Китайский юань")
        Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    @IBAction func add_czk2(_ sender: UIButton){
        self.valute2 = "CZK"
        flag2.image = UIImage(named: valute2)
        button_2.change_text(text: "CZK")
        button_2.change_text2(text: "Чешская крона")
        Scroll2.isHidden = true
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    @IBAction func add_gbp2(_ sender: UIButton){
        Scroll2.isHidden = true
        self.valute2 = "GBP"
        flag2.image = UIImage(named: valute2)
        button_2.change_text(text: "GBP")
        button_2.change_text2(text: "Фунт стерлингов")
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    @IBAction func add_nok2(_ sender: UIButton) {
        self.valute2 = "NOK"
        flag2.image = UIImage(named: valute2)
        Scroll2.isHidden = true
        button_2.change_text(text: "NOK")
        button_2.change_text2(text: "Норвежская крона")
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()
    }
    
    @IBAction func add_sek2(_ sender: UIButton) {
        self.valute2 = "SEK"
        flag2.image = UIImage(named: valute2)
        Scroll2.isHidden = true
        button_2.change_text2(text: "Шведская крона")
        button_2.change_text(text: "SEK")
        convert.defaults.set(valute2, forKey: "valute2")
        App.replace_valutes()
        update_cost()

    }
    @IBAction func inst_valute_1(_ sender: Any) {
        Scroll1.isHidden = false
    }
    @IBAction func inst_valute_2(_ sender: Any) {
        Scroll2.isHidden = false
    }
    @IBAction func go_to_main(_ sender: Any) {
    }
    
}
