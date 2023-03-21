//
//  Curency.swift
//  Money_Converter
//
//  Created by Ivan Yarmoliuk on 3/16/23.
//

enum Curency: Double, CaseIterable {
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    func convert(amountString: String, to curency: Curency) -> String {
        guard let convertedDoble = Double(amountString) else { return ""}
        
        let convertedAmount = (convertedDoble / self.rawValue) * curency.rawValue
        
        if convertedAmount > 0 {
            
            return String(format: "%.2f", convertedAmount)
        }
        else {
            return ""
        }
    }
}

enum CurencyText: String, CaseIterable {
    case copperPenny = "Copper Penny"
    case silverpenny = "silver Penny"
    case silverpiece = "silver Piece"
    case goldpenny = "gold Penny"
    case goldpiece = "gold Piece"
}

enum CurencyImage: String, CaseIterable {
    case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
    case silverPiece = "silverpiece"
    case goldPenny = "goldpenny"
    case goldPiece = "goldpiece"
}
