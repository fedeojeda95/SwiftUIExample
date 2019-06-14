//
//  ContentView.swift
//  SwiftUITesting
//
//  Created by Federico Ojeda on 6/10/19.
//  Copyright © 2019 Federico Ojeda. All rights reserved.
//

import SwiftUI

struct ContentView : View {

    var body: some View {
        CharacterListView()
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
