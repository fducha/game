import QtQuick 2.8

Rectangle {
    width: root.width
    height: root.height

    Image {
        id: root
        property int dayLenght: 60000
//        fillMode: Image.TileHorizontally
        source: "qrc:/images/sky.png"


        Item {
            id: sun
            x: 140
            y: root.height - 170
            Rectangle {
                id: sunVisual
                width: 40
                height: width
                radius: width / 2
                color: "yellow"
                anchors.centerIn: parent

                SequentialAnimation on color {

                    ColorAnimation {
                        from: "red"
                        to: "yellow"
                        duration: 0.2 * root.dayLenght / 2
                    }


                    PauseAnimation {
                        duration: 2 * 0.8 * root.dayLenght / 2
                    }

                    ColorAnimation {
                        to: "red"
                        duration: 0.2 * root.dayLenght / 2
                    }

                    running: true
                }
            }
        }

        Image {
            id: trees
            source: "qrc:/images/trees.png"
            x: -200
            anchors.bottom: parent.bottom
        }

        Image {
            source: "qrc:/images/grass.png"
            anchors.bottom: parent.bottom
        }


        NumberAnimation {
            target: sun
            property: "x"
            from: 0
            to: root.width
            duration: root.dayLenght
            running: true
        }

        SequentialAnimation {
            NumberAnimation {
                target: sun
                property: "y"
                easing.type: Easing.OutCubic
                from: root.height + sunVisual.height
                to: root.height - 270
                duration: root.dayLenght / 2
            }

            NumberAnimation {
                target: sun
                property: "y"
                easing.type: Easing.InCubic
                from: root.height - 270
                to: root.height + sunVisual.height
                duration: root.dayLenght / 2
            }
            running: true
        }
    }
}


