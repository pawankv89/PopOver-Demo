//
//  ColorPickerList.swift
//  PopOver Demo
//
//  Created by Pawan kumar on 31/10/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

protocol ColorPickerListDelegate: class {
    
     func handleTapColorPickerListItem(_ sender: ColorPickerList, color: UIColor)
}

struct colorItem {
    var name: String
    var color: UIColor
}

class ColorPickerList: UITableViewController {
    
   weak var delegate: ColorPickerListDelegate?
    
    var cell: UITableViewCell!
    var selectedMusicVideo = String()
    
    var colorList = [colorItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Common Colors
       
        colorList.append(colorItem.init(name: "Yellow Color", color: UIColor.yellow))
        colorList.append(colorItem.init(name: "Green Color", color: UIColor.green))
        colorList.append(colorItem.init(name: "Red Color", color: UIColor.red))
        colorList.append(colorItem.init(name: "Blue Color", color: UIColor.blue))
        colorList.append(colorItem.init(name: "Light Gray Color", color: UIColor.lightGray))
        colorList.append(colorItem.init(name: "Gray Color", color: UIColor.gray))
        colorList.append(colorItem.init(name: "Dark Gray Color", color: UIColor.darkGray))
        colorList.append(colorItem.init(name: "Black Color", color: UIColor.black))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Circle Of View With Border Color
    func circleOfViewWithBorderColor(view: UIView, borderColor: UIColor) -> Void {
        
        view.layer.borderWidth = 1
        view.layer.cornerRadius = view.frame.size.height/2
        view.layer.borderColor = borderColor.cgColor
    }
    
    func imageViewTintColor(imageView: UIImageView, color: UIColor) -> Void {
           
           if imageView.image != nil {
               imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
               imageView.tintColor = color
           }
       }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return colorList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier : String = "ColorPickerListCell"
         // Create a reusable cell
        var cell: ColorPickerListCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ColorPickerListCell
       
        if (cell == nil)
        {
            let nib: Array = Bundle.main.loadNibNamed("ColorPickerListCell", owner: self, options: nil)!
            cell = nib[0] as? ColorPickerListCell
        }
        
        // Configure the reusable cell
        cell?.colorImageView.image = UIImage(named: "colorCell")
    
        self.circleOfViewWithBorderColor(view: cell!.colorImageView, borderColor: UIColor.lightGray)

        self.imageViewTintColor(imageView: cell!.colorImageView, color: colorList[indexPath.row].color)
        
        cell!.colorLabel.text = colorList[indexPath.row].name

        // Set the selected cell's background to a light mint green color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red:0.93, green:0.98, blue:0.93, alpha:1.00)
        cell!.selectedBackgroundView = bgColorView

        // Return the configured cell
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.didselectCell(tableView: tableView, indexPath: indexPath)
    }
    
    func didselectCell(tableView: UITableView, indexPath: IndexPath) -> () {
        
        delegate?.handleTapColorPickerListItem(self, color: colorList[indexPath.row].color)
        
        self.dismiss(animated: true, completion: nil)
    }
}
