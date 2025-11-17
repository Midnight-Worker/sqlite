import sqlite3

con = sqlite3.connect(":memory:")  # oder "test.db"
cur = con.cursor()
cur.execute("CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT)")
cur.execute("INSERT INTO test (name) VALUES ('Hallo Welt')")
con.commit()

for row in cur.execute("SELECT * FROM test"):
    print(row)

con.close()

