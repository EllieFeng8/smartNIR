// RightContent.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import Core 1.0
Rectangle {
    id: root
    color: "#131313"

    property string currentPage: "Dashboard"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        //main
        Rectangle {
        id: main_Content_Canvas

        // x: 16
        // y: 16

        Layout.fillWidth: true
        Layout.fillHeight: true

        clip: true
        color: "transparent"

        Rectangle {
            width: 635
            height: 655
            color: "#191919"
            border.color: "#303030"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 24
                spacing: 0

                // Header
                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 54

                    Column {
                        spacing: 6

                        Text {
                            text: "VISUAL SPECTRUM"
                            color: "#7f746c"
                            font.pixelSize: 10
                            font.family: "Consolas"
                        }

                        Text {
                            text: Sn.spectrumRange
                            color: "#ffb176"
                            font.pixelSize: 22
                            font.bold: true
                        }
                    }

                    Rectangle {
                        Layout.preferredWidth: 1
                        Layout.preferredHeight: 34
                        Layout.leftMargin: 16
                        Layout.rightMargin: 16
                        color: "#5a3a20"
                    }

                    Column {
                        spacing: 6

                        Text {
                            text: "INTEGRATION TIME"
                            color: "#7f746c"
                            font.pixelSize: 10
                            font.family: "Consolas"
                        }

                        Text {
                            text: Sn.integTime+"ms"
                            color: "#e8ddd0"
                            font.pixelSize: 13
                            font.family: "Consolas"
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }

                // Chart Area
                Item {
                    id: chartArea
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    // Grid lines
                    Repeater {
                        model: 4

                        Rectangle {
                            x: 8
                            y: chartArea.height * (index + 1) / 5
                            width: chartArea.width - 16
                            height: 1
                            color: "#2b2b2b"
                        }
                    }

                    Shape {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        ShapePath {
                            strokeColor: "#ff9500"
                            strokeWidth: 2
                            fillColor: "#251b12"

                            startX: 8
                            startY: chartArea.height * 0.82

                            PathCubic {
                                x: chartArea.width * 0.22
                                y: chartArea.height * 0.55
                                control1X: chartArea.width * 0.08
                                control1Y: chartArea.height * 0.82
                                control2X: chartArea.width * 0.16
                                control2Y: chartArea.height * 0.62
                            }

                            PathCubic {
                                x: chartArea.width * 0.34
                                y: chartArea.height * 0.86
                                control1X: chartArea.width * 0.27
                                control1Y: chartArea.height * 0.28
                                control2X: chartArea.width * 0.31
                                control2Y: chartArea.height * 0.95
                            }

                            PathCubic {
                                x: chartArea.width * 0.52
                                y: chartArea.height * 0.34
                                control1X: chartArea.width * 0.39
                                control1Y: chartArea.height * 0.95
                                control2X: chartArea.width * 0.38
                                control2Y: chartArea.height * 0.22
                            }

                            PathCubic {
                                x: chartArea.width * 0.69
                                y: chartArea.height * 0.68
                                control1X: chartArea.width * 0.62
                                control1Y: chartArea.height * 0.23
                                control2X: chartArea.width * 0.61
                                control2Y: chartArea.height * 0.76
                            }

                            PathCubic {
                                x: chartArea.width * 0.85
                                y: chartArea.height * 0.39
                                control1X: chartArea.width * 0.74
                                control1Y: chartArea.height * 0.56
                                control2X: chartArea.width * 0.80
                                control2Y: chartArea.height * 0.34
                            }

                            PathCubic {
                                x: chartArea.width * 0.93
                                y: chartArea.height * 0.76
                                control1X: chartArea.width * 0.91
                                control1Y: chartArea.height * 0.31
                                control2X: chartArea.width * 0.94
                                control2Y: chartArea.height * 0.72
                            }

                            PathLine {
                                x: chartArea.width - 8
                                y: chartArea.height * 0.80
                            }

                            PathLine {
                                x: chartArea.width - 8
                                y: chartArea.height * 0.90
                            }

                            PathLine {
                                x: 8
                                y: chartArea.height * 0.90
                            }
                        }
                    }

                    Text {
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 2
                        anchors.bottomMargin: 10
                        text: "X-AXIS: WAVELENGTH (NM)   Y-AXIS: INTENSITY (A.U.)"
                        color: "#6f6258"
                        font.pixelSize: 10
                        font.family: "Consolas"
                    }
                }
            }
        }
        Rectangle {
            id: section_Right_Panel_Inference_Values

            x: 666.67
            y: 16

            height: 655
            width: 309.33

            clip: true
            color: "transparent"

            Column{
                anchors.fill:parent
                spacing: 10
                Rectangle {

                width: parent.width
                height: 123
                // Layout.preferredWidth: 110

                color: "#1a1a1a"
                border.color: "#222526"
                border.width: 1
                radius: 2

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 左邊橘色線
                    Rectangle {
                        Layout.preferredWidth: 3
                        Layout.fillHeight: true
                        color: "#ffb37a"
                    }

                    // 內容區
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Layout.leftMargin: 18
                        Layout.rightMargin: 18
                        Layout.topMargin: 14
                        Layout.bottomMargin: 14

                        spacing: 6

                        Text {
                            text: "FAT（脂肪）"
                            color: "#f2e4d8"
                            font.pixelSize: 12
                            font.letterSpacing: 2
                        }

                        RowLayout {
                            spacing: 6

                            Text {
                                id: fatValue
                                text: Sn.fat
                                color: "#ffb37a"
                                font.pixelSize: 50
                                font.weight: Font.Light
                            }

                            Text {
                                text: "%"
                                color: "#f2e4d8"
                                font.pixelSize: 18

                                Layout.alignment: Qt.AlignBottom
                                Layout.bottomMargin: 10
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 4

                            color: "#3a3a3a"
                            radius: 2

                            Rectangle {
                                width: parent.width * 0.32
                                height: parent.height
                                color: "#ffb37a"
                                radius: 2
                            }
                        }
                    }
                }

            }

            Rectangle {

                width: parent.width
                height: 123
                // Layout.preferredWidth: 110

                color: "#1a1a1a"
                border.color: "#222526"
                border.width: 1
                radius: 2

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 左邊橘色線
                    Rectangle {
                        Layout.preferredWidth: 3
                        Layout.fillHeight: true
                        color: "#ffb37a"
                    }

                    // 內容區
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Layout.leftMargin: 18
                        Layout.rightMargin: 18
                        Layout.topMargin: 14
                        Layout.bottomMargin: 14

                        spacing: 6

                        Text {
                            text: "PROTEIN (蛋白質)"
                            color: "#f2e4d8"
                            font.pixelSize: 12
                            font.letterSpacing: 2
                        }

                        RowLayout {
                            spacing: 6

                            Text {
                                id: proteinValue
                                text: Sn.protein
                                color: "#ffb37a"
                                font.pixelSize: 50
                                font.weight: Font.Light
                            }

                            Text {
                                text: "%"
                                color: "#f2e4d8"
                                font.pixelSize: 18

                                Layout.alignment: Qt.AlignBottom
                                Layout.bottomMargin: 10
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 4

                            color: "#3a3a3a"
                            radius: 2

                            Rectangle {
                                width: parent.width * 0.32
                                height: parent.height
                                color: "#ffb37a"
                                radius: 2
                            }
                        }
                    }
                }
            }
            Rectangle {

                width: parent.width
                height: 123
                // Layout.preferredWidth: 110

                color: "#1a1a1a"
                border.color: "#222526"
                border.width: 1
                radius: 2

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    // 左邊橘色線
                    Rectangle {
                        Layout.preferredWidth: 3
                        Layout.fillHeight: true
                        color: "#ffb37a"
                    }

                    // 內容區
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        Layout.leftMargin: 18
                        Layout.rightMargin: 18
                        Layout.topMargin: 14
                        Layout.bottomMargin: 14

                        spacing: 6

                        Text {
                            text: "WATER (水分)"
                            color: "#f2e4d8"
                            font.pixelSize: 12
                            font.letterSpacing: 2
                        }

                        RowLayout {
                            spacing: 6

                            Text {
                                id: waterValue
                                text: Sn.water
                                color: "#ffb37a"
                                font.pixelSize: 50
                                font.weight: Font.Light
                            }

                            Text {
                                text: "%"
                                color: "#f2e4d8"
                                font.pixelSize: 18

                                Layout.alignment: Qt.AlignBottom
                                Layout.bottomMargin: 10
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 4

                            color: "#3a3a3a"
                            radius: 2

                            Rectangle {
                                width: parent.width * 0.32
                                height: parent.height
                                color: "#ffb37a"
                                radius: 2
                            }
                        }
                    }
                }
            }

            // Rectangle {
            //     id: _margin_2

            //     y: 284

            //     height: 126
            //     width: 305.33

            //     color: "transparent"

            //     Image {
            //         id: overlay_Border_OverlayBlur_2

            //         source: Qt.resolvedUrl("assets/overlay_Border_OverlayBlur_9.png")
            //     }
            // }


            // Image {
            //     id: overlay_Border_OverlayBlur_3

            //     y: 426

            //     source: Qt.resolvedUrl("assets/overlay_Border_OverlayBlur_10.png")
            // }
            Rectangle {
                // Layout.fillWidth: true
                // Layout.preferredHeight: 280
                width: parent.width
                height: 280
                color: "#111111"
                border.color: "#1f1f1f"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 12

                    Text {
                        text: "CUSTOM FIELDS"
                        color: "#666666"
                        font.pixelSize: 12
                        font.bold: true
                        Layout.fillWidth: true
                    }

                    // FIELD 01
                    Text {
                        text: "FIELD 01"
                        color: "#ddc1ae"
                        font.pixelSize: 11
                        font.bold: true
                    }

                    TextField {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 34

                        text: Sn.field1

                        color: "#d8d8d8"
                        placeholderTextColor: "#666666"

                        background: Rectangle {
                            color: "#151515"
                            border.color: "#2b2b2b"
                            border.width: 1
                        }
                    }

                    // FIELD 02
                    Text {
                        text: "FIELD 02"
                        color: "#ddc1ae"
                        font.pixelSize: 11
                        font.bold: true
                    }

                    TextField {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 34

                        // placeholderText: "Enter value ..."
                        color: "#d8d8d8"
                        text:Sn.field2
                        background: Rectangle {
                            color: "#151515"
                            border.color: "#2b2b2b"
                            border.width: 1
                        }
                    }

                    // FIELD 03
                    Text {
                        text: "FIELD 03"
                        color: "#ddc1ae"
                        font.pixelSize: 11
                        font.bold: true
                    }

                    TextField {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 34
                        text:Sn.field3
                        // placeholderText: "Enter value ..."
                        color: "#d8d8d8"

                        background: Rectangle {
                            color: "#151515"
                            border.color: "#2b2b2b"
                            border.width: 1
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }
            }
            }
        }

    }

        //footer
        Rectangle {
        id:footer
        Layout.preferredWidth: parent.width *0.98
        Layout.preferredHeight: 67

        color: "#101010"
        Rectangle {
                id: bottomBar

                width: parent.width
                height: 64

                color: "#1f1e1d"

                border.color: "#3a3028"
                border.width: 1

                Row {
                    anchors.fill: parent
                    spacing: 0
                    // anchors.rightMargin: 50
                    // =========================
                    // WHITE CALIBRATION
                    // =========================

                    Button {
                        id: whiteBtn

                        width: parent.width / 3
                        height: parent.height

                        hoverEnabled: true

                        background: Rectangle {
                            color: whiteBtn.down
                                   ? "#e67d00"
                                   : whiteBtn.hovered
                                     ? "#ff8c00"
                                     : "#1f1e1d"

                            border.color: "#3a3028"
                            border.width: 1

                            Behavior on color {
                                ColorAnimation {
                                    duration: 120
                                }
                            }
                        }

                        contentItem: Item {

                            Row {
                                anchors.centerIn: parent
                                spacing: 10

                                Image {
                                    source: whiteBtn.hovered
                                            ? "assets/white1.png"
                                            : "assets/white.png"

                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Text {
                                    text: "WHITE CALIBRATION"

                                    color:whiteBtn.hovered
                                          ? "#564334" : "#d9c4b5"
                                    font.pixelSize: 14
                                    font.bold: true
                                    font.letterSpacing: 2

                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            acceptedButtons: Qt.NoButton
                        }

                        onClicked: {
                            Sn.whiteBtn = true
                            console.log("WHITE CALIBRATION")
                        }
                    }
                    // =========================
                    // MEASURE
                    // =========================
                    Button {
                        id: measureBtn
                        width: parent.width / 3
                        height: parent.height
                        // Layout.preferredWidth:parent.width*0.1

                        hoverEnabled: true

                        background: Rectangle {
                            color:measureBtn.down
                                  ? "#e67d00"
                                  : measureBtn.hovered
                                    ? "#ff8c00"
                                    : "#1f1e1d"

                            border.color: "#3a3028"
                            border.width: 1

                            Behavior on color {
                                ColorAnimation {
                                    duration: 120
                                }
                            }
                        }



                        contentItem:  Item {
                            Row {
                                anchors.centerIn: parent
                                spacing: 10

                                Image {
                                    source: whiteBtn.hovered
                                            ? "assets/measure1.png"
                                            : "assets/measure.png"

                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Text {
                                    text: "MEASURE"
                                    color:measureBtn.hovered
                                          ? "#564334" : "#d9c4b5"// "#2c2018"
                                    font.pixelSize: 16
                                    font.bold: true
                                    font.letterSpacing: 4
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            acceptedButtons: Qt.NoButton
                        }

                        onClicked: {
                            Sn.measureBtn = true
                            console.log("MEASURE")
                        }
                    }

                    // =========================
                    // ITEM SELECT
                    // =========================
                    ItemSelectButton {
                        width: parent.width / 3
                        height: parent.height
                        // Layout.preferredWidth:parent.width*0.1
                    }
                }
            }

            // =========================================================
            // ITEM SELECT BUTTON
            // =========================================================
            component ItemSelectButton: Rectangle {

                id: select
                Layout.fillWidth: true
                Layout.fillHeight: true
                property bool opened: false
                property string currentText: ""

                color: mouseArea1.containsMouse
                       ? "#2a2724"
                       : "#242220"

                border.color: "#3a3028"
                border.width: 1

                Behavior on color {
                    ColorAnimation {
                        duration: 120
                    }
                }

                Row {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        text: "☰"
                        color:mouseArea1.containsMouse
                              ? "#ffb26b" : "#d9c4b5"
                        font.pixelSize: 14
                    }

                    Text {
                        text: "ITEM SELECT"
                        color: mouseArea1.containsMouse
                               ? "#ffb26b" : "#d9c4b5"
                        font.pixelSize: 14
                        font.bold: true
                        font.letterSpacing: 2
                    }

                    Text {
                        text: select.opened ? "▲" : "▼"
                        color: mouseArea1.containsMouse
                               ? "#ffb26b" : "#d9c4b5"
                        font.pixelSize: 10
                    }
                }

                MouseArea {
                    id: mouseArea1

                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        Sn.itemBtn = true
                        select.opened = !select.opened
                    }
                }

                // =========================
                // Dropdown
                // =========================
                Column {
                    visible: select.opened

                    width: parent.width
                    // height: 120

                    anchors.left: parent.left
                    anchors.bottom: parent.top

                    Repeater {
                        model: Sn.itemName
                        // [
                        //     "ITEM 03",
                        //     "ITEM 02 (SELECTED)",
                        //     "ITEM 01"
                        // ]

                        Rectangle {

                            width: parent.width
                            height: 40
                            property bool selected: select.currentText === modelData
                            color: mouseArea.pressed
                                ? "#4a3423"
                                : selected
                                    ? "#3a3028"
                                    : mouseArea.containsMouse
                                        ? "#3a342f"
                                        : "#2b2b2b"

                            border.color: mouseArea.containsMouse ? "#ff9800" : "#3a3028"
                            border.width: 1

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent

                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                // onEntered: parent.color = "#3a342f"
                                // onExited: {
                                //     parent.color = index === 1
                                //                    ? "#332d29"
                                //                    : "#2b2b2b"
                                // }

                                onClicked: {
                                    console.log(modelData.name)
                                    select.currentText = modelData.name
                                    select.opened = false
                                }
                            }

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 18

                                text: modelData.name

                                color: mouseArea.containsMouse || parent.selected
                                    ? "#ff9800"
                                    : "#d8c2b2"


                                font.pixelSize: 11
                                font.letterSpacing: 1
                            }
                        }
                    }
                }

        }
    }


    }

}
