//
//  Date.swift
//  WhatsApp Clone
//
//  Created by Ashish Acharya  on 5/18/24.
//

import Foundation


extension Date{
    
    
    private var dateFormatter :   DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    func chatTimeStampString(   ) -> String{
        if Calendar.current.isDateInToday(self){
            return "Today"
        }else if Calendar.current.isDateInYesterday(self){
            return "Yesterday"
        }else{
            return dateFormatter.string(from: self)
        }
    }
}
