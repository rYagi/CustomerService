//
//  ViewController.swift
//  test0626
//
//  Created by 八木亮輔 on 2021/06/26.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var tell_number: UITextField!
    @IBOutlet weak var form: UITextField!
    @IBOutlet weak var inqury: UITextView!
    @IBOutlet weak var Verification: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 枠のカラー
        let color = UIColor(red: 186/255, green: 186/255, blue: 186/255, alpha: 1.0).cgColor
        inqury.layer.borderColor = color;
        
        // 枠の幅
        inqury.layer.borderWidth = 0.5
        
        // 枠を角丸にする
        inqury.layer.cornerRadius = 5.0
        inqury.layer.masksToBounds = true
                        
        self.name.delegate = self
        self.tell_number.delegate = self
        self.tell_number.keyboardType = UIKeyboardType.numberPad
    }
 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 電話番号の数字入力制限
        if textField.tag == 2 {
            if string.count > 0 {
                var allowedCharacters = CharacterSet(charactersIn: "0123456789")
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters) // 入力可能な文字を全て取り去った文字列に文字があれば、テキスト変更できないFalseを返す。
                if unwantedStr.count != 0 {
                    let dialog = UIAlertController(title: "入力制限", message: "電話番号は数字のみのご入力でお願いいたします。", preferredStyle: .alert)
                    dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(dialog, animated: true, completion: nil)

                    return false
                }
            }
        }
        
        // 入力文字数制限　tag:1 お名前　tag:2 電話番号
        var maxlength = 0
        switch ( textField.tag ){
        case 1:
            maxlength = 100
        case 2:
            maxlength = 20
        default:
            break
        }
        
        // これだとローマ字入力の途中で入力できなくなってしまうので実質maxlength-1文字しか日本語入力できない
        // 入力を反映させたテキストを取得する
        let resultText: String = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if resultText.count <= maxlength {
            return true
        }
        let dialog = UIAlertController(title: "文字数制限", message: "入力文字数は"  + String(maxlength) + "文字までです", preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(dialog, animated: true, completion: nil)
        return false
    }

    
    @IBAction func submit(_ sender: Any) {
        
        var username : String! = name.text
        var tell_number : String! = tell_number.text
        var inquiry : String! = inqury.text
        let uuid = UUID()

        let InquiryModel = Inquiry()

        InquiryModel.uuid = uuid.uuidString
        InquiryModel.name = username
        InquiryModel.tell_number = tell_number
        InquiryModel.inquiry = inquiry

        InquiryModel.addData(Inquiry: InquiryModel)
                
        let dialog = UIAlertController(title: "完了", message: "送信完了しました。", preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(dialog, animated: true, completion: nil)
    }
    
    @IBAction func verify(_ sender: Any) {
        let InquiryModel = Inquiry()
        let count = String( InquiryModel.countData() )

        let alert: UIAlertController = UIAlertController(title: "確認", message:  "送信件数" + count + "件", preferredStyle:  UIAlertController.Style.alert)

        let confirmAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)

        let deleteAction: UIAlertAction = UIAlertAction(title: "削除", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            InquiryModel.deleteData()
        })

        alert.addAction(deleteAction)
        alert.addAction(confirmAction)

        present(alert, animated: true, completion: nil)
    }
}


class Inquiry: Object {
    @objc dynamic var uuid = ""
    @objc dynamic var name = ""
    @objc dynamic var tell_number = ""
    @objc dynamic var inquiry = ""
    
    func addData( Inquiry : Object ){
        let realm = try! Realm()
        try! realm.write {
            realm.add(Inquiry)
        }
    }
    
    func countData() ->Int {
        let realm = try! Realm()
        let inq = realm.objects(Inquiry.self)
        return inq.count
    }
        
    func deleteData(){
        let realm = try! Realm()
        let objects = realm.objects(Inquiry.self)
        try! realm.write {
            realm.delete(objects)
        }
    }
}

