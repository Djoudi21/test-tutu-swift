//
//  DataViewModel.swift
//  tutu
//
//  Created by Abdelkrim Djoudi on 21/12/2022.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    @Published var savedClients: [ClientEntity] = []

    let container: NSPersistentContainer
    init() {
        print("INIT")
        container = NSPersistentContainer(name: "ClientContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR \(error)")
            }
        }
        fetchClients()
    }
    
    func fetchClients() {
        let request = NSFetchRequest<ClientEntity>(entityName: "ClientEntity")
        do {
            savedClients = try container.viewContext.fetch(request)
            print("Fetch \(savedClients.count)")

        } catch let error {
            print("ERROR \(error)")
        }
    }
    
    func addClient(firstName: String, lastName: String, address: String) {
        print("ADD")
        let newClient = ClientEntity(context: container.viewContext)
        newClient.firstName = firstName
        newClient.lastName = lastName
        newClient.address = address
        saveData()
    }
    
    func removeClient(indexSet: IndexSet) {
        print("DELETE")
        guard let index = indexSet.first else {return}
        let clientToDelete = savedClients[index]
        container.viewContext.delete(clientToDelete)
        saveData()
    }
    
    func saveData() {
        do {
            print("SAVE")
            try container.viewContext.save()
            fetchClients()
        } catch let error {
                print("ERROR \(error)")
        }
    }
}
