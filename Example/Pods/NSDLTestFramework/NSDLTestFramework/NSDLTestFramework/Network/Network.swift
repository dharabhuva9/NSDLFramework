
//
//  Network.swift
//  TestNSDL
//
//  Created by Dhara Bhuva on 06/06/24.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private let reachabilityManager = NetworkReachabilityManager()

    init() {
        startNetworkReachabilityObserver()
    }

    func isConnected() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }

    func fetchData<T: Codable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard isConnected() else {
            completion(.failure(NSError(domain: "", code: -1009, userInfo: [NSLocalizedDescriptionKey: "No internet connection"])))
            return
        }

        AF.request(urlString).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let responseData):
                completion(.success(responseData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func startNetworkReachabilityObserver() {
        reachabilityManager?.startListening(onUpdatePerforming: { status in
            switch status {
            case .notReachable:
                print("The network is not reachable.")
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection.")
            case .reachable(.cellular):
                print("The network is reachable over the cellular connection.")
            case .unknown:
                print("It is unknown whether the network is reachable.")
            }
        })
    }
}
