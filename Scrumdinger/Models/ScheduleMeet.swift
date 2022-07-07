//
//  ScheduleMeet.swift
//  Scrumdinger
//
//  Created by agnezi.io on 06/07/22.
//

import Foundation
import EventKit

struct ScheduleMeet {
	static func createSchedule(isCreate: Bool) {
		let EKstore = EKEventStore()
		Task(priority:.background) {
			do {
				try await EKstore.requestAccess(to: .event)
				let newEvent = EKEvent(eventStore: EKstore)
				newEvent.title = "Test"
				newEvent.startDate = Date()
				newEvent.endDate = Date()
				newEvent.calendar = EKstore.defaultCalendarForNewEvents
				try EKstore.save(newEvent, span: isCreate ? .futureEvents : .thisEvent, commit: true)
			
			} catch {
				print("Error -> \(error.localizedDescription)")
			}
		}
	}
}
