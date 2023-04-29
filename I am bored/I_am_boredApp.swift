//
//  I_am_boredApp.swift
//  I am bored
//
//  Created by Louis Weigel on 29.04.23.
//

import SwiftUI
import Alamofire

struct BoredAPIReponseStructure: Codable {
    let activity: String
}

@main
struct I_am_boredApp: App {
    @State var observer: NSKeyValueObservation?
    @State var activity: String = ""

    var body: some Scene {
        MenuBarExtra("Mir ist langweilig…") {
            MenuBarView(text: $activity)
                .onAppear {
                    observer = NSApplication.shared.observe(\.keyWindow) { x, y in
                        let isOpened = NSApplication.shared.keyWindow != nil
                        
                        if (isOpened) {
                            AF.request("https://www.boredapi.com/api/activity/").responseDecodable(of: BoredAPIReponseStructure.self) { response in
                                switch response.result {
                                case .failure(let error):
                                    print(error)
                                    
                                case .success(let data):
                                    activity = data.activity
                                }
                            }
                        } else {
                            activity = ""
                        }
                    }
                }
        }
        .menuBarExtraStyle(.window)
    }
}
