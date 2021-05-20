//
//  Correos.swift
//  Mensajes
//
//  Created by MacBook Pro  on 19/05/21.
//

import SwiftUI
import MessageUI

struct Correos: View {
    @State private var email = ""
    @State private var subject = ""
    @State private var message = ""
    private var mailCoomposeDelegate = mailDelegate()
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Correo", text: self.$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                TextField("Asunto", text: self.$subject)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Mensaje", text: self.$message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.sendEmail()
                }, label: {
                    Text("Enviar correo")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .bold()
                })
            }.navigationBarTitle("Email")
            .padding(.all)
        }
    }
}

extension Correos{
    class mailDelegate: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    func sendEmail(){
        if MFMailComposeViewController.canSendMail(){
            let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
            let email = MFMailComposeViewController()
            email.setSubject(self.subject)
            email.setMessageBody(self.message, isHTML: false)
            email.setToRecipients([self.email])
            email.mailComposeDelegate = mailCoomposeDelegate
            
            vc?.present(email, animated: true, completion: nil)
        }else{
            print("No se puede envar el correo")
        }
    }
}

struct Correos_Previews: PreviewProvider {
    static var previews: some View {
        Correos()
    }
}
