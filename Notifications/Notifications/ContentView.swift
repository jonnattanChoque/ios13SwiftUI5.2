//
//  ContentView.swift
//  Notifications
//
//  Created by Jonnattan Jair Choque Martinez on 18/05/21.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State private var show = false
    
    func localNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (_, _) in
            
        }
        
        //Contenido
        let contenido = UNMutableNotificationContent()
        contenido.title = "Mi notificación"
        contenido.subtitle = "Mi subtitulo"
        contenido.body = "Esta es mi primera notificación"
        contenido.sound = UNNotificationSound.defaultCritical
        contenido.badge = 1
        
        //Imagen
        if let path = Bundle.main.path(forResource: "emoji", ofType: "jpeg"){
            let url = URL(fileURLWithPath: path)
            
            do {
                let imagen = try UNNotificationAttachment(identifier: "emoji", url: url, options: nil)
                contenido.attachments = [imagen]
            } catch {
                print("no cargo la imagen")
            }
        }
        
        //Botones
        let btn1 = UNNotificationAction(identifier: "btn1", title: "Abrir vista", options: .foreground)
        let btn2 = UNNotificationAction(identifier: "btn2", title: "Cancelar", options: .destructive)
        let category = UNNotificationCategory(identifier: "acciones", actions: [btn1, btn2], intentIdentifiers: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        contenido.categoryIdentifier = "acciones"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "noti", content: contenido, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: VistaDos(),
                    isActive: self.$show,
                    label: {
                        EmptyView()
                    })
                Button(action: {
                    self.localNotification()
                }, label: {
                    Text("Notificaciones")
                })
            }.onAppear{
                NotificationCenter.default.addObserver(forName: NSNotification.Name("AccionEjecutar"), object: nil, queue: .main) { (_) in
                    self.show.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
