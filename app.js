const express = require('express')

const app = express()
//导入注册 express-session中间件
// const session = require('express-session')
// app.use(session({
//     secret: 123456,//因为这里不是字符串所以才会有问题
//     resave: false,
//     saveUninitialized: false
// }))

const session = require('express-session')
app.use(session({
  secret: 'iuiouyyefefsdfsdwe097&^*(((', // 表示 用来对 SessionId 加密的 字符串，这个字符串，大家任意写
  resave: false, // 如果为 true ， 表示强制把 Session 存储到 物理磁盘上，从而保证Session不会丢失
  saveUninitialized: false // 如果为 true，表示 强制没有“初始化”的session 保存到storage中
}))
//配置模板引擎
app.set('view engine', 'ejs')
app.set('views', './views')

//托管静态资源
app.use('/node_modules', express.static('./node_modules'))

//导入表单数据处理模块
const bodyParser = require('body-parser')
//注册
app.use(bodyParser.urlencoded({extended: false}))


//导入路由模块
const router = require('./router.js')
//注册路由
app.use(router)

app.listen(3008, () =>{
    console.log('我的博客')
})