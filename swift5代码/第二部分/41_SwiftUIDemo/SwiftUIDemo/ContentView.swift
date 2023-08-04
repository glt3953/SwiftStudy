//
//  ContentView.swift
//  41_SwiftUIDemo
//
//  Created by 珲少 on 2021/2/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Hello, SwiftUI!啊啊啊")
                .foregroundColor(Color.red)
                .underline()
                .font(Font.system(size: 25))
            Spacer()
            Text("Hello, SwiftUI!")
            .foregroundColor(Color.red)
            .underline()
            .font(Font.system(size: 25))
        }
    }
}


struct Label:UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        UILabel(frame: .zero)
     }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = "Hello"
    }
}

struct ContactModel {
    var name:String
    var phone:String
}

let modelData = [
    ContactModel(name:"王小丫", phone:"15137348888"),
    ContactModel(name:"李小二", phone:"15137348989")
]

struct RowContent:View {
    
    var contactModel:ContactModel
    
    var body: some View {
        HStack(alignment:.top) {
            Image("demo").resizable().frame(width: 70, height: 70)
            VStack(alignment:.leading, spacing: 10) {
                Text(self.contactModel.name).bold().font(Font.system(size: 25))
                Text(self.contactModel.phone).font(Font.system(size: 20))
            }
            Spacer()
            }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}

struct ListContent:View {
    var body: some View {
        NavigationView {
            List(modelData, id: \.name) { model in
                NavigationLink(destination: ContentImage(name: model.name, phone: model.phone)) {
                    RowContent(contactModel: model)
                }
            }
            .navigationBarTitle("通讯录", displayMode: .inline)
        }
    }
}

struct ContentImage:View {
    var name:String
    var phone:String
    var body: some View {
        VStack() {
            Image("demo")
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 30)
                .offset(x: 0, y: -70)
                
            Text(name).offset(x: 0, y: -50)
            Text(phone).offset(x: 0, y: -30)
        }
    }
}

// 作为环境数据的类，必须是可绑定监听的，需要继承ObservableObject
class EnviData: ObservableObject {
    @Published var count = 0
}

struct SimpleSubText:View {
    // 获取环境数据进行使用
    @EnvironmentObject var data:EnviData
    var body: some View {
        Button(action:{
            self.data.count += 1
        }){
            Text("按钮一")
        }
        Text("\(self.data.count)")
    }
}


struct SimpleView:View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            SimpleSubText()
        }
    }
}

struct DrawTestView:View {
    let angle:Angle
    var body: some View {
            Path { path in
                let width = 250
                let height = 150
                path.move(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 450))
                path.addLine(to: CGPoint(x: 300, y: 100))
            }.fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom)).rotationEffect(angle, anchor: .center)
        }
}

//struct DrawContent:View {
//    var body: some View {
//        ZStack{
//            ForEach(0 ..< 10) { i in
//                DrawTestView(angle: Angle(degrees:Double(36*i))).opacity(0.3)
//            }
//        }
//    }
//}

struct DrawContent:View {
    @State private var begin = false
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Button(action: {
                self.begin.toggle()
            }) {
                Text("开始")
                    .font(Font.system(size: 30))
                    .rotationEffect(.degrees(self.begin ? 180 : 0))
                    .scaleEffect(self.begin ? 2 : 1)
                    .animation(.easeInOut(duration: 3))
                                        
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawContent()
    }
}
