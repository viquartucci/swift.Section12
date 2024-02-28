import UIKit

struct CalculatorBrain {
    var totalValue: CalculatorStruct?
    
    func getTotalPerPerson () -> String {
        let totalToString = String (format: "%.2f", totalValue?.total ?? 0.0)
        return totalToString
        
    }
    
    mutating func calculateTotalPerPeron (splitNumber: Float, billText: Float, tipSelected: Float) {
        let amountToBePaid = ((billText)*(1+tipSelected)) / splitNumber
        //let amountToBePaidTwoDecimals = Float(round(1000*amountToBePaid)/1000)
        return totalValue = CalculatorStruct(total: amountToBePaid, description: "Split between \(Int(splitNumber)) people, with \(Int(tipSelected*100))% tip")
        
    }
    
    func getTextDescription() -> String {
        return totalValue!.description
    }
}
