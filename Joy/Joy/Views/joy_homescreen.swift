//
//  joy_homescreen.swift
//  Joy
//
//  Created by Dennis Knierim on 13.01.22.
//

import SwiftUI

struct joy_homescreen: View {
    @State var quoteList: [Quote] = []
    @State var taskList: [Dtask] = []
    @State var quote_today: String = ""
    @State var task_today: String = ""
    var body: some View {
        background_image()
            .overlay(
                VStack{
                    Text("Great job! \nTry this exercise to help you feel better")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    ScrollView{
                        Text(task_today)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            
                            .onAppear {
                                Api().loadData { (quotes) in
                                    quoteList = quotes
                                    let object = quoteList.randomElement()?.jsonstring
                                    quote_today = object!["Text"]!}
                                Api().loadTasks { (tasks) in
                                    taskList = tasks
                                    let Tobject = taskList.randomElement()?.jsonstring
                                    task_today = Tobject!["Text"]!
                                    
                                }
                            }
                    }
                    .frame(width: 328, height: 180)
                    .background(Color("black_back"))
                    .cornerRadius(10)
                    
                    Spacer()
                        .frame(height: 10)
                    HStack{
                        Text("And always remember ...")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                            .frame(width: 110)
                    }
                    
                    Text(quote_today)
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 328, height: 289)
                        .background(Color("black_back"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    HStack{
                        Spacer()
                            .frame(width: 278, height: 0)
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.white)
                            .padding(/*@START_MENU_TOKEN@*/.all, 0.0/*@END_MENU_TOKEN@*/)
                            .frame(width: 45, height: 10)
                            .offset(y: -50)
                    }
            
                    homescreen_menu()
                }
                    .offset(y:-40)

            )
    }
}

struct joy_homescreen_Previews: PreviewProvider {
    static var previews: some View {
        joy_homescreen()
            
    }
}

