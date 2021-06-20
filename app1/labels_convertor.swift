//
//  labels_convertor.swift
//  app1
//
//  Created by Кирилл on 31.05.2021.
//

import Foundation
import UIKit

class label2_convertor: UIButton{
    var label:UILabel
    var label2:UILabel
    public let contentView = UIView()
    public let label_converted = UILabel()
    public var width:Float = 100
    public var widthConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        self.label = create_label(text: "NOK")
        self.label2 = create_label2(text: "Норвежская крона")
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        let get_str = converter.convert.defaults.string(forKey: "valute2")
        let my_text:String =  get_str == nil ? "NOK" :  get_str!
        var label_text:String
        switch my_text {
        case "EUR":
            label_text = "Евро"
        case "RUB":
            label_text = "Российский рубль"
        case "USD":
            label_text = "Доллар США"
        case "AUD":
            label_text = "Австралийский доллар"
        case "CAD":
            label_text = "Канадский доллар"
        case "CHF":
            label_text = "Швейцарский франк"
        case "CNY":
            label_text = "Китайский юань"
        case "CZK":
            label_text = "Чешская крона"
        case "GBP":
            label_text = "Фунт стерлингов"
        case "NOK":
            label_text = "Норвежская крона"
        case "SEK":
            label_text = "Шведская крона"
        case "JPY":
            label_text = "Японская иена"
        default:
            label_text = ""
        }
        self.label = create_label(text: my_text)
        self.label2 = create_label2(text: label_text)
        super.init(coder: coder)
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.label)
        self.addSubview(self.label2)
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        label2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        label2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        label2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
   
        self.widthConstraint =  NSLayoutConstraint(item: scrollView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: CGFloat(width))
        self.widthConstraint!.isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        NSLayoutConstraint(item: contentView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: CGFloat(width)).isActive = true
        label_converted.translatesAutoresizingMaskIntoConstraints = false
        label_converted.textColor = .white
        label_converted.font = UIFont(name: "SFUIText-Bold", size: 21)
        label_converted.text = "0"
        contentView.addSubview(label_converted)
        label_converted.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label_converted.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label_converted.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        label_converted.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    func change_text(text: String)
    {
        self.label.text = text
    }
    func change_text2(text: String)
    {
        self.label2.text = text
    }
}

class label_convertor: UIButton{
    
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing

        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1.0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottom:
                return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing:
                return CGPoint(x: 1.0, y: 0.0)
            case .trailing:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    
    private var startColor = UIColor(red: 0.22, green: 0.15, blue: 0.57, alpha: 1.0).cgColor
    
    private var medColor = UIColor(red: 0.17, green: 0.13, blue: 0.37, alpha: 1.0).cgColor

    
    private var endColor = UIColor(red: 0.14, green: 0.11, blue: 0.31, alpha: 1.0).cgColor
    
    private let gradientLayer = CAGradientLayer()
    
    var label:UILabel
    var label2:UILabel

    override init(frame: CGRect) {
        self.label = create_label(text: "EUR")
        self.label2 = create_label2(text: "Евро")
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        let get_str = converter.convert.defaults.string(forKey: "valute1")
        let my_text:String = get_str == nil ? "EUR" : get_str!
        self.label = create_label(text: my_text)
        var label_text:String
        switch my_text {
        case "EUR":
            label_text = "Евро"
        case "RUB":
            label_text = "Российский рубль"
        case "USD":
            label_text = "Доллар США"
        case "AUD":
            label_text = "Австралийский доллар"
        case "CAD":
            label_text = "Канадский доллар"
        case "CHF":
            label_text = "Швейцарский франк"
        case "CNY":
            label_text = "Китайский юань"
        case "CZK":
            label_text = "Чешская крона"
        case "GBP":
            label_text = "Фунт стерлингов"
        case "NOK":
            label_text = "Норвежская крона"
        case "SEK":
            label_text = "Шведская крона"
        case "JPY":
            label_text = "Японская иена"
        default:
            label_text = ""
        }
        self.label2 = create_label2(text: label_text)
        super.init(coder: coder)
        setupGradient()
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.label)
        self.addSubview(self.label2)
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        label2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        label2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        label2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
        gradientLayer.locations = [0,0.57,1]
    }
    
    private func setupGradientColors() {
            gradientLayer.colors = [startColor, medColor, endColor]
    }
    func change_text(text: String)
    {
        label.text = text
    }
    func change_text2(text: String)
    {
        label2.text = text
    }
}

func  create_label(text: String) -> UILabel{
    let x =  UILabel(frame: CGRect(x: 0, y: 0, width: 366, height: 72))
    x.textAlignment = .left
    x.text = text
    x.font = UIFont(name: "SFUIText-Bold", size: 17)
    x.textColor = .white
    return (x)
}
func  create_label2(text: String) -> UILabel{
 
    let x =  UILabel(frame: CGRect(x: 0, y: 0, width: 366, height: 72))
    x.textAlignment = .left
    x.text = text
    x.font = UIFont(name: "SFUIText-Light", size: 14)
    x.textColor = .white
    return (x)
}
