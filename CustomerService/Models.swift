//
//  Models.swift
//  CustomerService
//
//  Created by 八木亮輔 on 2021/07/06.
//

import Foundation
import RealmSwift

//class Inquiry: Object {
//  @objc dynamic var id = ""
//  @objc dynamic var name = ""
//  @objc dynamic var tell_number = ""
//  @objc dynamic var Inquiry = ""
//}
//
class MVCModel {

    func addData( Inquiry : Object ){
        let realm = try! Realm()
        try! realm.write {
            realm.add(Inquiry)
        }
    }
}
