//
//  Settings_1.swift
//  app1
//
//  Created by Кирилл on 10.06.2021.
//

import Foundation
import UIKit

class settings: UIViewController {
    @IBOutlet weak var convertor: UIButton!
    @IBOutlet weak var courses: UIButton!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var rek_button: UIButton!
    @IBOutlet weak var accuracy: UISegmentedControl!
    
    @IBOutlet weak var reklama: GradientView_Button!
    
    @IBAction func set_acc(_ sender: UISegmentedControl) {
        convert.GlobalVariable.acc = sender.titleForSegment(at: sender.selectedSegmentIndex)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accuracy.selectedSegmentIndex = Int(convert.GlobalVariable.acc) ?? 0
        settings.imageEdgeInsets = UIEdgeInsets(top: 4, left: 3, bottom: 4, right: 3)
        convertor.layer.cornerRadius = 0.5 * convertor.bounds.size.width
        convertor.imageEdgeInsets = UIEdgeInsets(top: -28, left: -42, bottom: -58, right: -42)
        view2.layer.backgroundColor =  UIColor(red: 0.078, green: 0.051, blue: 0.212, alpha: 1).cgColor
        courses.imageEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        reklama.layer.cornerRadius = 14
        reklama.layer.masksToBounds = true
        rek_button.imageEdgeInsets = UIEdgeInsets(top: -7, left: -9, bottom: -18, right: -9)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
              accuracy.setTitleTextAttributes(titleTextAttributes, for:.normal)

              let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
              accuracy.setTitleTextAttributes(titleTextAttributes1, for:.selected)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
