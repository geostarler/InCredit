//
//  UserDefaultUtil.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit

class UserDefaultUtils: NSObject {
    static func checkKey(suiteName:String = "", key:String) -> Bool {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        if defaults?.object(forKey: key) != nil {
            return true
        }
        return false
    }
    
    static func removeKey(suiteName:String = "", key:String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        if defaults?.object(forKey: key) != nil {
            defaults?.removeObject(forKey: key)
            defaults?.synchronize()
        }
    }
    
    static func setString(suiteName:String = "", value:String, key:String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        defaults?.set(value, forKey: key)
        defaults?.synchronize()
    }
    
    static func setInterger(suiteName:String = "", value:Int, key:String) {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        defaults?.set(value, forKey: key)
        defaults?.synchronize()
    }
    
    static func stringValue(suiteName:String = "", key:String) -> String! {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        return defaults?.string(forKey: key)
    }
    
    static func intValue(suiteName:String = "", key:String) -> Int? {
        let defaults = suiteName.isEmpty ? UserDefaults.standard : UserDefaults(suiteName: suiteName)
        return defaults?.integer(forKey: key)
    }
    
    static func setBool(value:Bool,key:String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func boolValue(key:String) ->Bool{
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }
    
    
    static func setObject(value:Any,key:String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func objectValue(key:String) ->Any{
        let defaults = UserDefaults.standard
        return defaults.object(forKey: key)!
    }
    
    static func setInt(value:Int,key:String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func setDouble(value:Double,key:String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func doubleValue(key:String) ->Double{
        let defaults = UserDefaults.standard
        return defaults.object(forKey: key)! as! Double
    }
    
    static func floatValue(key:String) ->CGFloat{
        let defaults = UserDefaults.standard
        return defaults.object(forKey: key)! as! CGFloat
    }
    
    static func setFloat(value:CGFloat,key:String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
}


