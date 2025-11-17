import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.LocalStorage 2.0

ApplicationWindow {
    visible: true
    width: 300; height: 150; title: "QML + SQLite (mini)"

    Component.onCompleted: {
        const db = LocalStorage.openDatabaseSync("MeineDB", "1.0", "Test", 1000000)
        db.transaction(tx => {
            tx.executeSql("CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY, name TEXT)")
            tx.executeSql("INSERT INTO test (name) VALUES ('Hallo Welt')")
            const rs = tx.executeSql("SELECT name FROM test")
            if (rs.rows.length > 0)
                label.text = rs.rows.item(0).name
        })
    }

    Label {
        id: label
        anchors.centerIn: parent
        text: "(noch nichts)"
    }
}

