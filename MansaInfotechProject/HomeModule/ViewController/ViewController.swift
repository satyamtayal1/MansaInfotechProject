//  ViewController.swift
//  MansaInfotechProject
//  Created by satyam Tayal on 08/04/23.

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var tblLeftView: UITableView!
    @IBOutlet weak var tblRightView: UITableView!
    
    var arrLeft : [HomeModel] = []
    var arrRight : [HomeModel] = []
    
    //MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLeftArray()
    }
    
    //MARK: - Default Array setup for initial begning stage for Left side
    func setupLeftArray()
    {
        arrLeft.append(HomeModel(id: 0, title: "A", value: 0))
        arrLeft.append(HomeModel(id: 1, title: "B", value: 0))
        arrLeft.append(HomeModel(id: 2, title: "C", value: 0))
        arrLeft.append(HomeModel(id: 3, title: "D", value: 0))
        arrLeft.append(HomeModel(id: 4, title: "E", value: 0))
        arrLeft.append(HomeModel(id: 5, title: "F", value: 0))
        arrLeft.append(HomeModel(id: 6, title: "G", value: 0))
        arrLeft.append(HomeModel(id: 7, title: "H", value: 0))
        arrLeft.append(HomeModel(id: 8, title: "I", value: 0))
        arrLeft.append(HomeModel(id: 9, title: "J", value: 0))
        
        tblLeftView.reloadData()
    }
    
    //MARK: - Button Right Move Clicked
    @IBAction func btnMoveRightButtonClicked(_ sender: UIButton)
    {
        for (index, var itm) in arrLeft.enumerated().reversed()
        {
            if itm.selected == true
            {
                itm.selected = false
                arrRight.append(itm)
                arrLeft.remove(at: index)
            }
        }
        
        tblLeftView.reloadData()
        tblRightView.reloadData()
    }
    
    //MARK: - Button Left Move Clicked
    @IBAction func btnMoveLeftButtonClicked(_ sender: UIButton)
    {
        for (index, var itm) in arrRight.enumerated().reversed()
        {
            if itm.selected == true
            {
                itm.selected = false
                arrLeft.append(itm)
                arrRight.remove(at: index)
            }
        }
        
        tblLeftView.reloadData()
        tblRightView.reloadData()
    }
}

//MARK: - Table View Delegates
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblLeftView{
            return arrLeft.count
        }
        else{
            return arrRight.count
        }
    }
    
    //MARK: - Cell For Row to Display Items and basic seeting for buttons(Plus and Minus) and tag id setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTblCell", for: indexPath) as! HomeTblCell
        
        if tableView == tblLeftView{
            cell.lblTitle.text = (arrLeft[indexPath.row]).title ?? ""
            cell.lblValue.text = String((arrLeft[indexPath.row]).value ?? 0)
            
            cell.btnPlus?.tag = ((arrLeft[indexPath.row]).id ?? 0)
            cell.btnPlus?.addTarget(self, action: #selector(btnPlusClicked(_:)), for: .touchUpInside)
            
            cell.btnMinus?.tag = ((arrLeft[indexPath.row]).id ?? 0)
            cell.btnMinus?.addTarget(self, action: #selector(btnMinusClicked(_:)), for: .touchUpInside)
            
            if (arrLeft[indexPath.row]).selected == false
            {
                cell.backgroundColor = .black
            }
            else
            {
                cell.backgroundColor = .gray
            }
        }
        else{
            cell.lblTitle.text = (arrRight[indexPath.row]).title ?? ""
            cell.lblValue.text = String((arrRight[indexPath.row]).value ?? 0)
            
            cell.btnPlus?.tag = ((arrRight[indexPath.row]).id  ?? 0)
            cell.btnPlus?.addTarget(self, action: #selector(btnRightPlusClicked(_:)), for: .touchUpInside)
            
            cell.btnMinus?.tag = ((arrRight[indexPath.row]).id ?? 0)
            cell.btnMinus?.addTarget(self, action: #selector(btnRightMinusClicked(_:)), for: .touchUpInside)
            
            if (arrRight[indexPath.row]).selected == false
            {
                cell.backgroundColor = .black
            }
            else
            {
                cell.backgroundColor = .gray
            }
        }
        
        return cell
    }
    
    //MARK: - Button Plus Clicked and on that value increases on it's id bases for LEFT SIDE
    @objc func btnPlusClicked(_ sender: UIButton)
    {
        for (index, var itm) in arrLeft.enumerated()
        {
            if itm.id == sender.tag
            {
                itm.value! += 1
                arrLeft.remove(at: index)
                arrLeft.insert(itm, at: index)
                tblLeftView.reloadData()
                break;
            }
        }
    }
    
    //MARK: - Button Minus Clicked and on that value decreses on it's id bases for LEFT SIDE
    @objc func btnMinusClicked(_ sender: UIButton)
    {
        for (index, var itm) in arrLeft.enumerated()
        {
            if itm.id == sender.tag
            {
                itm.value! -= 1
                arrLeft.remove(at: index)
                arrLeft.insert(itm, at: index)
                tblLeftView.reloadData()
                break;
            }
        }
    }
    
    //MARK: - Button Plus Clicked and on that value increases on it's id bases for RIGHT SIDE
    @objc func btnRightPlusClicked(_ sender: UIButton)
    {
        for (index, var itm) in arrRight.enumerated()
        {
            if itm.id == sender.tag
            {
                itm.value! += 1
                arrRight.remove(at: index)
                arrRight.insert(itm, at: index)
                tblRightView.reloadData()
                break;
            }
        }
    }
    
    //MARK: - Button Minus Clicked and on that value decreses on it's id bases for RIGHT SIDE
    @objc func btnRightMinusClicked(_ sender: UIButton)
    {
        for (index, var itm) in arrRight.enumerated()
        {
            if itm.id == sender.tag
            {
                itm.value! -= 1
                arrRight.remove(at: index)
                arrRight.insert(itm, at: index)
                tblRightView.reloadData()
                break;
            }
        }
    }
    
    //MARK: - Tableview did select method called and selected values changes from initial value
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == tblLeftView
        {
            if (arrLeft[indexPath.row]).selected == false
            {
                (arrLeft[indexPath.row]).selected = true
            }
            else
            {
                (arrLeft[indexPath.row]).selected = false
            }
        }
        else
        {
            if (arrRight[indexPath.row]).selected == false
            {
                (arrRight[indexPath.row]).selected = true
            }
            else
            {
                (arrRight[indexPath.row]).selected = false
            }
        }
        
        tableView.reloadData()
    }
    
    //MARK: - Dynamic height setup for cells on screen height bases
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tblLeftView.frame.size.height / 10
    }
}
