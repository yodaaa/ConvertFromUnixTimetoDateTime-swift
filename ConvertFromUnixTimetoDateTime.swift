//
//  ConvertFromUnixTimetoDateTime.swift
//  m1-research
//
//  Created by yodaaa on 2019/01/16.
//  Copyright © 2019 yodaaa. All rights reserved.
//

import Foundation

protocol ConvertFromUTtoDT {
    var dateUnix: TimeInterval { get set }
    
    func ConvertFromUnixTime(_ dateUnix: TimeInterval) -> String
    
}

extension ConvertFromUTtoDT {
    func ConvertFromUnixTime(_ dateUnix: TimeInterval) -> String {
        // UNIX時間dateUnixをNSDate型dateに変換
        let dateUnix10 = ( dateUnix / 1000 )
        let date = NSDate(timeIntervalSince1970: dateUnix10)
        
        // NSDate型を日時文字列に変換するためのNSDateFormatterを生成
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SS"
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        // NSDateFormatterを使ってNSDate型 "date" を日時文字列 "dateStr" に変換
        let dateStr: String = formatter.string(from: date as Date)
        
        return dateStr
    }
}


/// unix時間を日時文字列に変換する
public class ConvertFromUnixTimetoDateTime: ConvertFromUTtoDT {
    var dateUnix: TimeInterval = 0.0
    
    //    init(dateUnix: TimeInterval) {
    //        self.dateUnix = dateUnix
    //    }
    
}


// usage
//let converut: ConvertFromUnixTimetoDateTime = ConvertFromUnixTimetoDateTime()s
//converut.ConvertFromUnixTime(1547618462261)
