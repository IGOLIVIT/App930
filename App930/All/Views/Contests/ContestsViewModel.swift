//
//  ContestsViewModel.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI
import CoreData

final class ContestsViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var conDate: String = ""
    @Published var conClimbs: String = ""
    @Published var conCost: String = ""
    @Published var conLoc: String = ""
    @Published var conLift: String = ""
    @Published var conNote: String = ""

    @Published var contests: [ContModel] = []
    @Published var selectedCont: ContModel?

    func addCont() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ContModel", into: context) as! ContModel

        loan.conDate = conDate
        loan.conClimbs = conClimbs
        loan.conCost = conCost
        loan.conLoc = conLoc
        loan.conLift = conLift
        loan.conNote = conNote

        CoreDataStack.shared.saveContext()
    }

    func fetchConts() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ContModel>(entityName: "ContModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.contests = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.contests = []
        }
    }
}
