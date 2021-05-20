//
//  Mensajes.swift
//  Mensajes
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI
import MessageUI

struct Mensajes: View {
    @State private var tel = ""
    @State private var mess = ""
    private let messageComposeDelegate = messageDelegate()
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Tel", text: self.$tel)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.phonePad)
                TextField("Mensaje", text: self.$mess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    self.sendMessage()
                }, label: {
                    Text("Enviar mensaje")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                })
            }.navigationBarTitle("Mensaje")
            .padding(.all)
        }
    }
}

extension Mensajes{
    class messageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    func sendMessage(){
        if MFMessageComposeViewController.canSendText(){
            let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
            let sms = MFMessageComposeViewController()
            sms.body = self.mess
            sms.recipients = [self.tel]
            sms.messageComposeDelegate = messageComposeDelegate
            vc?.present(sms, animated: true, completion: nil)
        }else{
            print("No se puede envar el mensaje")
        }
    }
}

struct Mensajes_Previews: PreviewProvider {
    static var previews: some View {
        Mensajes()
    }
}
