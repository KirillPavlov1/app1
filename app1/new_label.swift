//
//  new_label.swift
//  app1
//
//  Created by Кирилл on 07.05.2021.
//

import Foundation
import UIKit


class new_label: UILabel{

    override init(frame: CGRect) {
        self.y = 0
        super.init(frame: frame)
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
        return(all)
    }
    
    var main_valute: String = ""
        
    required init?(coder: NSCoder) {
        self.y = 0
        super.init(coder: coder)
        paste_all(all: AppDelegate.all)
    }
    
    public var y : Int
    private var connect = ViewController()
    
    public func paste_all(all: all_valutes)
    {
        addlabel(val1: main_valute, name_val: "Российский рубль RUB", all: all)
        addlabel(val1: main_valute, name_val: "Доллар США USD", all: all)
        addlabel(val1: main_valute, name_val: "Евро EUR", all: all)
        addlabel(val1: main_valute, name_val: "Австралийский доллар AUD", all: all)
        addlabel(val1: main_valute, name_val: "Канадский доллар CAD", all: all)
        addlabel(val1: main_valute, name_val: "Швейцарский франк CHF", all: all)
        addlabel(val1: main_valute, name_val: "Китайский юань CNY", all: all)
        addlabel(val1: main_valute, name_val: "Чешская крона CZK", all: all)
        addlabel(val1: main_valute, name_val: "Фунт стерлингов GBP", all: all)
        addlabel(val1: main_valute, name_val: "Норвежская крона NOK", all: all)
        addlabel(val1: main_valute, name_val: "Шведская крона SEK", all: all)
    }

    public func addlabel(val1: String, name_val: String, all: all_valutes)
    {
        let label = UILabel(frame: CGRect(x: 0, y: y, width: 366, height: 72))
        let s_name = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        let l_name = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        let array = name_val.components(separatedBy: " ")
        
        label.backgroundColor = UIColor(red: 0.137, green: 0.094, blue: 0.333, alpha: 1)
        label.layer.cornerRadius = 14
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(y)).isActive = true
        let heightConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 78)
        self.addConstraint(heightConstraint)
        s_name.font = UIFont(name: "SFUIText-Bold", size: 20)
        l_name.font = UIFont(name: "SFUIText-Light", size: 17)
        s_name.text = array[array.count - 1]
        s_name.textColor = .white
        s_name.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(400))
        s_name.translatesAutoresizingMaskIntoConstraints = false
        label.addSubview(s_name)
        var text: String = ""
        for i in 0 ... array.count - 2 {
            text = text + array[i] + " "
        }
        l_name.text = text
        l_name.textColor = .white
        l_name.translatesAutoresizingMaskIntoConstraints = false
        label.addSubview(l_name)
        let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 62, height: 62))
        let image = UIImage(named: array[array.count - 1])
        imageview.layer.cornerRadius = 17
        imageview.layer.masksToBounds = true
        imageview.image = image
        imageview.contentMode = .scaleAspectFill
        imageview.translatesAutoresizingMaskIntoConstraints = false
        label.addSubview(imageview)
        imageview.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 15).isActive = true
        imageview.topAnchor.constraint(equalTo: label.topAnchor, constant: 7).isActive = true
        let heightConstraint2 = NSLayoutConstraint(item: imageview, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 62)
        self.addConstraint(heightConstraint2)
        let widthConstraint2 = NSLayoutConstraint(item: imageview, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 62)
        self.addConstraint(widthConstraint2)
        s_name.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 30).isActive = true
        s_name.topAnchor.constraint(equalTo: label.topAnchor, constant: 18).isActive = true
        l_name.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 30).isActive = true
        l_name.topAnchor.constraint(equalTo: label.topAnchor, constant: 40).isActive = true
        l_name.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -90).isActive = true
        l_name.topAnchor.constraint(equalTo: label.topAnchor, constant: 40).isActive = true
        l_name.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -90).isActive = true
        var str :String = ""
        if (name_val == "Российский рубль RUB")
        {
            str = String(round((Double(all.RUB) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Доллар США USD")
        {
            str = String(round((Double(all.USD) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Евро EUR")
        {
            str = String(round((Double(all.EUR) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Австралийский доллар AUD")
        {
            str = String(round((Double(all.AUD) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Канадский доллар CAD")
        {
            str = String(round((Double(all.CAD) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Швейцарский франк CHF")
        {
            str = String(round((Double(all.CHF) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Китайский юань CNY")
        {
            str = String(round((Double(all.CNY) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Чешская крона CZK")
        {
            str = String(round((Double(all.CZK) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Фунт стерлингов GBP")
        {
            str = String(round((Double(all.GBP) ?? 0 ) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Норвежская крона NOK")
        {
            str = String(round((Double(all.NOK) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Шведская крона SEK")
        {
            str = String(round((Double(all.SEK) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        if (name_val == "Японская иена JPY")
        {
            str = String(round((Double(all.JPY) ?? 0) * 100) / 100)
            if (Double(str) == 0)
            {
                str = ""
            }
        }
        let val = UILabel()
        val.textColor = .white
        val.font = UIFont(name: "SFUIText-Bold", size: 20)
        val.text = str
        val.translatesAutoresizingMaskIntoConstraints = false
        val.adjustsFontSizeToFitWidth = true
        val.minimumScaleFactor = 0.2
        label.addSubview(val)
        val.topAnchor.constraint(equalTo: label.topAnchor, constant: 5).isActive = true
        val.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: -5).isActive = true
        val.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -5).isActive = true
        y = y + 100
    }
}
