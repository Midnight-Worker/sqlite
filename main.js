import sqlite3 from "sqlite3";
sqlite3.verbose();

const db = new sqlite3.Database(":memory:");

db.serialize(() => {
  db.run("CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT)");
  db.run("INSERT INTO test (name) VALUES ('Hallo Welt')");
  db.each("SELECT * FROM test", (err, row) => {
    console.log(row);
  });
});

db.close();

