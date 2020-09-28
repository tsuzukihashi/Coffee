import SwiftUI

struct CoffeeList: View {
    var body: some View {
        List {
            ForEach(CoffeeType.allCases, id: \.title) { type in
                CoffeeRowView(coffeeType: type)
            }
        }
    }
}

struct CoffeeList_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeList()
    }
}
