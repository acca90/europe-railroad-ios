//
//  ContentView.swift
//  Shared
//
//  Created by Felipe Muller  on 03/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: URL(string: Constants.url)!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
