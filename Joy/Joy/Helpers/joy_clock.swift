//
//  joy_clock.swift
//  Joy
//
//  Created by Dennis Knierim on 13.01.22.
//

import SwiftUI

struct joy_clock: View {
    @State var date = Date.now

    var timeFormat: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }
    var dateFormat: DateFormatter{
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "MMMM dd, yyyy | EEEE"
        return dFormatter
    }
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    func dateString(date: Date) -> String{
        let datum = dateFormat.string(from: date)
        return datum
    }
    var updateTimer: Timer{
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            self.date = Date()
        })
    }
    var body: some View {
        VStack(alignment: .center){
            VStack(alignment: .leading){
                Text("\(timeString(date:date))")
                    .font(.custom("Calibri", size: 30))
                    .fontWeight(.bold)
                    .offset(x:4)
                    .onAppear(perform: {let _ = self.updateTimer})
                Text(" \(dateString(date:date))")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color("dateColor"))
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: 361, maxHeight: 100)
            .background(Color(.white))
            .cornerRadius(10)
        }
    }
}

struct joy_clock_Previews: PreviewProvider {
    static var previews: some View {
        joy_clock()
    }
}
