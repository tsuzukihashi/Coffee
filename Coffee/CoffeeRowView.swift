import SwiftUI

struct CoffeeRowView: View {
    let coffeeType: CoffeeType
    let size: CGFloat = 88

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
            }

        }
    }
}

struct CoffeeRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoffeeRowView(coffeeType: .blend)
            CoffeeRowView(coffeeType: .caramelMacchiato)
        }
        .frame(width: 334, alignment: .leading)
        .padding(.horizontal)
        .previewLayout(.sizeThatFits)
    }
}
