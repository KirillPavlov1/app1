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
    
    required init?(coder: NSCoder) {
        self.y = 0
        super.init(coder: coder)
    }
    public var y : Int
    private var connect = ViewController()
  
    func printInt(atAddress p: UnsafePointer<UILabel>) {
    }
    public func addlabel(val1: String, name_val: String)
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
        let str :String = find_quotes(val1: val1, val2: s_name.text!)
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
