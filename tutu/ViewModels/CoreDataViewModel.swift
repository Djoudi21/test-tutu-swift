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
    @Published var savedInterventions: [InterventionEntity] = []
    @Published var savedReports: [ReportEntity] = []


    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR \(error)")
            }
        }
        fetchClients()
        fetchInterventions()
    }
    
    func fetchClients() {
        let request = NSFetchRequest<ClientEntity>(entityName: "ClientEntity")
        do {
            savedClients = try container.viewContext.fetch(request)
        } catch let error {
            print("ERROR \(error)")
        }
    }
    
    func fetchInterventions() {
        let request = NSFetchRequest<InterventionEntity>(entityName: "InterventionEntity")
        do {
            savedInterventions = try container.viewContext.fetch(request)
            print("savedInterventions \(savedInterventions.count)")
        } catch let error {
            print("ERROR \(error)")
        }
    }
    
    func addClient(firstName: String, lastName: String, address: String) {
        let newClient = ClientEntity(context: container.viewContext)
        newClient.firstName = firstName
        newClient.lastName = lastName
        newClient.address = address
        saveData()
    }
    
    func removeClient(index: Int) {
        let clientToDelete = savedClients[index]
        container.viewContext.delete(clientToDelete)
        saveData()
    }
    
    func addIntervention(title: String, date: Date) {
        let newIntervention = InterventionEntity(context: container.viewContext)
        newIntervention.title = title
        newIntervention.date = date
        newIntervention.client = savedClients.first
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            print("SAVED")
            fetchClients()
            fetchInterventions()
        } catch let error {
                print("ERROR \(error)")
        }
    }
}
