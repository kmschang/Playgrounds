//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 10/28/23.
//

import SwiftUI



struct MainScreen: View {
        
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            // Full Vertical Box
            VStack {
                
                // Title
                HStack {
                    Text("Quicker Tipper")
                        .foregroundStyle(.red)
                        .font(.system(size:20, weight: .heavy))
                        .frame(alignment: .center)
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                
                // Top Divider
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(height: 3)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                
                // Main Labels
                // Large Bill AMount Label
                HStack {
                    Spacer()
                    Text("$0.00")
                        .foregroundStyle(.red)
                        .font(.system(size: 50, weight: .heavy))
                        .frame(height: 50, alignment: .center)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                // Small Bill Amount Label
                HStack {
                    Spacer()
                    Text("Bill Amount")
                        .foregroundStyle(.red)
                        .font(.system(size: 15, weight: .bold))
                        .frame(height: 10, alignment: .top)
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                // Large Tip Amount Label
                HStack {
                    Spacer()
                    Text("+ $0.00")
                        .foregroundStyle(.red)
                        .font(.system(size: 50, weight: .heavy))
                        .frame(height: 50, alignment: .center)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                // Small Tip Amount Label
                HStack {
                    Spacer()
                    Text("Tip Amount (Percentage)")
                        .foregroundStyle(.red)
                        .font(.system(size: 15, weight: .bold))
                        .frame(height: 10, alignment: .top)
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                // Large Final Amount Label
                HStack {
                    Spacer()
                    Text("$0.00")
                        .foregroundStyle(.red)
                        .font(.system(size: 50, weight: .heavy))
                        .frame(height: 50, alignment: .center)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                // Small Final Amount Label
                HStack {
                    Spacer()
                    Text("Final Amount")
                        .foregroundStyle(.red)
                        .font(.system(size: 15, weight: .bold))
                        .frame(height: 10, alignment: .top)
                        .padding(.top, -10)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                
                // Middle Divider
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(height: 3)
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                
                
                // Picker View Area
                ZStack(content: {
                    
                    // Picker Views
                    HStack {
                        
                        // Percentage Picker
                        RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                            .foregroundStyle(Color(uiColor: .white))
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        
                        // # People Picker
                        RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                            .foregroundStyle(Color(uiColor: .white))
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        
                    }
                    
                    // Cancel Buttons
                    ZStack {
                        
                        // Percentage Button
                        HStack {
                            Spacer()
                            Button(action: {
                                print("Percentage button pressed")
                            }, label: {
                                Text(Image(systemName: "xmark.circle.fill"))
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundStyle(Color(uiColor: .lightGray))
                            })
                            .padding(.leading, -40)
                            Spacer()
                        }
                        
                        // # People Button
                        HStack {
                            Spacer()
                            Button(action: {
                                print("# People button pressed")
                            }, label: {
                                Text(Image(systemName: "xmark.circle.fill"))
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundStyle(Color(uiColor: .lightGray))
                            })
                            .padding(.leading, -40)
                        }
                        
                    }
                })
                .frame(height: 100)
                
                // Bottom Divider
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(height: 3)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                
                
                // Number Buttons
                
                let size:CGFloat = 25.0
                let textColor:UIColor = .red
                var tintColor:UIColor = .red
                
                
                VStack(alignment: .center, spacing: nil, content: {
                    
                    // Buttons (1-3)
                    HStack(alignment: .center, spacing: nil, content: {
                        // Button 1
                        Button(action: {
                            print("Button 1")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("1")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.leading, 8)
                        
                        // Button 2
                        Button(action: {
                            print("Button 2")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("2")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        
                        // Button 3
                        Button(action: {
                            print("Button 3")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("3")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.trailing, 8)
                    })
                    
                    // Buttons (4-6)
                    HStack(alignment: .center, spacing: nil, content: {
                        // Button 4
                        Button(action: {
                            print("Button 4")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("4")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.leading, 8)
                        
                        // Button 5
                        Button(action: {
                            print("Button 5")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("5")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        
                        // Button 6
                        Button(action: {
                            print("Button 6")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("6")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.trailing, 8)
                    })
                    
                    // Buttons (7-9)
                    HStack(alignment: .center, spacing: nil, content: {
                        // Button 7
                        Button(action: {
                            print("Button 7")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("7")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.leading, 8)
                        
                        // Button 8
                        Button(action: {
                            print("Button 8")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("8")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        
                        // Button 9
                        Button(action: {
                            print("Button 9")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("9")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.trailing, 8)
                    })
                    
                    // Buttons (0, clear, and back)
                    HStack(alignment: .center, spacing: nil, content: {
                        // Clear Button
                        Button(action: {
                            print("Clear Button")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text(Image(systemName: "clear"))
                                        .font(.system(size: size - 5, weight: .semibold))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.leading, 8)
                        
                        // Button 0
                        Button(action: {
                            print("Button 0")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("0")
                                        .font(.system(size: size, weight: .heavy))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        
                        // Back button
                        Button(action: {
                            print("Back Button")
                        }, label: {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text(Image(systemName: "delete.left"))
                                        .font(.system(size: size - 5, weight: .semibold))
                                        .foregroundStyle(Color(uiColor: textColor))
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .tint(Color(uiColor: tintColor))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 20), style: FillStyle())
                        .padding(1)
                        .padding(.trailing, 8)
                    })
                })
                
                // Bottom Navigation Tab
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .foregroundStyle(Color(.white))
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.bottom, -10)
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                Spacer()
                
                
                
                
                }
            }
        }
    }
    

    


#Preview {
    MainScreen()
}
