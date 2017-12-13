const mysql = require('mysql')

//创建连接
const conn = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '123456',
    database: 'dome',
    multipleStatements: true
})

module.exports = conn