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

extension Image {
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}

struct CoffeeRowContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(
            CoffeeRowView(coffeeType: .american),
            title: "Coffee Row effect",
            category: .effect
        )
        LibraryItem(
            CoffeeRowView(coffeeType: .american, showFavorite: true),
            title: "Coffee Row layout",
            category: .layout
        )
        LibraryItem(
            CoffeeRowView(coffeeType: .american, showFavorite: true),
            title: "Coffee Row control",
            category: .control
        )
        LibraryItem(
            CoffeeRowView(coffeeType: .american, showFavorite: true),
            title: "Coffee Row other",
            category: .other
        )
    }

    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.resizedToFill(width: 100, height: 100),
            title: "resizedToFill effect",
            category: .effect
        )
        LibraryItem(
            base.resizedToFill(width: 100, height: 100),
            title: "resizedToFill layout",
            category: .layout
        )
        LibraryItem(
            base.resizedToFill(width: 100, height: 100),
            title: "resizedToFill control",
            category: .control
        )
        LibraryItem(
            base.resizedToFill(width: 100, height: 100),
            title: "resizedToFill other",
            category: .other
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
