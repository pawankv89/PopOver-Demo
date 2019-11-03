//
//  ViewController.swift
//  PopOver Demo
//
//  Created by Pawan kumar on 31/10/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, ColorPickerListDelegate {
   

    @IBOutlet weak var popOverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func popOverButtonTap(_ sender: UIButton) {
        
         let selectCellSourceRect = sender.bounds
         let popover = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ColorPickerList") as! ColorPickerList
         popover.delegate = self
        //popover.selectedVideoTitle = "Color Picker"
         popover.modalPresentationStyle = .popover
         popover.popoverPresentationController?.backgroundColor = UIColor(red: 0.93, green: 0.98, blue: 0.93, alpha: 1.00)
        popover.popoverPresentationController?.delegate = self
         popover.popoverPresentationController?.sourceView = sender
         popover.popoverPresentationController?.sourceRect = selectCellSourceRect
         popover.popoverPresentationController?.permittedArrowDirections = .any
         popover.preferredContentSize = CGSize.init(width: 250, height: 300)
         self.present(popover, animated: true, completion: nil)
         
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func handleTapColorPickerListItem(_ sender: ColorPickerList, color: UIColor) {
        self.popOverButton.backgroundColor = color
    }
       
}

