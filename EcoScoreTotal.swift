//
//  EcoScoreTotal.swift
//  Hackathon
//
//  Created by Ethan Chow on 3/4/23.
//

import Foundation
import SwiftUI

struct EcoScore: View {
    @State var ECOscore: Float = 99.3
    @State var LetterScore: String = "D"
    let ECOtotal: Float = 100;
    var body: some View {
        GeometryReader{geo in
            let barwidth = geo.size.width - 20
            
            VStack(alignment: .center){
                Text("ECO Score:").font(.system(size: 36))
                HStack{
                    Text(LetterScore).font(.system(size: 80, design: .rounded).weight(.bold)).foregroundColor(ECOScoreColor(score: ECOscore))
                    Rectangle().fill(ECOScoreHalfgroundColor(score: ECOscore)).frame(width:7, height: 80)
                    Text(String(format: "%.1f", ECOscore)).font(.system(size: 80)).foregroundColor(ECOScoreBackgroundColor(score: ECOscore)).shadow(color: ECOScoreHalfgroundColor(score: ECOscore), radius: 2)
                }.offset(x: 0, y:-20)
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 5).frame(width: barwidth, height:20).foregroundColor(ECOScoreBackgroundColor(score: ECOscore))
                    RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: ECOScoreGradient(score: ECOscore), startPoint: .leading, endPoint: .trailing)).frame(width:barwidth * CGFloat(ECOscore) / 100.0, height:20).shadow(color: ECOScoreColor(score: ECOscore), radius: 5)
                }.offset(x: 0, y:-40)
                Spacer()
            }.frame(maxWidth: .infinity)
        }
    }
}

func ECOScoreColor(score: Float) -> Color{
    var rVal : Float = 0.0
    var gVal : Float = 0.0
    if (score < 50){
        rVal = 1.0;
        gVal = score / 50;
    }
    if (score >= 50){
        rVal = (100.0 - score) / 50;
        gVal = 1.0;
    }
    return Color(red: CGFloat(rVal), green: CGFloat(gVal), blue: 0.0)
}

func ECOScoreGradient(score: Float) -> Gradient{
    var rVal : Float = 0.0
    var gVal : Float = 0.0
    if (score < 50){
        rVal = 1.0;
        gVal = score / 50;
    }
    if (score >= 50){
        rVal = (100.0 - score) / 50;
        gVal = 1.0;
    }
    
    let Color1 = Color(red: CGFloat(rVal), green: CGFloat(gVal), blue: 0)
    
    let Color2 = Color(red: CGFloat(rVal/2+gVal+1 - (score/50)), green: CGFloat(gVal-rVal/2), blue: CGFloat(gVal/2-rVal/2))
    
    return Gradient(colors: [Color2, Color1])
}

func ECOScoreBackgroundColor(score: Float) -> Color{
    var rVal : Float = 0.0
    var gVal : Float = 0.0
    if (score < 50){
        rVal = 1.0;
        gVal = score / 50;
    }
    if (score >= 50){
        rVal = (100.0 - score) / 50;
        gVal = 1.0;
    }
    rVal = rVal * 0.4
    gVal = gVal * 0.4
    return Color(red: CGFloat(rVal), green: CGFloat(gVal), blue: 0)
}

func ECOScoreHalfgroundColor(score: Float) -> Color{
    var rVal : Float = 0.0
    var gVal : Float = 0.0
    if (score < 50){
        rVal = 1.0;
        gVal = score / 50;
    }
    if (score >= 50){
        rVal = (100.0 - score) / 50;
        gVal = 1.0;
    }
    rVal = rVal * 0.6
    gVal = gVal * 0.6
    return Color(red: CGFloat(rVal), green: CGFloat(gVal), blue: 0)
}

struct EcoScore_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
