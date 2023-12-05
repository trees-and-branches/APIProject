//
//  DogViewController.swift
//  APIProject
//
//  Created by shark boy on 12/4/23.
//

import UIKit

class DogViewController: UIViewController {
    
    @IBOutlet weak var dogPic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            dogPic.image = try await fetchAndDisplayImage()
        }
        // Do any additional setup after loading the view.
    }
    
        func fetchAndDisplayImage() async throws -> UIImage {
            // Define the URL
            guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
                throw URLError(.badURL)
            }

            // Perform the asynchronous network request
            let (data, response) = try await URLSession.shared.data(from: url)

            // Check the response status code
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }

            // Attempt to decode the JSON to get the image URL
            let dogModel = try JSONDecoder().decode(Dog.self, from: data)
            guard let imageUrl = URL(string: dogModel.dogImage) else {
                throw URLError(.badURL)
            }

            // Fetch the actual image data
            // UrlSession type is ternary
            let (imageData, imageResponse) = try await URLSession.shared.data(from: imageUrl)
            
            // Create and return the UIImage
            guard let image = UIImage(data: imageData) else {
                throw URLError(.cannotDecodeContentData)
            }
            
            return image
        }
    @IBAction func buttonTapped(_ sender: Any) {
        Task {
            try await dogPic.image = fetchAndDisplayImage()
        }
    }
}
    
//    func fetchAndDisplayImage() async {
//           do {
//               let (data, response) = try await URLSession.shared.data(from: URL(string: "https://dog.ceo/api/breeds/image/random")!) // Replace with your API URL
//               let dogModel = try JSONDecoder().decode(DogModel.self, from: data)
//               // Download and set the image
//               if let imageUrl = URL(string: dogModel.dogImage),
//               let imageData = try response.d
////                  let imageData = try? Data(contentsOf: imageUrl),
//                  let image = UIImage(data: imageData) {
//                   DispatchQueue.main.async {
//                       self.dogPic.image = image
//                   }
//               } else {
//                   print("Invalid URL or Image Data")
//               }
//           } catch {
//               print("Error: \(error)")
//           }
//       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


