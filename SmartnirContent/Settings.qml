// RightContent.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import Core 1.0
Rectangle {
    id: root1
    color: "#131313"

    property string currentPage: "Settings"
    // x: 8

    // ColumnLayout {
    //     anchors.fill: parent
    //     //main
    //     Rectangle {
    //         id: section_LEFT_SECTION_DEVICE_STATUS

    //         x: 16
    //         y: 16

    //         height: 472
    //         width: 992

    //         color: "transparent"

    //         Image {
    //             id: overlay_Border_OverlayBlur

    //             clip: true
    //             source: Qt.resolvedUrl("assets/overlay_Border_OverlayBlur_11.png")
    //         }
    //         Image {
    //             id: overlay_Border_OverlayBlur_1

    //             x: 496

    //             clip: true
    //             source: Qt.resolvedUrl("assets/overlay_Border_OverlayBlur_12.png")
    //         }
    //     }
    //     Rectangle {
    //         id: section_RIGHT_SECTION_SETTINGS

    //         x: 16
    //         y: 488

    //         height: 472
    //         width: 992

    //         color: "transparent"

    //         Image {
    //             id: overlay_Border_OverlayBlur_2

    //             source: Qt.resolvedUrl("assets/overlay_Border_OverlayBlur_13.png")
    //         }
    //     }

    // }
    ColumnLayout {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 150

            // 上方兩張卡片
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 320
                spacing: 0

                HealthCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                ConnectionCard {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }

            // 下方控制區
            ControlPanel {
                Layout.fillWidth: true
                Layout.preferredHeight: 152
            }

            Item {
                Layout.fillHeight: true
            }
        }

        component HealthCard: Rectangle {
            color: "#181818"
            border.color: "#3a3028"
            border.width: 1

            Text {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 18
                text: "STATUS / HEALTH"
                color: "#b57b4f"
                font.pixelSize: 10
                font.letterSpacing: 4
            }

            Rectangle {
                width: 180
                height: 180
                radius: 90
                anchors.centerIn: parent
                color: "transparent"
                border.color: "#ffb176"
                border.width: 4

                layer.enabled: true

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: Sn.lightHealth+"%"
                        color: "#ffb176"
                        font.pixelSize: 40
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: Sn.healthOk ? "LIGHT HEALTH" : "LIGHT UNHEALTH"
                        color: "#e8d6c8"
                        font.pixelSize: 9
                        font.letterSpacing: 3
                    }

                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 52
                        height: 24
                        radius: 12
                        color:Sn.healthOk ? "#123b24":"#3b1212"
                        border.color: Sn.healthOk ? "#16c66a":"#ff5c5c"

                        Text {
                            anchors.centerIn: parent
                            text:Sn.healthOk ? "● OK" : "✘ Bad"
                            color: Sn.healthOk ? "#16ff7a" : "red"
                            font.pixelSize: 10
                            font.bold: true
                        }
                    }
                }
            }
        }

        component ConnectionCard: Rectangle {
            color: "#181818"
            border.color: "#3a3028"
            border.width: 1

            Text {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 18
                text: "SPECTROMETER CONNECTION"
                color: "#b57b4f"
                font.pixelSize: 10
                font.letterSpacing: 4
            }

            Column {
                anchors.centerIn: parent
                spacing: 18

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 128
                    height: 128
                    radius: 64
                    color: "transparent"
                    border.color: "#4a3324"
                    border.width: 2

                    Rectangle {
                        anchors.centerIn: parent
                        width: 108
                        height: 108
                        radius: 54
                        color: "transparent"
                        border.color: "#2f2f2f"
                        border.width: 1
                    }

                    Image {
                        // id: name
                        source: "assets/IconS.png"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 8

                    Text {
                        text: "●"
                        color: Sn.specConnected ? "#ffb176" :"red"
                        font.pixelSize: 16
                    }

                    Text {
                        text: Sn.specConnected ? "LINK ESTABLISHED" : "LINK DISCONNECTED"
                        color:Sn.specConnected ? "#ffb176" :"red"
                        font.pixelSize: 10
                        font.letterSpacing: 3
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "TERM_ID:" + Sn.termId
                    color: "#bfb2a6"
                    font.pixelSize: 11
                }
            }
        }

        component ControlPanel: Rectangle {
            color: "#181818"
            border.color: "#3a3028"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 42
                    Layout.alignment: Qt.AlignTop
                    color: "transparent"
                    border.color: "#5a3b25"

                    Text {
                        anchors.left: parent.left

                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10
                        text: "CUSTOM GRID DISPLAY CONTROL"
                        color: "#ffb176"
                        font.pixelSize: 16
                        font.letterSpacing: 4
                    }
                }

                GridLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    columns: 3
                    rowSpacing: 28
                    columnSpacing: 120
                    Layout.leftMargin:20

                    CheckBoxItem {
                        textValue: "SPECTRUM"
                        checked: true
                    }

                    CheckBoxItem {
                        textValue: "CUSTOM FIELD 01"
                        checked: true
                    }

                    CheckBoxItem {
                        textValue: "CUSTOM FIELD 02"
                        checked: false
                    }

                    CheckBoxItem {
                        textValue: "CUSTOM FIELD 03"
                        checked: false
                    }

                    CheckBoxItem {
                        textValue: "PREDICTION RESULTS"
                        checked: true
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }
            }

            Button {
                id: resetBtn
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: -5

                width: 136
                height: 54
                hoverEnabled: true

                background: Rectangle {
                    color: resetBtn.pressed
                           ? "#3a2414"
                           : resetBtn.hovered
                             ? "#2a211b"
                             : "#1a1a1a"
                    border.color: resetBtn.hovered
                                  ? "#ffc38f"
                                  : "#ffb176"
                    border.width: 1
                }

                contentItem: Text {
                    text: "RESET DEFAULTS"
                    color: resetBtn.hovered ? "#ffc38f" : "#ffb176"
                    font.pixelSize: 11
                    font.letterSpacing: 1.5
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    component CheckBoxItem : Item {
        id: root

        property bool checked: false
        property string textValue: ""

        implicitHeight: 24
        implicitWidth: row.implicitWidth

        Row {
            id: row
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10

            Rectangle {
                width: 16
                height: 16
                anchors.verticalCenter: parent.verticalCenter

                color: root.checked ? "#ffb176" : "transparent"
                border.color: "#ffb176"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: root.checked ? "✓" : ""
                    color: "#ffffff"
                    font.pixelSize: 13
                    font.bold: true
                }
            }

            Text {
                text: root.textValue
                anchors.verticalCenter: parent.verticalCenter
                color: "#d8c8b8"
                font.pixelSize: 13
                font.letterSpacing: 2
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.checked = !root.checked
        }
    }
}
