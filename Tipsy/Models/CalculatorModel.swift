

import Foundation
struct CalculatorModel{
    
    var tipsy : Tipsy?
    
    
    func getFinalRetult2Decimel() -> String{
        let totalto2DecimalPlace = String(format: "%.2f", tipsy?.total ?? 0.0)
        return totalto2DecimalPlace
    }
    
    func getTips() -> String{
        let tip = String( format: "%.0f" , tipsy?.tip ?? 10 )
        print(tip)
        return tip
    }
    
    func getNumberOfPeople() -> String{
       
        let split = String(tipsy?.split ?? 2)
        return split
    }
    
    
    mutating func calculateTips ( billTotal: Double, tip: Double, numberOfPeople: Int){
        
        let result = billTotal * (1 + (tip / 100)) / Double(numberOfPeople)
        tipsy = Tipsy(total: result, tip: tip , split: numberOfPeople
        )
    }
}
