//
//  label_main.swift
//  app1
//
//  Created by Кирилл on 07.06.2021.
//

import Foundation
import UIKit

class label_main: UILabel{
    
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
    var imageview: UIImageView
    var image = UIImage(named: "EUR")
   

    override init(frame: CGRect) {
        self.imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 62, height: 62))
        imageview.layer.cornerRadius = 17
        imageview.layer.masksToBounds = true
        imageview.image = image
        imageview.contentMode = .scaleAspectFill
        self.label = create_label(text: "EUR")
        self.label2 = create_label2(text: "Евро")
        super.init(frame: frame)
        self.addSubview(imageview)
    }
    required init?(coder: NSCoder) {
        let get_str = converter.ViewController.defaults.string(forKey: "valute")
        let my_text:String = get_str == nil ? "EUR" : get_str!
        imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 62, height: 62))
        imageview.layer.cornerRadius = 17
        imageview.layer.masksToBounds = true
        imageview.image = UIImage(named: my_text)
        imageview.contentMode = .scaleAspectFill
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
        imageview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.label)
        self.addSubview(self.label2)
        self.addSubview(imageview)
        let widthConstraint = NSLayoutConstraint(item: imageview, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 66)
        self.addConstraint(widthConstraint)
        imageview.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        imageview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        label2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        label2.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        label2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
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
        self.label.text = text
    }
    func change_text2(text: String)
    {
        self.label2.text = text
    }
    func change_image(text: String)
    {
        self.image = UIImage(named: text)
        imageview.image = image
    }
}


