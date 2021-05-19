//
//  EditarView.swift
//  CrudCloudKit
//
//  Created by MacBook Pro  on 18/05/21.
//

import SwiftUI
import CloudKit

struct EditarView: View {
    @State private var nombre = ""
    @State private var correo = ""
    var persona: ListaPersonas
    
    private func editar(){
        guard let id = self.persona.recordID else {return}
        let record = CKRecord(recordType: "Personas", recordID: id)
        record.setValue(self.nombre, forKey: "nombre")
        record.setValue(self.correo, forKey: "correo")
        
        let operation = CKModifyRecordsOperation(recordsToSave: [record], recordIDsToDelete: nil)
        operation.savePolicy = .allKeys
        operation.modifyRecordsCompletionBlock = {(_,_,error) in
            if error != nil {
                print("Error editando", error?.localizedDescription)
            }else{
                print("Edito")
            }
        }
        CKContainer.default().privateCloudDatabase.add(operation)
    }
    
    var body: some View {
        VStack{
            TextField("Nombre", text: self.$nombre)
                .onAppear{
                    self.nombre = self.persona.nombre
                }
            TextField("Correo", text: self.$correo)
                .onAppear{
                    self.correo = self.persona.correo
                }
            Button(action: {
                self.editar()
            }, label: {
                Text("Editar")
            })
        }.navigationBarTitle("Editar", displayMode: .inline)
        .padding(.all)
    }
}

struct EditarView_Previews: PreviewProvider {
    static var previews: some View {
        EditarView(persona: ListaPersonas(nombre: "", correo: ""))
    }
}
