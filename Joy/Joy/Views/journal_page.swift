//
//  journal_page.swift
//  Joy
//
//  Created by Dennis Knierim on 16.01.22.
//

import SwiftUI

struct journal_page: View {
    @EnvironmentObject var modelData: User
    @State var date = Date.now
    var dateFormat: DateFormatter{
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "MMMM dd, yyyy | EEEE"
        return dFormatter
    }
    func dateString(date: Date) -> String{
        let datum = dateFormat.string(from: date)
        return datum
    }
    
    var body: some View {
        background_image()
            .overlay(
                VStack{
                    VStack(alignment: .leading){
                        Text(" \(dateString(date:date))")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            

                        Text("Today's mood :")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
           
                        HStack(spacing:50){
                            Image(modelData.emotions)
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text(modelData.emotions)
                                .fontWeight(.semibold)
                        }
                        .frame(width: 230, height: 80)
                        .foregroundColor(Color.white)
                        .background(Blur(style: .systemUltraThinMaterial))
                        .cornerRadius(10)
                        
                        Text("My journal:")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                        ScrollView{
                            Text(modelData.journal)
                                .font(.callout)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: 230, height: 240, alignment: .leading)
                            .background(Blur(style: .systemUltraThinMaterial))
                            .cornerRadius(10)
                            
                        
                    }
                    .frame(width: 328, height: 510)
                    .background(Color("black_back"))
                    .cornerRadius(10)
                    Spacer()
                        .frame(height: 80)
                    homescreen_menu()
                }
                    .offset(y:-30)
            )
    }
}

struct journal_page_Previews: PreviewProvider {
    static var previews: some View {
        journal_page()
            .environmentObject(User())
    }
}
