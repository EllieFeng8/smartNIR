import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Core 1.0
// import QtQuick.Window

Rectangle {
    id: dashboard_Optimized_

    width: 1920
    height: 1080

    color: "#131313"
    border.color: "#564334"
    border.width: 1
    radius: 12
    property string currentPage: "Dashboard"
    RowLayout {
        anchors.fill: parent
        spacing:-2
        //side bar左
        Rectangle {
            id: aside_bar

            Layout.preferredWidth: parent.width * 0.2
            Layout.fillHeight: true

            color: "#1f1d1d"
            // radius: 12

            border.color: "#564334"
            border.width: 2
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 28
                spacing: 0

                Column {
                    Layout.fillWidth: true
                    spacing: 4

                    Text {
                        text: "SMARTNIR"
                        color: "#ffbd84"
                        font.pixelSize: 30
                        font.bold: true
                        font.letterSpacing: 2
                    }

                    Text {
                        text: Sn.version
                        color: "#d8c2b2"
                        font.pixelSize: 12
                        font.letterSpacing: 1
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    Layout.topMargin: 32
                    Layout.bottomMargin: 20
                    color: "#3f332a"
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    MenuItemButton {
                        title: "QUICK MEASURE"
                        active: currentPage === title
                        iconSource: Qt.resolvedUrl("assets/dashboard.png")
                        hoverIconSource: Qt.resolvedUrl("assets/dashboard1.png")
                        onClicked: (title) =>{
                            Sn.dashboardBtn = true
                            dashboard.visible = true
                            history.visible = false
                            settings.visible = false
                            engineering.visible = false
                            currentPage = title
                        }

                    }

                    MenuItemButton {
                        iconSource: Qt.resolvedUrl("assets/history.png")
                        hoverIconSource: Qt.resolvedUrl("assets/history1.png")
                        title: "History"
                        active: currentPage === title
                        onClicked: (title) => {
                            Sn.historyBtn = true
                            dashboard.visible = false
                            history.visible = true
                            settings.visible = false
                            engineering.visible = false
                            currentPage = title
                        }

                    }

                    MenuItemButton {
                        iconSource: Qt.resolvedUrl("assets/setting.png")
                        hoverIconSource: Qt.resolvedUrl("assets/setting1.png")
                        title: "Settings"
                        active: currentPage === title
                        onClicked: (title) =>{
                            Sn.settingsBtn = true
                            dashboard.visible = false
                            history.visible = false
                            settings.visible = true
                            engineering.visible = false
                            currentPage = title
                        }
                    }

                    MenuItemButton {
                        iconSource: Qt.resolvedUrl("assets/Engineering.png")
                        hoverIconSource: Qt.resolvedUrl("assets/Engineering1.png")
                        title: "Engineering"
                        active: currentPage === title
                        onClicked: (title) =>{
                            Sn.engineeringBtn = true
                            dashboard.visible = false
                            history.visible = false
                            settings.visible = false
                            engineering.visible = true
                            currentPage = title
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                }

                // Button {
                //     id: quickBtn
                //
                //     Layout.fillWidth: true
                //     height: 46
                //
                //     hoverEnabled: true
                //
                //     background: Rectangle {
                //         color: quickBtn.hovered ? "#ff9f1a" : "#1f1d1d"
                //         radius: 0
                //
                //         Behavior on color {
                //             ColorAnimation { duration: 120 }
                //         }
                //     }
                //
                //     contentItem: Row {
                //         anchors.centerIn: parent
                //         spacing: 5
                //
                //         Image {
                //             source:quickBtn.hovered ? "assets/quick1.png" : "assets/quick.png"
                //         }
                //
                //         Text {
                //             text: "QUICK MEASURE"
                //             color: quickBtn.hovered ? "#2b211a" : "#d8c2b2"// #2b211a
                //             font.pixelSize: 14
                //             font.bold: true
                //             font.letterSpacing: 2
                //         }
                //     }
                //
                //     MouseArea {
                //         anchors.fill: parent
                //         hoverEnabled: true
                //         cursorShape: Qt.PointingHandCursor
                //         acceptedButtons: Qt.NoButton
                //     }
                //
                //     onClicked: {
                //         Sn.quickBtn = true
                //         console.log("Quick Measure clicked")
                //     }
                // }
                //
                Button {
                    id: supportBtn

                    Layout.fillWidth: true
                    height: 46

                    hoverEnabled: true

                    background: Rectangle {
                        color: supportBtn.hovered ? "#ff9f1a" : "#1f1d1d"
                        radius: 0

                        Behavior on color {
                            ColorAnimation { duration: 120 }
                        }
                    }

                    contentItem: Row {
                        anchors.centerIn: parent
                        spacing: 5

                        Image {
                            source:supportBtn.hovered ? "assets/support1.png" : "assets/support.png"
                        }

                        Text {
                            text: "Support"
                            color: supportBtn.hovered ? "#2b211a" : "#d8c2b2"// #2b211a
                            font.pixelSize: 14
                            font.bold: true
                            font.letterSpacing: 2
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        acceptedButtons: Qt.NoButton
                    }

                    onClicked: {
                        Sn.supportBtn = true
                        console.log("Quick Measure clicked")
                    }
                }

            }
            component MenuItemButton: Rectangle {
                id: root

                property url iconSource: ""
                property url hoverIconSource: ""
                property string title: ""
                property bool active: false

                signal clicked(string title)

                Layout.fillWidth: true
                height: 54
                radius: 6

                color: {
                    if (mouseArea.pressed) return "#35302a"
                    if (active) return "#292622"
                    if (mouseArea.containsMouse) return "#252320"
                    return "transparent"
                }

                scale: mouseArea.pressed ? 0.98 : 1.0

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 12
                    spacing: 14

                    Image {
                        width: 22
                        height: 22
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit

                        // source: active || mouseArea.containsMouse
                        //         ? root.hoverIconSource
                        //         : root.iconSource
                        source: root.active || mouseArea.containsMouse
                            ? root.hoverIconSource
                            : root.iconSource
                    }

                    Text {
                        text: root.title
                        //color: active || mouseArea.containsMouse ? "#ff9800" : "#d8c2b2"
                        color: active || mouseArea.containsMouse
                            ? "#ff9800"
                            : "#d8c2b2"
                        font.pixelSize: 18
                        font.bold: active || mouseArea.containsMouse
                        font.letterSpacing: 1.5
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        root.clicked(root.title)
                        console.log(root.title + " clicked")
                    }
                }
            }

        }
        //dashboard 右

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            //header
            Rectangle {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height * 0.08
                color: "#101010"
                border.color: "#564334"
                border.width: 1
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 16
                            anchors.rightMargin: 50
                            // anchors.bottomMargin: 23
                            spacing: 0

                            Text {
                                text: Sn.nodeName
                                color: "#e8dfda"
                                font.pixelSize: 20
                                font.bold: true
                                font.letterSpacing: 3
                                verticalAlignment: Text.AlignVCenter
                                Layout.alignment: Qt.AlignVCenter
                            }

                            Item {
                                Layout.fillWidth: true
                            }


                        }

            }
            Dashboard {
                    id: dashboard
                    visible:true
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            History{
                    id: history
                    visible:false
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            Settings{
                    id: settings
                    visible:false
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            Engineering{
                    id: engineering
                    visible:false
                    Layout.fillWidth: true
                    Layout.fillHeight: true
            }
        }

}

}
