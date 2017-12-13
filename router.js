const express = require('express')

const router = express.Router()
const ctrl = require('./controller.js')
const conn = require('./model.js')

router.get('/',ctrl.showIndexPage)

//监听注册页面
router.get('/register',ctrl.showRegPage)

//提交用户并提交用户
router.post('/register', ctrl.regNewUser)

//监听登录页面
router.get('/login', ctrl.showLoginPage)

//提交登录表单并进行登录验证
router.post('/login', ctrl.login)

//注销登录
router.get('/logout', ctrl.logout)

//获取发表文章页面
router.get('/article/add', ctrl.showAddArticlePage)

//发表文章
router.post('/article/add', ctrl.addNewArticle)

//文章详情页
router.get('/article/info', ctrl.showArticleInfoPage)

//获取编辑文章页面
router.get('/article/edit', ctrl.showEditAriticlePage)

//提交编辑页面
router.post('/article/edit', ctrl.editArticle)

module.exports = router