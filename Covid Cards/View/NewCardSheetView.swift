//
//  NewCardSheetView.swift
//  Covid Cards
//
//  Created by Arthur Ford on 10/3/21.
//

import SwiftUI
import CoreData

struct NewCardSheetView: View {
    var context: NSManagedObjectContext!
    
    @Environment(\.dismiss) var dismiss
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    
    @State var nameOnCard = ""
    @State var vaccineDate = Date()
    @State private var showingImagePicker = false
    
    var body: some View {
        Form {
            Section(header: Text("Card Info")) {
                TextField("Full name", text: $nameOnCard)
                    .autocapitalization(.words)
                DatePicker("Latest vaccine date", selection: $vaccineDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                Button {
                    sourceType = .photoLibrary
                    showingImagePicker = true
                } label: {
                    Text("Select photo")
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                }
                Button {
                    sourceType = .camera
                    showingImagePicker = true
                } label: {
                    Text("Take new photo")
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                }
                Button {
                    addNewItem(name: nameOnCard, vaccineDate: vaccineDate, cardImage: selectedImage)
                    dismiss()
                } label: {
                    Text("Save Card")
                }
                .disabled((selectedImage == nil))
                .disabled(nameOnCard == "")
            }
        }
    }
    func addNewItem(name: String, vaccineDate: Date, cardImage: UIImage?) {
        
        let newItem = Card(context: self.context)
        
        newItem.nameOnCard = name
        newItem.vaccineDate = vaccineDate
        newItem.card = cardImage?.jpegData(compressionQuality: 1.0)
        newItem.dateAdded = Date()
        
        do {
            try context.save()
        } catch {
            print("Save Failed")
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                //                let nsError = error as NSError
                //                fatalError("Unresolved error \(nsError), \(nsError.localizedFailureReason)")
        }
    }
}

struct NewCardSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardSheetView()
    }
}
