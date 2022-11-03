//
//  SharedFunctions.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-11-03.
//

import Foundation

// Return a list of tasks that have been filtered by a due date selected by date picker
func filter(by dateOfToday: Date, from list: [AddedTask], selectionActive: Bool) -> [AddedTask] {
    
    // Don't filter results when a selection is not active
    if selectionActive == false {
        
        return list
        
    } else {
        
        var filteredResults: [AddedTask] = []
        
        for savedTask in list {
            
            if dateOfToday == savedTask.dateOfToday {
                
                filteredResults.append(savedTask)
                
            }
            
        }
        
        return filteredResults
        
    }
}
