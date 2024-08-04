var MONGO_DBNAME="unifi";
var MONGO_USER="unifi";
var MONGO_PASS="unifi";

db.getSiblingDB(MONGO_DBNAME).createUser({
    user: MONGO_USER,
    pwd: MONGO_PASS,
    roles: [
        {
            role: "dbOwner",
            db: MONGO_DBNAME
        },
        {
            role: "dbOwner",
            db: MONGO_DBNAME + "_stat"
        }
    ]
});
