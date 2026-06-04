// RightContent.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import Core 1.0
Rectangle {
    id: root1
    color: "#131313"

    property string currentPage: "History"
    property string startDate: "10 / 12"
    property string endDate: "10 / 19"
    ColumnLayout {
            anchors.fill: parent
            anchors.margins: 24
            spacing: 16

            // ===== Top Filters =====
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 56
                spacing: 16

                // FilterBox {
                //    title: "TEMPORAL WINDOW"
                //    // iconSource: Qt.resolvedUrl("assets/calendar.png")
                //    // value: " OCT 12 - OCT 19"
                //    // Layout.preferredWidth: 175
                // }

                FilterBox {
                    title: "OBJECT CLASS"
                    iconSource: Qt.resolvedUrl("assets/class.png")
                    value: "ALL MEASUREMENTS"
                    // Layout.preferredWidth: 205
                }
                // Item { Layout.preferredWidth: 50 }
                ColumnLayout {
                    width: 447
                    spacing: 6



                    Text {
                        text: "TEMPORAL WINDOW"
                        color: "#9c8066"
                        font.pixelSize: 11
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 54
                        color: "#1b1b1b"
                        border.color: "#2f2f2f"
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 18
                            anchors.rightMargin: 18
                            spacing: 14

                            Text {
                                text: "▣"
                                color: "#ffb176"
                                font.pixelSize: 24
                            }

                            DateInput {
                                id: startInput
                                text: startDate
                                onDateSelected: startDate = value
                            }

                            Text {
                                text: "-"
                                color: "#d8c8b8"
                                font.pixelSize: 16
                                font.bold: true
                            }

                            DateInput {
                                id: endInput
                                text: endDate
                                onDateSelected: endDate = value
                            }

                            Item { Layout.fillWidth: true }

                            Button {
                                id: applyBtn

                                Layout.preferredWidth: 90
                                Layout.preferredHeight: 36

                                hoverEnabled: true

                                background: Rectangle {
                                    radius: 4

                                    color: applyBtn.down
                                        ? "#3a2a18"
                                        : applyBtn.hovered
                                            ? "#2b2118"
                                            : "transparent"

                                    border.color: "#ffb176"
                                    border.width: 1

                                    Behavior on color {
                                        ColorAnimation { duration: 120 }
                                    }
                                }

                                contentItem: Text {
                                    text: "APPLY"
                                    color: "#ffb176"
                                    font.pixelSize: 12
                                    font.bold: true

                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                                onClicked: {
                                    startDate = startInput.text
                                    endDate = endInput.text

                                    console.log("Start Date:", startDate)
                                    console.log("End Date:", endDate)

                                    // 呼叫後端
                                    // Sn.queryHistory(startDate, endDate)
                                }
                            }
                        }
                    }

                    component DateInput: TextField {
                        id: input

                        signal dateSelected(string value)

                        Layout.preferredWidth: 100
                        height: 36

                        color: "#d8c8b8"
                        font.pixelSize: 14
                        font.bold: true
                        selectByMouse: true
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter

                        background: Rectangle {
                            color: mouseArea.containsMouse || input.activeFocus
                                ? "#25201b"
                                : "transparent"
                            border.color: input.activeFocus ? "#ffb176" : "transparent"
                            border.width: 1
                            radius: 4
                        }

                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.IBeamCursor
                            acceptedButtons: Qt.NoButton
                        }

                        Keys.onReturnPressed: input.dateSelected(input.text)
                        Keys.onEnterPressed: input.dateSelected(input.text)
                    }


                }
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 4

                    Text {
                        text: "SEARCH ID"
                        color: "#b58c6a"
                        font.pixelSize: 12
                        font.family: "Consolas"
                    }

                    TextField {
                        id: searchField

                        Layout.preferredWidth: 250
                        Layout.preferredHeight: 54

                        placeholderText: "REF_4491..."
                        placeholderTextColor: "#6f7685"

                        color: "#8a91a3"
                        font.pixelSize: 18
                        font.family: "Consolas"

                        leftPadding: 50
                        rightPadding: 16

                        background: Rectangle {
                            color: "#1b1c1f"
                            border.color: "#353535"
                            border.width: 1
                        }

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 16

                            source: "assets/search.png"
                            width: 24
                            height: 24
                        }
                    }
                }

                Item { Layout.preferredWidth: 250 }

                Button {
                    id: exportBtn
                    Layout.topMargin: 16
                    hoverEnabled: true
                    Layout.preferredWidth: 176
                    Layout.preferredHeight: 60

                    background: Rectangle {
                    color:exportBtn.down
                          ? "#3a2a18"
                          : exportBtn.hovered
                            ? "#2b2118"
                            : "transparent"
                    border.color: "#ffb266"
                    border.width: 1
                    Behavior on color {
                        ColorAnimation {
                            duration: 120
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
                    Sn.exportBtn = true
                    console.log("History exportBtn")
                }
                contentItem: Row {
                        // anchors.centerIn: parent
                        spacing: 10
                        topPadding: 7
                        // anchors.verticalCenter: parent.verticalCenter
                        Image {
                            source: "assets/icon.png"
                            width: 20
                            height: 20
                        }
                        Text {
                            text: "  EXPORT DATA"
                            color: exportBtn.hovered
                                   ? "#ffd2a1"
                                   : "#ffb266"
                            font.bold: true
                            font.pixelSize: 13
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            Behavior on color {
                               ColorAnimation {
                                   duration: 120
                               }
                           }
                        }
                    }
                }

            }

            // ===== Table =====
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 438
                color: "#171717"
                border.color: "#2f2a26"
                border.width: 1

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 42
                        color: "#2a2a2a"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16

                            Text {
                                text: "HISTORICAL LOG // PAGE 01"
                                color: "#d8c8b8"
                                font.pixelSize: 12
                                font.bold: true
                                font.letterSpacing: 1.5
                            }

                            Item { Layout.fillWidth: true }

                            Text {
                                text: "STREAMING ENCRYPTED..."
                                color: "#ffb266"
                                font.pixelSize: 10
                                font.letterSpacing: 1
                            }
                        }
                    }

                    // TableHeader {}
                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        spacing: 0

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 350
                            color: "#191918"
                            border.color: "#3a2a1f"
                            border.width: 1

                            ListView {
                                id: dataList
                                anchors.fill: parent
                                clip: true

                                header: RowLayout {
                                    width: dataList.width
                                    height: 52
                                    spacing: 0
                                    Item { Layout.preferredWidth: 90 }
                                    HeaderText { text: "UID"; Layout.preferredWidth: 165 }
                                    HeaderText { text: "TIMESTAMP"; Layout.preferredWidth: 285 }
                                    HeaderText { text: "MEASUREMENT UNIT"; Layout.preferredWidth: 205}
                                    // Item { Layout.preferredWidth: 50 }
                                    HeaderText { text: "MAGNITUDE"; Layout.preferredWidth: 280 }
                                    HeaderText { text: "STATUS"; Layout.preferredWidth: 250;Layout.alignment: Qt.AlignRight}

                                }

                                model: ListModel {
                                    ListElement { uid: "#SX-9942"; time: "2023.10.19 14:22:01"; unit: "PROTEIN"; mag: "15.6"; status: "NOMINAL";   critical: false; archived: false }
                                    ListElement { uid: "#SX-9940"; time: "2023.10.19 13:05:44"; unit: "FAT";     mag: "22.3"; status: "CRITICAL";  critical: true;  archived: false }
                                    ListElement { uid: "#SX-9938"; time: "2023.10.19 11:45:12"; unit: "WATER";   mag: "75.4"; status: "NOMINAL";   critical: false; archived: false }
                                    ListElement { uid: "#SX-9931"; time: "2023.10.18 23:59:00"; unit: "PROTEIN"; mag: "12.3"; status: "ARCHIVED";  critical: false; archived: true }
                                    ListElement { uid: "#SX-9925"; time: "2023.10.18 21:12:33"; unit: "PROTEIN"; mag: "16.5"; status: "NOMINAL";   critical: false; archived: false }
                                }

                                delegate: Rectangle {
                                    width: dataList.width
                                    height: 63
                                    color: mouseArea.containsMouse ? "#22201e" : "#191918"

                                    Rectangle {
                                        anchors.top: parent.top
                                        width: parent.width
                                        height: 1
                                        color: "#2a2927"
                                    }

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: 18
                                        anchors.rightMargin: 18
                                        spacing: 0
                                        Item { Layout.preferredWidth: 50 }
                                        Text {
                                            text: uid
                                            color: "#ffb36b"
                                            font.pixelSize: 18
                                            font.bold: true
                                            Layout.preferredWidth: 165
                                            Layout.alignment: Qt.AlignVCenter
                                        }

                                        Text {
                                            text: time
                                            color: "#d8c8bd"
                                            font.pixelSize: 18
                                            Layout.preferredWidth: 285
                                            Layout.alignment: Qt.AlignVCenter
                                        }

                                        Text {
                                            text: unit
                                            color: "#d8d8d8"
                                            font.pixelSize: 18
                                            Layout.preferredWidth: 205
                                            Layout.alignment: Qt.AlignVCenter
                                        }
                                        // Item { Layout.filldWidth: true }
                                        Text {
                                            text: mag
                                            color: critical ? "#ff9a9a" : "#ffb36b"
                                            font.pixelSize: 18
                                            font.bold: true
                                            Layout.alignment: Qt.AlignVCenter
                                            Layout.preferredWidth: 280
                                        }

                                        Rectangle {
                                            Layout.preferredWidth: 200
                                            Layout.preferredHeight: 26
                                            Layout.alignment: Qt.AlignVCenter
                                            // width: 74
                                            // height: 26
                                            radius: 3
                                            color: archived ? "#3a3a3a" : critical ? "#4b1f25" : "#3a2a1f"
                                            border.color: archived ? "#555555" : critical ? "#8b3940" : "#8a633d"

                                            Text {
                                                anchors.centerIn: parent
                                                text: status
                                                color: archived ? "#9b9b9b" : critical ? "#ffaaaa" : "#ffb36b"
                                                font.pixelSize: 11
                                            }
                                        }
                                    }

                                    MouseArea {
                                        id: mouseArea
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        cursorShape: Qt.PointingHandCursor
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#171717"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 16

                            Text {
                                text: "RECORDS: 12,841 FOUND"
                                color: "#9c897b"
                                font.pixelSize: 10
                                font.letterSpacing: 1
                            }

                            Item { Layout.fillWidth: true }

                            Text {
                                text: "ROWS"
                                color: "#9c897b"
                                font.pixelSize: 10
                            }

                            ButtonSmall { textValue: "50⌄" }
                            ButtonSmall { textValue: "‹" }
                            ButtonSmall { textValue: "01"; active: true }
                            ButtonSmall { textValue: "02" }
                            ButtonSmall { textValue: "03" }
                            ButtonSmall { textValue: "›" }
                        }
                    }
                }
            }

            // ===== Bottom Cards =====
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 45
                spacing: 16

                InfoCard {
                    title: "ACTIVE SENSORS"
                    value: "04/04"
                }

                InfoCard {
                    title: "INTEGRITY"
                    value: "99.8%"
                }

                InfoCard {
                    title: "UPTIME"
                    value: "742H"
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200
                    color: "#181818"
                    border.color: "#2f2a26"

                    Column {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 18

                        Text {
                            text: "NODE HEALTH"
                            color: "#ffb266"
                            font.pixelSize: 10
                            font.bold: true
                        }

                        Text {
                            text: "SYNC_STABLE_001"
                            color: "#d8c8b8"
                            font.pixelSize: 13
                        }
                    }
                }
            }

            Item { Layout.fillHeight: true }
        }

        // ===== Components =====

        component FilterBox: ColumnLayout {
            id:root
            property string title: ""
            property string value: ""
            property url iconSource: ""

            spacing: 4

            Text {
                text: title
                color: "#9c897b"
                font.pixelSize: 10
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 54
                Layout.preferredWidth: 1
                color: "#1b1b1b"
                border.color: "#2f2f2f"

                // anchors.centerIn: parent
                Row{
                    // anchors.centerIn: parent
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 20
                    spacing: 10
                    Image{
                        id:icon
                        width: 22
                        height: 22

                        // anchors.horizontalCenter:  parent.horizontalCenter
                        fillMode: Image.PreserveAspectFit

                        source: root.iconSource

                    }

                    Text {
                        text: value
                        color: "#d8c8b8"
                        font.pixelSize: 12
                        font.bold: true
                        font.letterSpacing: 1
                        // anchors.left:icon.right
                        // anchors.leftMargin:10
                        anchors.top:icon.top
                        anchors.topMargin:5
                    }
                }

            }
        }

        // component TableHeader: Rectangle {
        //     Layout.fillWidth: true
        //     Layout.preferredHeight: 46
        //     color: "#171717"
        //     border.color: "#3a2e25"

        //     RowLayout {
        //         anchors.fill: parent
        //         anchors.leftMargin: 16
        //         anchors.rightMargin: 16

        //         HeaderText { textValue: "UID"; Layout.preferredWidth: 130 }
        //         HeaderText { textValue: "TIMESTAMP"; Layout.preferredWidth: 260 }
        //         HeaderText { textValue: "MEASUREMENT UNIT"; Layout.preferredWidth: 280 }
        //         Item { Layout.fillWidth: true }
        //         HeaderText { textValue: "MAGNITUDE"; Layout.preferredWidth: 220 }
        //         HeaderText { textValue: "STATUS"; Layout.preferredWidth: 210 }

        //     }
        // }
    component HeaderText: Text {
            property bool alignRight: false

            color: "#9d8b7c"
            font.pixelSize: 12
            font.bold: true
            font.letterSpacing: 2
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: alignRight ? Text.AlignRight : Text.AlignLeft
        }

        // component HeaderText: Text {
        //     property string textValue: ""
        //     text: textValue
        //     color: "#9c897b"
        //     font.pixelSize: 10
        //     font.bold: true
        //     font.letterSpacing: 1.5
        //     verticalAlignment: Text.AlignVCenter
        // }

        // component LogRow: Rectangle {
        //     property string uid: ""
        //     property string timestamp: ""
        //     property string unit: ""
        //     property string magnitude: ""
        //     property string status: ""
        //     property color statusColor: "#333333"
        //     property color textColor: "#ffb266"

        //     Layout.fillWidth: true
        //     Layout.preferredHeight: 57
        //     color: "#171717"
        //     border.color: "#252525"

        //     RowLayout {
        //         anchors.fill: parent
        //         anchors.leftMargin: 16
        //         anchors.rightMargin: 16

        //         Text {
        //             text: uid
        //             color: "#ffb266"
        //             font.pixelSize: 16
        //             font.bold: true
        //             Layout.preferredWidth: 130
        //         }

        //         Text {
        //             text: timestamp
        //             color: "#d8c8b8"
        //             font.pixelSize: 16
        //             Layout.preferredWidth: 260
        //         }

        //         Text {
        //             text: unit
        //             color: "#d8c8b8"
        //             font.pixelSize: 16
        //             Layout.preferredWidth: 280
        //         }
        //         Item { Layout.fillWidth: true }
        //         Text {
        //             text: magnitude
        //             color: textColor
        //             font.pixelSize: 16
        //             font.bold: true
        //             Layout.preferredWidth: 400
        //             horizontalAlignment: Text.AlignHCenter
        //         }
        //         Item {
        //             Layout.preferredWidth: 150
        //             // Layout.fillHeight: true
        //             Rectangle {
        //                 Layout.preferredWidth: 80
        //                 Layout.preferredHeight: 23
        //                 // Layout.fillHeight: true
        //                 // color: statusColor
        //                 border.color: Qt.lighter(statusColor, 1.5)
        //                 radius: 2

        //                 Text {
        //                     anchors.centerIn: parent
        //                     text: status
        //                     color: textColor
        //                     font.pixelSize: 9
        //                     font.bold: true
        //                 }
        //             }
        //         }


        //         Text {
        //             text: "↗"
        //             color: "#b79d8b"
        //             font.pixelSize: 24
        //         }
        //     }
        // }

        component ButtonSmall: Rectangle {
            property string textValue: ""
            property bool active: false

            Layout.preferredWidth: 32
            Layout.preferredHeight: 32
            color: active ? "#2a2119" : "#1a1a1a"
            border.color: active ? "#ffb266" : "#3a3028"

            Text {
                anchors.centerIn: parent
                text: textValue
                color: active ? "#ffb266" : "#b79d8b"
                font.pixelSize: 11
                font.bold: true
            }
        }

        component InfoCard: Rectangle {
            property string title: ""
            property string value: ""

            Layout.fillWidth: true
            Layout.preferredHeight: 200
            color: "#181818"
            border.color: "#2f2a26"

            Column {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 18
                spacing: 6

                Text {
                    text: title
                    color: "#9c897b"
                    font.pixelSize: 10
                    font.bold: true
                    font.letterSpacing: 1
                }

                Text {
                    text: value
                    color: "#ffb266"
                    font.pixelSize: 25
                    font.bold: true
                }
            }
        }

}
