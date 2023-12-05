//
//  StateRepController.swift
//  APIProject
//
//  Created by shark boy on 12/4/23.
//

import Foundation
enum StateRepError: Error, LocalizedError {
    case badResponse
}

class StateRepController {
    
    // Defines an asynchronous function named 'fetchStateReps' that may throw an error.
    // It returns an array of 'StateRep' objects.
    func fetchStateReps() async throws -> [StateRep] {

        // Attempts to create a URL object from a string.
        // If this fails (i.e., the URL is invalid), it throws a 'StateRepError.badResponse' error.
        guard let url = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php?state=UT&output=json") else {
            throw StateRepError.badResponse
        }

        // Makes an asynchronous network request to fetch data from the URL.
        // If this network request fails, the function throws an error.
        let (data, response) = try await URLSession.shared.data(from: url)

        // Checks if the HTTP response is valid (i.e., the status code is 200).
        // If it's not a valid HTTPURLResponse or the status code is not 200, it throws 'StateRepError.badResponse'.
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StateRepError.badResponse
        }

        do {
            // Tries to decode the JSON data into an array of 'StateRep' objects.
            let stateRepsResponse = try JSONDecoder().decode(StateRepResponse.self, from: data)
            // Returns the decoded array of 'StateRep' objects if successful.
            return stateRepsResponse.results
        } catch {
            // If JSON decoding fails, it throws 'StateRepError.badResponse'.
            throw StateRepError.badResponse
        }
    }

}
//    func fetchStateReps() async throws -> [StateRep] {
//    var stateReps = [StateRep]()
//        let url = URL(string:"http://whoismyrepresentative.com/getall_reps_bystate.php?state=UT&output=json")
//            let (data, response) = try await URLSession.shared.data(from: url!)
//
//        guard let httpResponse = response as? HTTPURLResponse,
//              httpResponse.statusCode == 200 else {
//            throw StateRepError.badResponse
//        }
//        do {
//            stateReps = try JSONDecoder().decode([StateRep].self, from: data)
//            return stateReps
//        } catch {
//            print(StateRepError.badResponse)
//        }
//    }
