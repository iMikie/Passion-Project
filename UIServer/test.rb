hsh = "accelKey: #accelMods: #accelText: #altId: 0#armBorder: true#armFill: false#armed: false#armedIcon: 0#autoArm: false#autoHilite: true#backColor: #backPattern: #behavior: #blendLevel: 0#borderColor: #borderPattern: #borderWidth: 2#bottomColor: #bottomPattern: #cantSelect: false#colorOverlay: #default: false#disabled: false#disabledIcon: 0#dropShadow: #family: 0#focusColor: #focusPattern: #foreColor: #forePattern: #hiliteBorder: true#hiliteColor: #hiliteFill: false#hiliteIcon: 0#hilitePattern: #hilited: false#hoverIcon: 0#icon: 0#iconGravity: #id: 1102#ink: srcCopy#innerGlow: #innerShadow: #label: #labelWidth: 0#layer: 26#layerMode: static#lockLoc: false#margins: 4#menuHistory: 1#menuLines: 5#menuMode: #menuMouseButton: 1#menuName: #mnemonic: 0#name: click me#opaque: true#outerGlow: #rect: 539,363,667,395#shadow: false#shadowColor: #shadowOffset: 4#shadowPattern: #sharedHilite: true#showBorder: true#showFocusBorder: true#showHilite: false#showIcon: false#showName: true#style: standard#text: #textAlign: center#textFont: #textSize: #textStyle: #threeD: true#titleWidth: 0#toolTip: #topColor: #topPattern: #traversalOn: true#visible: true#visitedIcon: 0"


ar = hsh.split("#")
ar2 = ar.map do |str|
  i = str.index(' ')
  str =  str.insert(i+ 1 ,"'")
  str =  str.insert(str.length, "',")
end

ar2 = ar2.reject{|item| item.include?("''")}

str = '{' + ar2.join(' ') + '}'
puts "str: "+ str
hsh = eval str

puts hsh[:armBorder] == true
p hsh

