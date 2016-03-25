//
//  CalculatorBrain.swift
//  cAL
//
//  Created by DP on 16/3/23.
//  Copyright © 2016年 DP. All rights reserved.
//

import Foundation
class  CalculatorBrain{

    private enum Op: CustomStringConvertible{
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        var description : String{
            get {
                switch self{
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol,_):
                    return "\(symbol)"
                case .BinaryOperation(let symbol,_):
                    return "\(symbol)"
                }
            }
            set {
            
            }
        }
    }

//    var opStack = Array<Op>()
    private var opStack = [Op]()

//    var knowOps = Dictionary<String, Op>()
    private var knowOps = [String:Op]()

    init(){
        func learnOp(op:Op){
        knowOps[op.description] = op
        }
        learnOp(Op.BinaryOperation("+",+))
        learnOp(Op.BinaryOperation("−"){$1 - $0})
        learnOp(Op.BinaryOperation("×",*))
        learnOp(Op.BinaryOperation("÷"){$1 / $0})
        learnOp(Op.UnaryOperation("√",sqrt))
        
//        knowOps["+"] = Op.BinaryOperation("+",+)
//        knowOps["−"] = Op.BinaryOperation("−"){$1 - $0}
////        knowOps["×"] = Op.BinaryOperation("×"){$0 * $1}
//        knowOps["×"] = Op.BinaryOperation("×",*)
//        knowOps["÷"] = Op.BinaryOperation("÷"){$1 / $0}
////        knowOps["√"] = Op.UnaryOperation("√"){sqrt($0)}
//        knowOps["√"] = Op.UnaryOperation("√",sqrt)

    }

    func pushOperand(operand:Double) -> Double?{

        opStack.append(Op.Operand(operand))
        return evaluate()
    }

    func preformOperation(symbol:String) -> Double?
    {        
        if let operation = knowOps[symbol]{
        opStack.append(operation)
        }
        return evaluate()
    }

    private func evaluate1(ops: [Op]) -> (result:Double?, remainingOps: [Op])
    {
        if !ops.isEmpty
        {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op
            {
            case .Operand(let operand):
                return (operand,remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate1(remainingOps)
                if let operand = operandEvaluation.result{
                return (operation(operand),operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate1(remainingOps)
                if let operand1 = op1Evaluation.result {
                let op2Evaluation = evaluate1(op1Evaluation.remainingOps)
                if let operand2 = op2Evaluation.result{
                return(operation(operand1,operand2),op2Evaluation.remainingOps)
                }
                }
            }
        }
        return (nil, ops)
    }

    func evaluate() -> Double?{
    let (result, remainder) = evaluate1(opStack)
        print("--\(opStack) = \(result) with \(remainder)")
        return result
    }
}
