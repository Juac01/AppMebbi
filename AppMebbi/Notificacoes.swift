//
//  LocalNotificationBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/2/21.
//

import SwiftUI
import UserNotifications


class NotificationManager {
    
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This was sooooo easy!"
        content.sound = .default
        content.badge = 1 // NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calendar
        //        var dateComponents = DateComponents()
        //        dateComponents.hour = 8
        //        dateComponents.minute = 0
        //        dateComponents.weekday = 2
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        ZStack {
            // Cor de fundo
            Color("Color")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack{
                    // Texto principal
                    Text("Ao clicar em ")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    + Text("\"Permitir\"")
                        .font(.title2)
                        .foregroundColor(Color("Color1")) // Cor diferente para "Permitir"
                    + Text(", conseguiremos sempre te notificar quando você precisar revisar seu conteúdo!")
                        .font(.title2)
                        .foregroundColor(.white)
                } .multilineTextAlignment(.center)
                    .padding()
                
                
                
                
                
                
                
                // Botão de solicitar permissão
                Button("Solicitar Permissão") {
                    NotificationManager.instance.requestAuthorization()
                }
                .padding()
                .background(Color.green)  // Cor de fundo verde
                .foregroundColor(.white)  // Cor do texto branca
                .cornerRadius(10)         // Borda arredondada
                
                // Botão de agendar notificação
                Button("Agendar Notificação") {
                    NotificationManager.instance.scheduleNotification()
                }
                .padding()
                .background(Color.orange)  // Cor de fundo laranja
                .foregroundColor(.white)   // Cor do texto branca
                .cornerRadius(10)
                
                // Botão de cancelar notificação
                Button("Cancelar Notificação") {
                    NotificationManager.instance.cancelNotification()
                }
                .padding()
                .background(Color.red)     // Cor de fundo vermelha
                .foregroundColor(.white)   // Cor do texto branca
                .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
