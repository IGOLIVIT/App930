//
//  CalendarViewModel.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI
import CoreData

final class CalendarViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var calDate: String = ""
    @Published var calClimbs: String = ""
    @Published var calCost: String = ""
    @Published var calLoc: String = ""
    @Published var calLName: String = ""
    @Published var calEq: String = ""

    @Published var calendars: [CalModel] = []
    @Published var selectedCal: CalModel?

    func addCal() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CalModel", into: context) as! CalModel

        loan.calDate = calDate
        loan.calClimbs = calClimbs
        loan.calCost = calCost
        loan.calLoc = calLoc
        loan.calLName = calLName
        loan.calEq = calEq

        CoreDataStack.shared.saveContext()
    }

    func fetchCals() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CalModel>(entityName: "CalModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.calendars = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.calendars = []
        }
    }
}
