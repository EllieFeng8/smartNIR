// RightContent.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Shapes
import Core 1.0
Rectangle {
    id: root
    color: "#131313"

    property string currentPage: "Engineering"
    ColumnLayout {
           anchors.fill: parent
           anchors.margins: 24
           spacing: 32

           // ================= LOG MANAGEMENT =================
           Rectangle {
               Layout.fillWidth: true
               Layout.preferredHeight: 204
               color: "#171717"
               border.color: "#4a3324"
               border.width: 1

               ColumnLayout {
                   anchors.fill: parent
                   anchors.margins: 22
                   spacing: 15

                   Text {
                       text: "LOG MANAGEMENT"
                       color: "#ffb176"
                       font.pixelSize: 12
                       font.bold: true
                       font.letterSpacing: 4
                   }

                   Text {
                       text: "Data Export Terminal"
                       color: "#e8ddd0"
                       font.pixelSize: 20
                   }

                   RowLayout {
                       spacing: 12

                       DateInputBox {
                           labelText: "START PERIOD"
                       }

                       DateInputBox {
                           labelText: "END PERIOD"
                       }

                       Button {
                           id: exportBtn

                           Layout.preferredWidth: 102
                           Layout.preferredHeight: 41
                           Layout.alignment: Qt.AlignBottom

                           hoverEnabled: true

                           background: Rectangle {
                               color: exportBtn.pressed
                                      ? "#4a2f00"
                                      : exportBtn.hovered
                                        ? "#2d2418"
                                        : "transparent"

                               border.color: exportBtn.hovered
                                             ? "#ffb84d"
                                             : "#ff9500"

                               border.width: 1

                               Behavior on color {
                                   ColorAnimation { duration: 120 }
                               }


                           }

                           contentItem: Row {
                               anchors.centerIn: parent
                               spacing: 6

                               Image {
                                   width: 14
                                   height: 14

                                   source:  "assets/downlo.png"
                               }

                               Text {
                                   text: "EXPORT"
                                   color: exportBtn.hovered
                                          ? "#ffb84d"
                                          : "#ff9500"

                                   font.pixelSize: 10
                                   font.bold: true
                                   font.letterSpacing: 1

                                   Behavior on color {
                                       ColorAnimation { duration: 120 }
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
                               Sn.exportLogBtn = true
                               console.log("WHITE CALIBRATION")
                           }

                       }
                   }

                   Rectangle {
                       Layout.fillWidth: true
                       Layout.preferredHeight: 4
                       Layout.topMargin: 10
                       color: "#3b2d24"

                       Rectangle {
                           width: parent.width * 0.33
                           height: parent.height
                           color: "#ff9500"
                       }
                   }

               }

           }

           // ================= MIDDLE AREA =================
           RowLayout {
               Layout.fillWidth: true
               Layout.preferredHeight: 100
               spacing: 16

               ConfigurationPanel {
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   Layout.preferredWidth: 5
               }

               ColumnLayout {
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   Layout.preferredWidth: 3
                   spacing: 8

                   ParamRow {
                       title: "CUSTOM FIELD 1"
                       subtitle: "SYSTEM PARAM A"
                       valueText: Sn.field1Value
                   }

                   ParamRow {
                       title: "CUSTOM FIELD 2"
                       subtitle: "SYSTEM PARAM B"
                       valueText: Sn.field2Value
                       active: true
                   }

                   ParamRow {
                       title: "CUSTOM FIELD 3"
                       subtitle: "SYSTEM PARAM C"
                       valueText: Sn.field3Value
                   }
               }
           }

           // ================= SYSTEM LOG ================
           Rectangle {
               Layout.fillWidth: true
               Layout.preferredHeight: 300
               color: "#0b0b0b"
               border.color: "#5a3a24"
               border.width: 1

               ColumnLayout {
                   anchors.fill: parent
                   anchors.margins: 12
                   spacing: 8

                   RowLayout {
                       Layout.fillWidth: true

                       Text {
                           text: "SYSTEM_EVENT_LOG"
                           color: "#ffb176"
                           font.pixelSize: 9
                           font.family: "Consolas"
                       }

                       Item { Layout.fillWidth: true }

                       Text {
                           text: "AUTO_SCROLL: ON"
                           color: "#ffb176"
                           font.pixelSize: 9
                           font.family: "Consolas"
                       }
                   }

                   ListView {
                       id: logListView

                       Layout.fillWidth: true
                       Layout.fillHeight: true

                       clip: true
                       spacing: 6

                       model: ListModel {
                           id: logModel

                           ListElement { msg: "[14:24:15] CONFIG_PARSER UPDATED ENTRIES (14)" }
                           ListElement { msg: "[14:24:10] POLLING_SERVER ACTIVE... RECV 200 OK" }
                           ListElement { msg: "[14:24:15] CONFIG_PARSER UPDATED ENTRIES (14)" }
                           ListElement { msg: "[14:24:15] CONFIG_PARSER UPDATED ENTRIES (14)" }
                           ListElement { msg: "[14:24:15] CONFIG_PARSER UPDATED ENTRIES (14)" }
                           ListElement { msg: "[14:24:15] CONFIG_PARSER UPDATED ENTRIES (14)" }
                           ListElement { msg: "[14:24:15] CONFIG_PARSER UPDATED ENTRIES (14)" }
                       }

                       delegate: Text {
                           width: logListView.width
                           text: msg
                           color: "#d8c8b8"
                           font.pixelSize: 9
                           font.family: "Consolas"
                           wrapMode: Text.NoWrap
                       }

                       ScrollBar.vertical: ScrollBar {
                           policy: ScrollBar.AsNeeded
                       }

                       onCountChanged: {
                           positionViewAtEnd()
                       }
                   }
               }
           }

       }

       // ================= COMPONENTS =================

       component DateInputBox: ColumnLayout {
           property string labelText: ""

           spacing: 6

           Text {
               text: labelText
               color: "#b8a797"
               font.pixelSize: 10
               font.letterSpacing: 1.5
           }

           Rectangle {
               Layout.preferredWidth: 160
               Layout.preferredHeight: 39
               color: "#0f0f0f"
               border.color: "#4a3324"
               border.width: 1

               TextInput {
                   id: input
                   anchors.fill: parent
                   anchors.leftMargin: 12
                   anchors.rightMargin: 8
                   verticalAlignment: Text.AlignVCenter
                   color: "#e8ddd0"
                   font.pixelSize: 12
                   font.family: "Consolas"

                   Text {
                       anchors.verticalCenter: parent.verticalCenter
                       text: "mm/dd/yyyy"
                       color: "#d8c8b8"
                       font.pixelSize: 12
                       visible: input.text.length === 0
                   }
               }
           }
       }

       component ConfigurationPanel: Rectangle {
           color: "#171717"
           border.color: "#5a3f2c"
           border.width: 1

           ColumnLayout {
               anchors.fill: parent
               anchors.margins: 22
               spacing: 0

               Text {
                   text: "CONFIGURATION"
                   color: "#ffb176"
                   font.pixelSize: 14
                   font.bold: true
                   font.letterSpacing: 4
               }

               Item {
                   Layout.fillWidth: true
                   Layout.fillHeight: true
                   Image{
                      id:uploadImage
                       anchors.centerIn: parent
                      source: "assets/upload.png"
                   }

               }

               Rectangle {
                   Layout.fillWidth: true
                   Layout.preferredHeight: 45
                   color: "#0f0f0f"
                   border.color: "#4a3324"
                   border.width: 1

                   Row {
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.left: parent.left
                       anchors.leftMargin: 12
                       spacing: 10

                       Text {
                           text: "•"
                           color: "#ff9500"
                           font.pixelSize: 14
                       }

                       Text {
                           text: "READY FOR IMPORT_STREAM..."
                           color: "#b57b4f"
                           font.pixelSize: 14
                           font.letterSpacing: 1
                       }
                   }
               }
           }
       }

       component ParamRow: Rectangle {
           property string title: ""
           property string subtitle: ""
           property string valueText: ""
           property bool active: false

           Layout.fillWidth: true
           Layout.fillHeight: true

           color: "#171717"
           border.color: "#4a3324"
           border.width: 1

           Rectangle {
               visible: active
               anchors.left: parent.left
               anchors.top: parent.top
               anchors.bottom: parent.bottom
               width: 4
               color: "#ff9500"
           }

           RowLayout {
               anchors.fill: parent
               anchors.margins: 12
               spacing: 12

               Image {
                  source: "assets/custom.png"
               }

               Column {
                   Layout.fillWidth: true
                   spacing: 2

                   Text {
                       text: title
                       color: "#d8c8b8"
                       font.pixelSize: 14
                       font.letterSpacing: 1.5
                   }

                   Text {
                       text: subtitle
                       color: "#b8a797"
                       font.pixelSize: 12
                   }
               }

               Rectangle {
                   Layout.preferredWidth: 156
                   Layout.preferredHeight: 54
                   color: "#0f0f0f"
                   border.color: "#5a3a20"

                   TextField {
                       anchors.fill: parent
                       text: valueText
                       color: "#81746a"
                       font.pixelSize: 16
                       horizontalAlignment: Text.AlignLeft
                       font.family: "Consolas"
                   }
               }
           }
       }
}
