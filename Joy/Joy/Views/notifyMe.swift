//
//  notifyMe.swift
//  Joy
//
//  Created by Dennis Knierim on 16.01.22.
//

import SwiftUI
import UserNotifications

struct notifyMe: View {
    
    @EnvironmentObject var modelData: User
    @State var date: Date = Date.now
    @State var isLinkActive: Bool = false

    var body: some View {
        background_image()
            .blur(radius: 10)
            .overlay(
                VStack{
                    Text("Take some time off \nnurse your mental health\n\n When would you like to be reminded?")
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(.white))
                        .frame(maxWidth: 366, maxHeight: 225)
                        .background(Blur())
                        .cornerRadius(10)
                    
                    //Text(Date.now, format: .dateTime.hour().minute())
                    
                    DatePicker("", selection: $date,
                               displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.wheel)
                        .frame(width: 366, height: 195, alignment: .center)
                        .colorInvert()
                        .background(Blur())
                        .cornerRadius(10)
                    let components = Calendar.current.dateComponents([.hour, .minute], from: date)
                    Spacer()
                        .frame(height: 105)
                    NavigationLink(destination: edit_user(), isActive: $isLinkActive){
                        Button(action: {
                            
                            //Notification request
                            print("lauching notif")
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
                                if success {
                                    print("all set!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                            
                            // Notification content
                            let content = UNMutableNotificationContent()
                            content.title = "Hey! how about a quick session"
                            content.body = "It's time to check in on your mental health for today"
                            content.sound = UNNotificationSound.default
                            
                            
                            //Notification trigger
                            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                            
                            //Initialise Notification
                            let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
                            
                            //Register request
                            UNUserNotificationCenter.current().add(request)
                            self.isLinkActive = true
                        }){
                            Text("set reminder")
                                .fontWeight(.regular)
                                .font(.body)
                                .padding()
                                .frame(minWidth: 0,  maxWidth: 370)
                                .background(Color("Color2"))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                        .padding(/*@START_MENU_TOKEN@*/.vertical, 2.0/*@END_MENU_TOKEN@*/)
                        .offset(y:-30)
                }
            }
        )
    }
}

struct notifyMe_Previews: PreviewProvider {
    static var previews: some View {
        notifyMe()
            .environmentObject(User())
    }
}

