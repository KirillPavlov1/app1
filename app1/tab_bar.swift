//
//  tab_bar.swift
//  app1
//
//  Created by Кирилл on 14.06.2021.
//

import Foundation
import UIKit

class tab_bar: UITabBarController{
    override func viewDidLoad() {
        //tabBar.backgroundImage =
        let navbarImage = UIImage(named: "menu")!.stretchableImage(withLeftCapWidth: 1, topCapHeight: 1)
        let width = UIScreen.main.bounds.size.width
        let height = self.tabBar.frame.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = navbarImage
        imageViewBackground.contentMode = UIImageView.ContentMode.scaleAspectFill
        //tabBar.isOpaque = true
        tabBar.addSubview(imageViewBackground)
        imageViewBackground.leadingAnchor.constraint(equalTo: self.tabBar.leadingAnchor).isActive = true
        imageViewBackground.trailingAnchor.constraint(equalTo: self.tabBar.trailingAnchor).isActive = true
        //imageViewBackground.centerYAnchor.constraint(equalTo: self.tabBar.centerYAnchor).isActive = true
       // tabBar.backgroundImage.le = navbarImage
    }
}
