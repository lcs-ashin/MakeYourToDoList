//
//  SharedFunctions.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-11-03.
//

import Foundation

// Return a list of tasks that have been filtered by a due date selected by date picker
func filtered(by dateSelected: Date, from list: [AddedTask], selectionActive: Bool) -> [AddedTask] {
    
    // Don't filter results when a selection is not active
    if selectionActive == false {
        
        return list
        
    } else {
        
        var filteredResults: [AddedTask] = []
        
        for savedTask in list {
            
            if dateSelected == savedTask.savedDate {
                
                filteredResults.append(savedTask)
                
            }
            
        }
        
        return filteredResults
        
    }
}
