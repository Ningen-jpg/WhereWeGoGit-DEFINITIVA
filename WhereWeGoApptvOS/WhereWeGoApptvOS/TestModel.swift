//
//  TestModel.swift
//  WhereWeGoApptvOS
//
//  Created by Domenico Merola on 13/07/22.
//
import CoreML
import Foundation


class SurveyML {
    var model : MlModelTest
    var input : MlModelTestInput
    var output : String
    
    func predictionOutput(answerPredict : [Double]){
        
   //     model = MlModelTest() //WARNING to be checked, probably nothing serious
        input = MlModelTestInput(Domanda1: answerPredict[0], Domanda2: answerPredict[1], Domanda3: answerPredict[2], Domanda4: answerPredict[3], Domanda5: answerPredict[4], Domanda6: answerPredict[5], Domanda7: answerPredict[6], Domanda8: answerPredict[7], Domanda9: answerPredict[8], Domanda10: answerPredict[9])
        output = try! model.prediction(input: input).City
        print(output)

    }
    init(){
        self.model = MlModelTest()
        self.input = MlModelTestInput(Domanda1: 0, Domanda2: 0, Domanda3: 0, Domanda4: 0, Domanda5: 0, Domanda6: 0, Domanda7: 0, Domanda8: 0, Domanda9: 0, Domanda10: 0)
        self.output = ""
    }

}

//print(output.featureValue(for: "City"))



