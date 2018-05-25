import Foundation
import UIKit

class CheckController {
    
    static let shared = CheckController()
    
    let baseURL = URL(string: "http://localhost:8090/")!

    func fetchSensorItems(occurrence: String, completion:
        @escaping ([Sensor]?) -> Void) {
        
        let checkSensorsURL = baseURL.appendingPathComponent("check")
        var components = URLComponents(url: checkSensorsURL,
                                       resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "occurrence",
                                              value: occurrence)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL)
        { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let sensors = try? jsonDecoder.decode(Sensors.self,
                                                        from: data) {
                completion(sensors.sensors)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
}
