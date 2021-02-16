//
//  ContentView.swift
//  MAPD726_ICE_1
//
//  Created by Reda Mehali on 2/12/21.
//

import SwiftUI

var betLine = [" ", " ", " "];
var outCome = [0, 0, 0];
var blanks = 0
var grapes = 0
var bananas = 0
var oranges = 0
var cherries = 0
var bars = 0
var bells = 0
var sevens = 0

var winnings = 0
var playerBet = 0;
var playerMoney = 1000;

struct ContentView: View {
@State private var resultText = ""
@State private var creditsText = ""
    
var body: some View {
    VStack {
        Button(action: {
            spinReels()
            determineWinnings(resultText: &resultText, creditsText: &creditsText)
        }, label: {
            Text("Spin Button")
        })
        .frame(width:100,height:75)
        .background(RoundedRectangle(cornerRadius:8)
                        .fill(Color.yellow))
        .accentColor(Color.white)
        
        Text("\(resultText) \n \(creditsText)")
    }
}
}

private func determineWinnings(resultText : inout String, creditsText : inout String) {
    if (blanks == 0) {
        if (grapes == 3) {
            winnings = playerBet * 10;
        }
        else if (bananas == 3) {
            winnings = playerBet * 20;
        }
        else if (oranges == 3) {
            winnings = playerBet * 30;
        }
        else if (cherries == 3) {
            winnings = playerBet * 40;
        }
        else if (bars == 3) {
            winnings = playerBet * 50;
        }
        else if (bells == 3) {
            winnings = playerBet * 75;
        }
        else if (sevens == 3) {
            winnings = playerBet * 100;
        }
        else if (grapes == 2) {
            winnings = playerBet * 2;
        }
        else if (bananas == 2) {
            winnings = playerBet * 2;
        }
        else if (oranges == 2) {
            winnings = playerBet * 3;
        }
        else if (cherries == 2) {
            winnings = playerBet * 4;
        }
        else if (bars == 2) {
            winnings = playerBet * 5;
        }
        else if (bells == 2) {
            winnings = playerBet * 10;
        }
        else if (sevens == 2) {
            winnings = playerBet * 20;
        }
        else if (sevens == 1) {
            winnings = playerBet * 5;
        }
        else {
            winnings = playerBet * 1;
        }
        print("Win!");
    }
    else {
        print("Loss!");
    }
    
    resultText = String(winnings);
    playerMoney += winnings;
    creditsText = String(playerMoney);
    resetFruitTally();
}


private func resetFruitTally() {
    grapes = 0;
    bananas = 0;
    oranges = 0;
    cherries = 0;
    bars = 0;
    bells = 0;
    sevens = 0;
    blanks = 0;
}
    

private func spinReels() -> [String] {
    for spin in 0...2 {
        outCome[spin] = Int(((drand48() * 65) + 1).rounded(.down))
        
        switch outCome[spin] {
        case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):
            betLine[spin] = "Blank";
            blanks += 1
        case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37):
            betLine[spin] = "Grapes";
            grapes += 1
        case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46):
            betLine[spin] = "Banana";
            bananas += 1
        case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54):
            betLine[spin] = "Orange";
            oranges += 1
        case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59):
            betLine[spin] = "Cherry";
            cherries += 1
        case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62):
            betLine[spin] = "Bar";
            bars += 1
        case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64):
            betLine[spin] = "Bell";
            bells += 1
        case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65):
            betLine[spin] = "Seven";
            sevens += 1
        default:
            betLine[spin] = " "
        }
    }
    return betLine
}

private func checkRange(value: Int, lowerBounds: Int, upperBounds: Int) -> Int{
    return (value >= lowerBounds && value <= upperBounds) ? value : -1
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
