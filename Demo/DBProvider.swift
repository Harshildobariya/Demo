//
//  DBProvider.swift
//  Demo
//
//  Created by Harshil sureshbhai dobariya on 14/09/18.
//  Copyright © 2018 Harshil sureshbhai dobariya. All rights reserved.
//

import Foundation
import Firebase


class DBprovide {
    private static let _instance = DBprovide()
    
    static var Instance: DBprovide{
        return _instance
    }
    var dbRef: DatabaseReference{
        return Database.database().reference()
    }
    
    var Rideref:DatabaseReference{
        return dbRef.child(constans.RIDER)
    }
    
    
    
    func saveUser(withID: String,email:String,password:String,username:String,number:String) {
        let data : Dictionary<String, Any> = [constans.EMAIL: email, constans.PASSWORD: password,constans.isRider: true,constans.NAME: username,constans.NUMBER: number]
        
        Rideref.child(withID).child(constans.DATA).setValue(data)
    }
    
    
}
