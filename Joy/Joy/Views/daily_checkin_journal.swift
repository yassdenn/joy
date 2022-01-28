//
//  daily_checkin.swift
//  Joy
//
//  Created by Dennis Knierim on 13.01.22.
//

import SwiftUI
import CoreLocation
import CoreLocationUI


struct daily_checkin_journal: View {
    @EnvironmentObject var modelData: User
    @State var journal_entry: String = "what made you feel like this today? ..."
    @State var isLinkActive: Bool = false
    private enum Field: Int, CaseIterable {
        case journalEntry
    }
    @FocusState private var focusedField: Field?
    
    var body: some View {
            background_image()
                .overlay(
                    VStack(alignment: .center){
                       joy_clock()
                        .offset(x: 20)
                        VStack(alignment: .center){
                            Text("So you feel \(modelData.emotions) ?")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                
                            Form{
                                TextEditor(text: $journal_entry )
                                    .foregroundColor(Color(.gray))
                                    .font(.custom("Calibri", size: 16))
                                    .padding(EdgeInsets(top: 20, leading: 3, bottom: -5, trailing: 3))
                                    .cornerRadius(10)
                                    .frame(width: 265, height: 330)
                                    .cornerRadius(10)
                                    .focused($focusedField, equals: .journalEntry)
                            }
                            .frame(width: 297.0, height: 370.0)
                            .foregroundColor(Color(.white))
                            .cornerRadius(10)
                            .toolbar{
                                ToolbarItem(placement: .keyboard){
                                    Button("Done"){
                                        focusedField = nil
                                    }
                                }
                            }
                            
                                
                                
                            Spacer()
                                .frame(height: 41)
                            NavigationLink(destination: joy_homescreen(), isActive: $isLinkActive){
                                Button(action: {
                                    print("add to journal tapped")
                                    modelData.journal = journal_entry
                                    print(journal_entry)
                                    self.isLinkActive = true
                                }){
                                    HStack{
                                        Image(systemName: "plus")
                                        Text("Add to journal")
                                            .fontWeight(.regular)
                                            .font(.body)
                                    }
                                        .frame(maxWidth: 297, maxHeight: 48)
                                        .background(Color("Color2"))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                        .frame(maxWidth: 328, maxHeight: 570)
                        .background(Color("black_back"))
                        .cornerRadius(10)
                        
                    }
                        .offset(y:-40)
                )
    }
}

struct daily_checkin_journal_Previews: PreviewProvider {
    static var previews: some View {
        daily_checkin_journal()
            .environmentObject(User())
    }
}
