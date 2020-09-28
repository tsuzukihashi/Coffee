import SwiftUI

struct CoffeeRowView: View {
    let coffeeType: CoffeeType
    let size: CGFloat = 88
    @State var showFavorite: Bool = false

    var body: some View {
        HStack {
            coffeeType.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .background(Color.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack(alignment: .leading) {
                Text(coffeeType.title)
                    .font(.headline)
                Text(coffeeType.description)
                    .font(.subheadline)

                if showFavorite {
                    FavoriteView(count: coffeeType.rating)
                }
            }

        }
    }
}

struct CoffeeRowContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            CoffeeRowView(coffeeType: .american)
        )
    }
}

struct CoffeeRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoffeeRowView(coffeeType: .blend)
            CoffeeRowView(coffeeType: .caramelMacchiato)
        }
        .padding(.horizontal)
        .previewLayout(.sizeThatFits)
    }
}
