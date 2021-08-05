//
//  AboutViewController.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 5.08.2021.
//

import UIKit

class AboutViewController: UIViewController {
    
    let aboutView : UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "heart"))

        icon.tintColor = .systemPink
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        
        return icon;
    }()
    
    let infoText : UITextView = {
       let text = UITextView(frame: CGRect(x: 20, y: 50, width: 250, height: 50))
        
        text.isEditable = false
        text.text = "YKS, TYT, ÖYT sınavları yerleştirme puanlarını ve üniversite sıralamalarını gösteren resmi olmayan bir uygulamadır."
        text.textContainer.maximumNumberOfLines = 0
        text.textAlignment = .center
        
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutView.frame.size.width = 100
        aboutView.frame.size.height = 100
        aboutView.center = self.view.center
        
        infoText.center = self.view.center
        infoText.textColor = UIColor.blue
        infoText.backgroundColor = UIColor.lightGray

        view.addSubview(aboutView)
        view.addSubview(infoText)
        
    }
    
    
}
